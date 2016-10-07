$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'ecm/courses/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'ecm_courses2'
  s.version     = Ecm::Courses::VERSION
  s.authors     = ['Roberto Vasquez Angel']
  s.email       = ['roberto@vasquez-angel.de']
  s.homepage    = 'https://github.com/robotex82/ecm_courses2'
  s.summary     = 'Ecm::Courses.'
  s.description = 'Ecm::Courses Module.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'spec/factories/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '>= 4.0'
  s.add_dependency 'friendly_id'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'route_translator'
end
