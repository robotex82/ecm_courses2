# This migration comes from ecm_courses (originally 1)
class CreateEcmCoursesCourseCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :ecm_courses_course_categories do |t|
      t.string :name
      t.text :description
      t.string :locale
      t.integer :position
      t.integer :ecm_courses_courses_count, default: 0, null: false

      # awesome nested set
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      # friendly id
      t.string :slug

      t.timestamps
    end
  end
end
