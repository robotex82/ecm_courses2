module Ecm::Courses
  class CoursesController < Ecm::Courses::ApplicationController
    def self.resource_class
      Course
    end

    def calendar
      @year  = params[:year]  ||= Time.zone.now.year
      @month = params[:month] ||= Time.zone.now.month

      @date = Date.strptime("#{@month}-#{@year}", "%m-%Y")

      @course = load_resource
      @course_dates = @course.course_dates.for_month(@date).all
    end
    
    def index
      @courses = load_collection
    end
    
    def show
      @course = load_resource
    end

    private

    def load_collection
      load_scope.all
    end

    def resource_class
      self.class.resource_class
    end

    def load_scope
      resource_class.includes(:course_category, :course_dates)
    end

    def load_resource
      load_scope.friendly.find(params[:id])
    end
  end
end