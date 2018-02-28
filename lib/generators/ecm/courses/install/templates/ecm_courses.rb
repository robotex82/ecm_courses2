Ecm::Courses.configure do |config|
  # Set the base controller
  #
  # Default: config.base_controller = '::ApplicationController'
  #
  config.base_controller = '::ApplicationController'

  # Set the colours and thresholds for free seats.
  #
  # Default:
  #
  #     config.free_seats_levels_proc = ->(course) do
  #       {
  #         0..9    => { css_class: 'danger' },
  #         10..69  => { css_class: 'warning' },
  #         70..100 => { css_class: 'success' }
  #       }
  #     end
  #
  config.free_seats_level_proc = ->(course) do
    {
      0..9    => { css_class: 'danger' },
      10..69  => { css_class: 'warning' },
      70..100 => { css_class: 'success' }
    }
  end

  # Show the free places label when displaying a course.
  #
  # Default: config.show_free_places = false
  #
  config.show_free_places = true
end
