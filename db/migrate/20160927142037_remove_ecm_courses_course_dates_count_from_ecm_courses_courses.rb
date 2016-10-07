class RemoveEcmCoursesCourseDatesCountFromEcmCoursesCourses < ActiveRecord::Migration
  def change
    remove_column :ecm_courses_courses, :ecm_courses_course_dates_count, :integer
  end
end
