module Ecm::Courses
  class Course < ApplicationRecord
    module Icalendar
      def to_icalendar_events(calendar)
        course_dates.map do |cd|
          calendar.event do |e|
            e.dtstart     = cd.start_at
            e.dtend       = cd.end_at
            e.summary     = name
            e.description = description
            # e.ip_class    = "PRIVATE"
          end
        end
      end
    end

    include Icalendar

    module Seats
      extend ActiveSupport::Concern

      included do
        after_initialize :set_seats_defaults, if: :new_record?
        before_validation :calculate_free_seats

        validates :used_seats, numericality: { greater_than_or_equal_to: 0 }
        validates :free_seats, numericality: { greater_than_or_equal_to: 0 }
      end

      def free_seats_percentage
        percentage = free_seats.to_f / seats.to_f * 100
        percentage.nan? ? 0 : percentage
      end

      def free_seats_level
        Ecm::Courses::Configuration.free_seats_level_for(self)
      end

      def free_seats_level_properties
        free_seats_level.values.first
      end

      def free_seats_level_range
        free_seats_level.keys.first
      end
   
      private

      def set_seats_defaults
        self.seats      ||= 0
        self.free_seats ||= 0
        self.used_seats ||= 0
      end

      def calculate_free_seats
        self.free_seats = seats - used_seats
      end
    end

    include Seats

    # acts as list
    acts_as_list scope: :course_category

    # associations
    belongs_to :course_category

    has_many :course_dates, ->() { order(:start_at) },
             dependent: :destroy

    # friendly id
    extend FriendlyId
    friendly_id :name, use: [:slugged]

    # scopes
    # @todo check ordering
    # default_scope { includes(:course_category).order('ecm_courses_course_categories.name, ecm_courses_courses.position ASC') }

    # validations
    validates :course_category, presence: true
    validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }, allow_blank: true
    validates :name, presence: true

    def heading_name
      # locale_prefix = locale.blank? ? '' : "[#{locale}] "
      # "#{locale_prefix}#{name}"
      name
    end

    def to_s
      "#{course_category.name} - #{name}"
    end
  end
end