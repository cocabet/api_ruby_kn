Rails.application.routes.draw do
  
  namespace 'api' do
  	resources :activities
  	resources :babies do
  		resources :activity_logs
  	end
  end

end
