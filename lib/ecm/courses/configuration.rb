module Ecm
  module Courses
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:base_controller) { '::ApplicationController' }

      mattr_accessor(:show_free_places) { false }

      mattr_accessor(:free_seats_level_proc) do
        lambda do |course|
          {
            0..9    => { color: 'red' },
            10..69  => { color: 'yellow' },
            70..100 => { color: 'green' }
          }
        end
      end

      def self.free_seats_level_for(course)
        free_seats_level_proc.call(course).select { |percentage| percentage === course.free_seats_percentage }
      end
    end
  end
end
