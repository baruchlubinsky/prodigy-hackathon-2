class StudentController < ApplicationController
	before_filter :require_admin, only: ['index', 'show']
	def create
		@student = Student.new(params[:student])
		if @student.save
			render json: {student: @student}, status: 200
		else
			render json: {student: @student}, status: 422
		end
	end
	def show
		@student = Student.find(params[:id])
		render json: {student: @student}, status: 200
	end
	def index
		@student = Student.all
		render json: {students: @students}, status: 200
	end
	def update
		@student = Student.find(params[:id])
		@student.updateParameters(params[:student])
		if @student.save
			render json: {student: @student}, status: 200
		else
			render json: {student: @student}, status: 422
		end
	end
	def destroy
		@student = Student.find(params[:id])
		@student.delete
		render json: {success: 'Destroyed'}, status: 200
	end
	def create_or_update
		begin
			@student = Student.find_by(email: params[:email])
		rescue Mongoid::Errors::DocumentNotFound
			@student = Student.create(email: params[:email])
			@student.save
		end
		@student.update_attributes(params[:student])
		@student.save
		render json: {success: 'saved details'}, status: 201
	end
	def get_friends_count
		begin
			@student = Student.find_by(email: params[:email])
		rescue Mongoid::Errors::DocumentNotFound
			render json: {error: 'email not found'}
		end 
		url = "https://graph.facebook.com/#{@student.facebook['userID']}?fields=friends&access_token=#{@student.facebook['accessToken']}"
		puts url
		RestClient.get(url) do |response, request, result|
	    	if result.code == "200"
	        	render json: {count: JSON.parse(response.body)['friends']['data'].count}, status: 200
	    	else
	        	render json: {error: response.body}
	      	end
	    end
	end
end
