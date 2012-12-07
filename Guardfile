group 'assets' do

  # Reload the browser as asset files change
  guard 'livereload', :apply_js_live => false do
    watch(%r{^source/.+\.(erb|haml)$})
    watch(%r{^(source).+\.(css|js|html)$})
    watch(%r{^(source/.+\.css)\.s[ac]ss$}) { |m| m[1] }
    watch(%r{^(source/.+\.js)\.coffee$}) { |m| m[1] }
  end

  # prevalidate coffeescript syntax on save
  guard 'coffeescript', :input => 'source/javascripts', :noop => true #, :hide_success => true
end

