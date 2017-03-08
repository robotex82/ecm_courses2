require 'rails_helper'

describe 'ActiveRecord::Base models' do
  %w(Ecm::Courses::CourseCategory Ecm::Courses::Course Ecm::Courses::CourseDate).each do |model_name|
    model = model_name.constantize
    
    describe model do
      it 'should be an ActiveRecord::Base' do
        expect(ActiveRecord::Base.descendants).to include(model)
      end
      describe do
        subject { model.new }

        it 'should be instanciable' do
          expect(subject).to be_a(model) 
        end

        it 'should not be valid with empty attributes' do
          expect(subject).not_to be_valid
        end
      end

      describe do
        subject { build(model.to_s.tableize.singularize.underscore.tr('/', '_')) }

        it 'should be valid with correct attribute values' do
          expect(subject).to be_valid
        end

        it 'should save with valid attributes' do
          expect(subject.save).to be_truthy
          expect(subject.persisted?).to be_truthy
        end
      end
    end
  end
end
