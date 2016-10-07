class ChangeEcmCoursesCourseCategoryIdToCourseCategoryIdOnEcmCoursesCourses < ActiveRecord::Migration
  def change
     rename_column :ecm_courses_courses, :ecm_courses_course_category_id, :course_category_id
  end
end
