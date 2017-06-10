# This migration comes from ecm_courses (originally 20160927141932)
class RemoveEcmCoursesCoursesCountFromEcmCoursesCourseCategories < ActiveRecord::Migration[4.2]
  def change
    remove_column :ecm_courses_course_categories, :ecm_courses_courses_count, :integer
  end
end
