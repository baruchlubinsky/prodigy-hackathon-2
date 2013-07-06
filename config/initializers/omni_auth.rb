OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 273467806127129, 063c7844a7f0a894f64009ed19eeac71
end