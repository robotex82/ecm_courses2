module Ecm
  module Courses
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:base_controller) { '::ApplicationController' }
    end
  end
end
