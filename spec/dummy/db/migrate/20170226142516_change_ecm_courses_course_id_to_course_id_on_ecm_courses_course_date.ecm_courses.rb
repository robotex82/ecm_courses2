# This migration comes from ecm_courses (originally 20160927142425)
class ChangeEcmCoursesCourseIdToCourseIdOnEcmCoursesCourseDate < ActiveRecord::Migration[4.2]
  def change
    rename_column :ecm_courses_course_dates, :ecm_courses_course_id, :course_id
  end
end
