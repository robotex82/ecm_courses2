module Ecm
  module Courses
    module ApplicationHelper
      def free_places_label_for(course)
        render partial: 'ecm/courses/course_categories/free_seats', locals: { course: course }
      end
    end
  end
end
