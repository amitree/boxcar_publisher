Gem::Specification.new do |spec|
  spec.name         = 'boxcar_publisher'
  spec.version      = '1.0.1'
  spec.date         = Date.today.to_s
  spec.summary      = "Publisher API for boxcar.io"
  spec.description  = "Send push notifications with Boxcar.io"
  spec.authors      = ["Tony Novak"]
  spec.email        = 'tony@amitree.com'
  spec.files        = Dir["{lib,spec,vendor}/**/*", "[A-Z]*"] - ["Gemfile.lock"]
  spec.homepage     = 'http://rubygems.org/gems/boxcar_publisher'
  spec.license      = 'MIT'

  spec.add_runtime_dependency 'faraday', '>= 0.8'
  spec.add_runtime_dependency 'faraday_middleware', '>= 0'
end
