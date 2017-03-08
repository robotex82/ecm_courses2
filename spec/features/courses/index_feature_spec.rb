require 'rails_helper'

RSpec.describe 'courses index', type: :feature do
  let(:course_index_path) { '/de/kurse/courses' }

  context 'basic access' do
    before(:each) do
      visit course_index_path
    end

    it { expect(page.status_code).to eq(200) }
    it { expect(current_path).to eq(course_index_path) }
  end
  

  context 'with a course with course dates' do
    let(:course)           { create(:ecm_courses_course) }
    let(:course_date)      { create(:ecm_courses_course_date, course: course) }
    let(:course_date_path) { "/de/kurse/course_dates/#{course_date.to_param}" }

    before(:each) do
      course
      course_date
      visit course_index_path
    end


    it { expect(page.status_code).to eq(200) }
    it { expect(current_path).to eq(course_index_path) }
    it { expect(page.body).to include(course.name) }
    it { expect(page.body).to have_link(nil, href: course_date_path) }
  end
end