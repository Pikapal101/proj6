terms = Term.where(plan_id: plan.id)
#termcourse = TermCourse.where()

termcourse = TermCourse.where(term_id: terms.ids)

courses = termcourse.where()

json.array!termcourse do |t2|
    json.(t2, :term, :course)

end

