json.extract! plan, :id, :name, :currYear, :major, :student, :currTerm

terms = Term.where(plan_id: @plan.id)
termcourse = TermCourse.where(term_id: terms.ids)

json.url plan_url(plan, format: :json)
