xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Open Source Rails Blog"
  xml.subtitle "tracking the best Open Source Rails apps"
  xml.id "http://opensourcerails.com/blog/"
  xml.link "href" => "http://opensourcerails.com/blog/"
  xml.link "href" => "http://opensourcerails.com/blog/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601

  xml.author { xml.name "Blog Author" }

  blog.articles[0..15].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Article Author" }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end