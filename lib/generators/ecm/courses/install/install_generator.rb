module Ecm
  module Courses
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc "Generates the initializer"

        source_root File.expand_path('../templates', __FILE__) 
        
        def generate_intializer
          copy_file "ecm_courses.rb", "config/initializers/ecm_courses.rb"
        end   

        def generate_routes
          inject_into_file 'config/routes.rb', before: "\nend" do
            File.read(File.join(File.expand_path('../templates', __FILE__), 'routes.source'))
          end
        end
      end
    end
  end
end        
