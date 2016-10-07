class ChangeEcmCoursesCourseIdToCourseIdOnEcmCoursesCourseDate < ActiveRecord::Migration
  def change
    rename_column :ecm_courses_course_dates, :ecm_courses_course_id, :course_id
  end
end
