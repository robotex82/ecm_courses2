module Ecm::Courses
  class CourseCategory < ApplicationRecord
    module Icalendar
      def to_icalendar
        calendar = ::Icalendar::Calendar.new
        courses.map { |c| c.to_icalendar_events(calendar) }
        calendar
      end
    end

    include Icalendar

    # associations
    has_many :courses, ->() { order(:position) },
             dependent: :destroy

    # awesome nested set
    acts_as_nested_set
    default_scope { order('lft ASC')  }

    # friendly id
    extend FriendlyId
    friendly_id :name, use: [:slugged]

    # validations
    validates :name,   presence: true, uniqueness: { scope: [:parent_id] }
    validates :locale, presence: true, if: :root?
    validates :locale, inclusion: { in: I18n.available_locales.map(&:to_s) }, allow_blank: true
    validates :locale, absence: true, unless: :root?

    def index_name
      if root?
        #{ }"[#{locale}] #{name}"
      else
        "#{'&#160;&#160;&#160;&#160;' * level} |--&#160;#{name}".html_safe
      end
    end

    def to_s
      name
    end

    def courses_count
      courses.count
    end

    def tree_name
      # root_prefix = root? ? "[#{locale}] " : ''

      if courses_count < 1
        self
      else
        "#{self} (#{courses_count})"
      end
    end
  end
end