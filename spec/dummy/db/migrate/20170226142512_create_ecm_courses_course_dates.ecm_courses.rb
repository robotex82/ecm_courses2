# This migration comes from ecm_courses (originally 3)
class CreateEcmCoursesCourseDates < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_courses_course_dates do |t|
      t.timestamp :start_at
      t.timestamp :end_at
      t.text :description

      # references
      t.integer :ecm_courses_course_id

      #      # friendly id
      #      t.string :slug

      t.timestamps
    end
  end
end
