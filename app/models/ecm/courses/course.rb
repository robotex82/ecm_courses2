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