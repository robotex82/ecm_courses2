module Ecm::Courses
  class CourseDate < ApplicationRecord
    # associations
    belongs_to :course

    has_one :course_category,
            through: :course

    # # attributes
    # attr_accessible :description,
    #                 :ecm_courses_course_id,
    #                 :end_at,
    #                 #                 :slug,
    #                 :start_at

    # callbacks
    after_initialize :set_defaults, if: :new_record?

    # validations
    validates :ecm_courses_course, presence: true
    validates :end_at,             presence: true
    validates :start_at,           presence: true

    def self.for_month(date)
      date ||= Time.zone.now.to_date
      where(start_at: (date.beginning_of_month..(date.end_of_month + 1.day)))
    end

    def duration_in_minutes
      (end_at - start_at).to_i / 60
    end

    def to_s
      "#{I18n.l(start_at)} - #{I18n.l(end_at)}"
    end

    protected

    def set_defaults
      self.start_at ||= 6.hours.from_now.change(min: 0)
      self.end_at   ||= self.start_at + 1.hours
    end
  end
end