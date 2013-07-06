SocialProdigy::Application.routes.draw do
  # For CORS
  match   '*path' => 'authentications#allow', constraints: {method: 'OPTIONS'}
  # Welcome message
  root    :to => 'application#welcome'
  # Student
  resource :student
end
