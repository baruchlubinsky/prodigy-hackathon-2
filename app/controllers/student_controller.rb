class StudentController < ApplicationController
	before_filter: :require_admin, only: ['index', 'show']
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
end
