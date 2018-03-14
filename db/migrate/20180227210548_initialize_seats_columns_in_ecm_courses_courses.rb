class InitializeSeatsColumnsInEcmCoursesCourses < ActiveRecord::Migration[4.2]
  class Ecm::Courses::Course < ActiveRecord::Base; end

  def up
    Ecm::Courses::Course.update_all(seats: 0, used_seats: 0, free_seats: 0)
  end

  def down
    Ecm::Courses::Course.update_all(seats: nil, used_seats: nil, free_seats: nil)
  end
end
