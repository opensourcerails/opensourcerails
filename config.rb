###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

require "active_support/all"

activate :bourbon

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

# setup sprockets load paths
handlebars_gem_dir = Gem::Specification.find_by_name("handlebars_assets").gem_dir
set :js_assets_paths, [
  "#{handlebars_gem_dir}/vendor/assets/javascripts/",
]

set :images_dir, 'images'

activate :deploy do |deploy|
  deploy.method = :rsync
  deploy.user = "opensourcerails4"
  deploy.host = "crate.dreamhost.com"
  deploy.path = "/home/opensourcerails4/new.opensourcerails.com"
end

# helpers
require "lib/application_helpers"
helpers ApplicationHelpers

require "lib/tag_helpers"
helpers TagHelpers

page "/bootstrap/*", :layout => "bootstrap_layout"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end