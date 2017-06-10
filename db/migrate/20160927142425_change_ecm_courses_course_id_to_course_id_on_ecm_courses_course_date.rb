class ChangeEcmCoursesCourseIdToCourseIdOnEcmCoursesCourseDate < ActiveRecord::Migration[4.2]
  def change
    rename_column :ecm_courses_course_dates, :ecm_courses_course_id, :course_id
  end
end
