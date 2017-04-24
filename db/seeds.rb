# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.new
user1.login = "joe"
user1.email = "joe@cedarville.edu"
user1.password = "password"
user1.password_confirmation = "password"
user1.save!

user2 = User.new
user2.login = "pete"
user2.email = "pete@cedarville.edu"
user2.password = "password"
user2.password_confirmation = "password"
user2.save!

#give joe a couple of plans
plans = Plan.create([{user_id: user1.id, name: "Plan1", currYear: 2017, major: "CS", student: user1.login, currTerm:"Spring"}, {user_id: user1.id, name: "Plan2", currYear: 2017, major: "Marketing", student: user1.login, currTerm:"Spring"}])

#add terms to plans
terms = Term.create([{plan: plans.first, semester: "Fall", year: 2017} ,{plan: plans.first, semester: "Spring", year: 2018} ,{plan: plans.first, semester: "Fall", year: 2018}, {plan: plans.first, semester: "Spring", year: 2019}, {plan: plans.first, semester: "Fall", year: 2019}, {plan: plans.first, semester: "Spring", year: 2020}, {plan: plans.second, semester: "Fall", year: 2017}, {plan: plans.second, semester: "Spring", year: 2018}, {plan: plans.second, semester: "Fall", year: 2018}, {plan: plans.second, semester: "Spring", year: 2019}, {plan: plans.second, semester: "Fall", year: 2019}, {plan: plans.second, semester: "Spring", year: 2020}])

#add courses
courses = Course.create([{cid: "CS-200", name: "Foundations", credits: 3, description: "Fun"}, {cid: "MATH-1", name: "Calculus", credits: 5, description: "not so fun"}, {cid: "BLEH-101", name: "PAC", credits: 2, description: "do lots of stuff"}, {cid: "MATH-2", name: "Calculus II", credits: 5, description: "more math"}, {cid: "HIST-1000", name: "U.S. History", credits: 3, description: "First half of U.S. History"}])

#add term courses
TermCourse.create([{term: terms.first, course: courses.first}, {term: terms.first, course: courses.second}, {term: terms.first, course: courses.third}])
