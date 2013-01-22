# require 'image_size'
module ProjectHelpers
  def project_url(project)
    "/#{project.id}/"
  end

  def project_cover_image(project)
    if File.exists?("#{root}/source/screens/#{project.id}/cover.jpg")
      "/screens/#{project.id}/cover.jpg"
    else
      "/img/simplething/samples/sample.jpg"
    end
  end

  # returns an array of Hashes, one for each associated project screenshot
  # include fields for :src, :index, :width, and :height
  def project_screens(project)
    imgs = []

    files = Dir.glob("#{root}/source/screens/#{project.id}/**/screen*", File::FNM_CASEFOLD)
    files.each_with_index do |file, index|
      next if File.directory?(file)

      img = {}.with_indifferent_access
      img[:src] = file.gsub("#{root}/source", "")
      img[:index] = index+1

      # # set width/height programatically
      # open(file, "rb") do |fh|
      #   size = ImageSize.new(fh.read).get_size
      #   img[:width] = size.first
      #   img[:height] = size.last
      # end

      imgs << img
    end

    imgs
  end

  def project_description(project)
    Redcarpet.new(project.description.to_s, :smart, :fenced_code).to_html
  end

  def similar_projects(project)
    projects = []

    # find projects with matching categories
    data.projects.each do |data_project|
      next if data_project.id == project.id
      data_project.categories.to_a.each do |category|
        projects << data_project if project.categories.to_a.include?(category)
        break
      end
    end

    projects
  end

  def github_data(project)
    begin
      github_data = data.try(:github).try("#{project.id}")
    rescue Exception => e
      github_data = []
    end
  end

  def github_data_attributes(project)
    github_data_attributes = ""

    github_data = github_data(project)
    if github_data.present?
      github_data_attributes << "data-watchers='#{github_data.watchers}' "
      github_data_attributes << "data-created-at='#{github_data.created_at}' "
      github_data_attributes << "data-pushed-at='#{github_data.pushed_at}' "
    end

    github_data_attributes
  end

  def get_project(project_id)
    data.projects.each do |project|
      return project if project.id == project_id
    end

    nil
  end
end
