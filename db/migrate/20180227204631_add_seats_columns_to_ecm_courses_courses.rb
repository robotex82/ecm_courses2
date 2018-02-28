class AddSeatsColumnsToEcmCoursesCourses < ActiveRecord::Migration[4.2]
  def change
    add_column :ecm_courses_courses, :seats, :integer
    add_column :ecm_courses_courses, :used_seats, :integer
    add_column :ecm_courses_courses, :free_seats, :integer
  end
end
