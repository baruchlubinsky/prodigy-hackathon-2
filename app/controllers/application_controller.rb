class ApplicationController < ActionController::API
  rescue_from Mongoid::Errors::DocumentNotFound, with: :document_not_found
  rescue_from Mongoid::Errors::InvalidFind, with: :parameters_missing
  before_filter :cors
  def welcome
  	render json: {success: 'Welcome to the prodigy social API.'}, status: 200
  end
  def require_admin
    if params['api_key'].nil?
      render json: {'error' => 'You must be authenticated to perform that action. No api_key was provided.'}, status: 401
      return false
    end
    if params['api_key'] == 'adminpassword'
      @admin = true
    end
  end
  def document_not_found
    render json: {error: "Document not found"}, status: 422
  end

  def parameters_missing
    render json: {error: "Cannot complete that request with the provided parameters."}, status: 400
  end

	def cors
    response.headers.merge! 'Access-Control-Allow-Origin' => '*', 'Access-Control-Allow-Methods' => 'POST, PUT, GET, DELETE', 'Access-Control-Allow-Headers' => 'Origin, Accept, Content-Type'
  end
end
