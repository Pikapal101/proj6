term = Term.where(plan_id: plan.id)

json.(plan, :student, :name, :major, :currYear,  :currTerm)

json.terms term do | t |
	#json.(t, :semester, :year)
	
	termcourse = TermCourse.where(term: t)
	json.courses termcourse do |tcourse|
		json.(t, :semester, :year)
		json.name tcourse.course.name
		json.cid tcourse.course.cid
		json.description tcourse.course.description
		json.credits tcourse.course.credits

		#json.(tcourse, :course)
		#json.id tcourse.id
		#json.name tcourse.course.name
		#json.course tcourse.course do | c |
		#	json.id c.id
		#	json.name c.name
		#end
	end
end