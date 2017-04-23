json.extract! plan, :id, :name, :currYear, :major, :student, :currTerm

terms = Term.where(plan_id: @plan.id)
termcourse = TermCourse.where(term_id: terms.ids)
courses = Course.where(term_course: termcourse)

json.courses courses do |course|
		json.name course.name
end

json.url plan_url(plan, format: :json)
