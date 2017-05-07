Ecm::Courses::Engine.routes.draw do
  localized do
    scope :ecm_courses do
      resources :course_categories, only: [:index, :show]
      resources :courses, only: [:show] do
        member do
          get "calendar", action: :calendar
          get "calendar/:year/:month", action: :calendar
        end
      end
      resources :course_dates, only: [:show]
      
      root to: 'course_categories#index'
    end
  end
end
