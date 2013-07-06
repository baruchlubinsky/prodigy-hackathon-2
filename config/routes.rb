SocialProdigy::Application.routes.draw do
  # For CORS
  match   '*path' => 'authentications#allow', constraints: {method: 'OPTIONS'}
  # Welcome message
  root    :to => 'application#welcome'
  # Student
  # resource :student
  post    'student/details' => 'student#create_or_update'
  get 	  'students/friend_count' => 'student#get_friends_count'
  # Dummy data
  get 	  'dummy/student' => 'dummy#student'
end
