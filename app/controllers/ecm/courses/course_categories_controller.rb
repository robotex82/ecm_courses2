module Ecm::Courses
  class CourseCategoriesController < ApplicationController
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
    end

    def ical
      @resource = load_resource
      send_data @resource.to_icalendar.to_ical, type: 'text/calendar' # , disposition: 'inline'
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