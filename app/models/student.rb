class Student
	include Mongoid::Document
	field :name, type: String
	field :email, type: String
	field :facebook, type: Hash
	field :twitter, type: Hash
	field :googleplus, type: Hash
end