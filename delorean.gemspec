$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "delorean/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "delorean_test_bed"
  s.version     = Delorean::VERSION
  s.authors     = ["Stephen Reid","David Harkness","Terminus"]
  s.email       = ["stephen.reid@terminus.com"]
  s.homepage    = "https://github.com/GetTerminus/delorean-rails"
  s.summary     = "A Rails Engine to Control the passage of time as a test bed"
  s.description = "A Rails Engine to Control the passage of time as a test bed"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7.1"
  s.add_dependency "timecop"

  s.add_development_dependency "sqlite3"
end
