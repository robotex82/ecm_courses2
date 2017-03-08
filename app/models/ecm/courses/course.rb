module Ecm::Courses
  class Course < ApplicationRecord
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
    default_scope { includes(:course_category).order('ecm_courses_course_categories.name, ecm_courses_courses.position ASC') }

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