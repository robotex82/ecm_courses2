FactoryGirl.define do
  factory :ecm_courses_course, class: Ecm::Courses::Course do
    sequence(:name) { |i| "Course ##{i}" }
    association :course_category, factory: :ecm_courses_course_category
  end
end
