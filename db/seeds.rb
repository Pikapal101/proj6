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
terms = Term.create([{plan: plans.first, semester: "Fall", year: 2017}, {plan: plans.first, semester: "Spring", year: 2017}, {plan: plans.first, semester: "Summer", year: 2017}, {plan: plans.first, semester: "Fall", year: 2018}, {plan: plans.first, semester: "Spring", year: 2018}, {plan: plans.first, semester: "Summer", year: 2018}, {plan: plans.first, semester: "Fall", year: 2019}, {plan: plans.first, semester: "Spring", year: 2019}, {plan: plans.second, semester: "Fall", year: 2017}, {plan: plans.second, semester: "Spring", year: 2017}, {plan: plans.second, semester: "Fall", year: 2018}, {plan: plans.second, semester: "Spring", year: 2018}, {plan: plans.second, semester: "Fall", year: 2019}, {plan: plans.second, semester: "Spring", year: 2019}])

#add courses
courses = Course.create([{cid: "CS-200", name: "Foundations", credits: 3, description: "Fun"}, {cid: "MATH-1", name: "Calculus", credits: 5, description: "not so fun"}, {cid: "BLEH-101", name: "PAC", credits: 2, description: "do lots of stuff"}, {cid: "MATH-2", name: "Calculus II", credits: 5, description: "more math"}, {cid: "HIST-1000", name: "U.S. History", credits: 3, description: "First half of U.S. History"}, {cid: "HIST-1001", name: "U.S. History II", credits: 3, description: "Second half of U.S. History"}, {cid: "CS-300", name: "Linux Programming", credits: 3, description: "Make Telnet in Assembly. Child's play"}, {cid: "CS-400", name: "Cyber Operations", credits: 3, description: "Fun to the MAX"}, {cid: "CS-500", name: "Software Security", credits: 3, description: "Fun x10"}, {cid: "CS-600", name: "OS", credits: 3, description: "This could be fun"}, {cid: "CS-001", name: "C++/OOD", credits: 3, description: "Beginner Programming"}, {cid: "CS-002", name: "Java", credits: 3, description: "Int. Programming"}])

#add term courses
TermCourse.create([{term: terms[0], course: courses[0]}, {term: terms[0], course: courses[1]}, {term: terms[0], course: courses[2]}, {term: terms[0], course: courses[3]}, {term: terms[0], course: courses[4]}, {term: terms[1], course: courses[5]}, {term: terms[1], course: courses[6]}, {term: terms[1], course: courses[7]}, {term: terms[1], course: courses[8]}, {term: terms[1], course: courses[9]}, {term: terms[2], course: courses[10]}, {term: terms[3], course: courses[11]}, {term: terms[8], course: courses[0]}, {term: terms[8], course: courses[2]}, {term: terms[9], course: courses[1]}, {term: terms[10], course: courses[6]}, {term: terms[10], course: courses[8]}, {term: terms[11], course: courses[9]}, {term: terms[12], course: courses[10]}, {term: terms[12], course: courses[11]}])
