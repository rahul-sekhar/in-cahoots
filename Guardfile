# Guardfile used to live-reload CSS changes
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css))).*}) { |m| "/assets/#{m[3]}" }
end
