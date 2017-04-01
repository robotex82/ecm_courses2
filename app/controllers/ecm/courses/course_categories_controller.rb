module Ecm::Courses
  class CourseCategoriesController < Ecm::Courses::ApplicationController
    def self.resource_class
      CourseCategory
    end

    def index
      @course_categories = CourseCategory.all
    end

    def show
      @year  = params[:year]  ||= Time.zone.now.year
      @month = params[:month] ||= Time.zone.now.month

      @date = Date.strptime("#{@month}-#{@year}", "%m-%Y")

      @course_category = load_resource
      @courses = @course_category.courses.all
      @course_dates = @courses.reduce([]) { |cd, c| cd << c.course_dates.for_month(@date).all }.flatten

      respond_to do |format|
        format.html
        format.ics do
          send_data @course_category.to_icalendar.to_ical, type: 'text/calendar'
        end
      end
    end

    private

    def resource_class
      self.class.resource_class
    end

    def load_scope
      resource_class.includes(courses: [ :course_dates ]).friendly
    end

    def load_resource
      load_scope.find(params[:id])
    end
  end
end