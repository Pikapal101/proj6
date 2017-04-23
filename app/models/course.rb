class Course < ApplicationRecord
	has_many :term_courses
	has_many :terms, through: :term_courses
end
