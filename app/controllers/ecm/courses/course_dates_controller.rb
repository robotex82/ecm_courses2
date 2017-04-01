module Ecm::Courses
  class CourseDatesController < Ecm::Courses::ApplicationController
    def index
      @course_dates = CourseDate.includes(course: [ :course_category ]).all
    end
    
    def show
      @course_date = CourseDate.includes(course: [ :course_category ]).find(params[:id])
    end  
  end
end