# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

bob = User.create(username: 'bob_123')
sf = User.create(username: 'sfbadboy')
mon = User.create(username: 'MondayBlues')
naruto = User.create(username: 'naruto415')
wack = User.create(username: 'WackDaniels')
big = User.create(username: 'BigBoi')
liz = User.create(username: 'Lizagna')
justin = User.create(username: 'JustinBieberFan')
direction = User.create(username: '1DirectionFan')
min = User.create(username: '15minTimer')



Poll.destroy_all

p1 = Poll.create(author_id: sf.id, title: 'San Francisco')
p2 = Poll.create(author_id: bob.id, title: 'Basketball')
p3 = Poll.create(author_id: mon.id, title: 'Turtles')
Poll.create(author_id: wack.id, title: 'Dogs')
Poll.create(author_id: liz.id, title: 'Waking up in the morning')
p6 = Poll.create(author_id: direction.id, title: 'Justin Bieber')
p7= Poll.create(author_id: min.id, title: 'App Academy')


Question.destroy_all

q1 = Question.create(poll_id: p1.id, text: "Why is there so much pooop?")
Question.create(poll_id: p1.id, text: "Why is it so cold?")
q3 = Question.create(poll_id: p2.id, text: "Lebron James or Kobe Bryant?")
q4 = Question.create(poll_id: p2.id, txt: "Favorites to win 2020 Playoffs")
Question.create(poll_id: p3.id, text: "Why are turtles green?")
q6 = Question.create(poll_id: p6.id, text: "Who is Justin Bieber?")
Question.create(poll_id: p6.id, text: "What is Justin Bieber's favorite drink?")
q8 = Question.create(poll_id: p7.id, text: "Which instructor for president in 2024?")


AnswerChoice.destroy_all

a1 = AnswerChoice.create(question_id: q1.id, text: "Because everybody poops")
a2 = AnswerChoice.create(question_id: q1.id, text: "Because people are nasty")
a3 = AnswerChoice.create(question_id: q3.id, text: "Kobe Bryant")
a4 = AnswerChoice.create(question_id: q3.id, text: "Lebron James")
a5 = AnswerChoice.create(question_id: q3.id, text: "Michael Jordan")
a6 = AnswerChoice.create(question_id: q4.id, text: "Knicks")
a7 = AnswerChoice.create(question_id: q4.id, text: "Lakers")
a8 = AnswerChoice.create(question_id: q4.id, text: "Bucks")
a9 = AnswerChoice.create(question_id: q6.id, text: "I dunno know ¯\_(ツ)_/¯")
a10 = AnswerChoice.create(question_id: q8.id, text: "Ryan Mapa 2024")


Response.destroy_all


Response.create(user_id: bob.id, answer_choice_id: a1.id)
Response.create(user_id: sf.id, answer_choice_id: a2.id)
Response.create(user_id: mon.id, answer_choice_id: a3.id)
Response.create(user_id: naruto.id, answer_choice_id: a4.id)
Response.create(user_id: wack.id, answer_choice_id: a5.id)
Response.create(user_id: big.id, answer_choice_id: ) 
Response.create(user_id: liz.id, answer_choice_id: )
Response.create(user_id: justin.id, answer_choice_id: )
Response.create(user_id: direction.id, answer_choice_id: )
Response.create(user_id: min.id, answer_choice_id: )
Response.create(user_id: naruto.id, answer_choice_id: )
Response.create(user_id: naruto.id, answer_choice_id: )
Response.create(user_id: big.id, answer_choice_id: )
Response.create(user_id: big.id, answer_choice_id: )
Response.create(user_id: wack.id, answer_choice_id: )
Response.create(user_id: wack.id, answer_choice_id: )


# bob = User.create(username: 'bob_123')
# sf = User.create(username: 'sfbadboy')
# mon = User.create(username: 'MondayBlues')
# naruto = User.create(username: 'naruto415')
# wack = User.create(username: 'WackDaniels')
# big = User.create(username: 'BigBoi')
# liz = User.create(username: 'Lizagna')
# justin = User.create(username: 'JustinBieberFan')
# direction = User.create(username: '1DirectionFan')
# min = User.create(username: '15minTimer')