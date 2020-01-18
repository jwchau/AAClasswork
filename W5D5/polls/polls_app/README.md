# User
  -username (unique)

# Poll
  -author_id (foreign key)
  -title

# Question
  -poll_id (foreign key)
  -text 

# AnswerChoice
  -question_id (foreign key)
  -text

# Response
  -user_id (foreign key)
  -answer_choice_id (foreign key)
  
