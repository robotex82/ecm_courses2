Ecm::Courses::Engine.routes.draw do
  # options.reverse_merge!(
  #   { 
  #     :course_category_actions => [:index, :show], 
  #     :course_date_actions     => [:index, :show],
  #     :course_actions          => [:calendar, :index, :show] 
  #   }
  # )
  localized do
    resources :course_categories # , :only => options[:course_category_actions], :controller => 'ecm/courses/course_categories'
    resources :courses do # , :only => options[:course_actions], :controller => 'ecm/courses/courses' do
      member do
        # if options[:course_actions].include?(:calendar)
          get "calendar", action: :calendar
          get "calendar/:year/:month", action: :calendar
        # end  
      end
    end

    resources :course_dates # , only: options[:course_date_actions] #, controller: 'ecm/courses/course_dates'
  end
end
