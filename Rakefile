require 'rubygems'
PROJECT_ROOT = File.expand_path("../", __FILE__)

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('./Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'active_support/all'

desc "Generate data/github.yml by reading all the projects and querying github for them"
task :github_data do
  # read existing file and see if we need to refetch it
  # TODO

  require 'octokit'
  puts "Generating Github data..."

  # Octokit.netrc = true

  github_data = {}

  project_data = YAML.load_file("#{PROJECT_ROOT}/data/projects.yml")
  project_data.to_a.each do |project|
    next if project["github_project"].blank?

    begin
      # TODO: only write the keys we're going to use
      github_data[project["id"]] = Octokit.repo(project["github_project"]).to_hash
    rescue Octokit::NotFound => e
      puts "Unable to find github project for: #{project['github_project']}"
    end
  end

  # write to file
  yaml_data = "# GITHUB DATA GENERATED: #{Time.now.strftime('%B %d, %Y %I:%m%P')}\n\n"+github_data.to_yaml(:Indent => 2, :UseHeader => false)
  File.open("#{PROJECT_ROOT}/data/github.yml", 'w') {|f| f.write(yaml_data) }
  puts "Generating Github data complete. Data written to #{PROJECT_ROOT}/data/github.yml"
end

desc "Deploy project"
task :deploy do
  puts "Deploying: TODO"

  # first regenerate github data
  Rake::Task["github_data"].invoke

  # run deploy command
  # show a growl alert afterwards
end