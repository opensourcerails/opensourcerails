module ProjectHelpers
  def project_url(project)
    "/#{project.id}/"
  end

  def project_cover_image(project)
    if File.exists?("#{root}/source/screenshots/#{project.id}/cover.jpg")
      "/screenshots/#{project.id}/cover.jpg"
    else
      "/images/simplething/samples/sample.jpg"
    end
  end


  def project_screenshots(project)
    # TODO
    []
  end
end
