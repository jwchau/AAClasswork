require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end




class Questions

  attr_accessor :id, :title, :body, :user_id

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM questions
      WHERE id = ?
    SQL
    Questions.new(*question) unless question.empty?
  end

  def self.find_by_author_id(author_id)
    QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT *
      FROM questions
      WHERE user_id = ?
    SQL
  end

  def author
    Users.find_by_id(self.user_id)
  end

  def replies
    Replies.find_by_question_id(self.id)
  end

  def followers
    QuestionFollows.followers_for_question_id(self.id)
  end

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def likers
    QuestionLikes.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(self.id)
  end

end

class QuestionFollows

  attr_accessor :user_id, :question_id

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_user_id(user_id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM question_follows
      WHERE user_id = ?
    SQL
    QuestionFollows.new(*question_follows) unless question_follows.empty?
  end

  def self.find_by_question_id(question_id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM question_follows
      WHERE question_id = ?
    SQL
    QuestionFollows.new(*question_follows) unless question_follows.empty?
  end

  def self.followers_for_question_id(question_id)
    following = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM users
      JOIN question_follows ON users.id = question_follows.user_id
      WHERE ? = question_follows.question_id
    SQL
    following.map { |hash| Users.new(hash) }
  end

  def self.followed_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM questions
      JOIN question_follows ON question_follows.question_id = questions.id
      WHERE ? = question_follows.user_id
    SQL
    questions.map { |hash| Questions.new(hash) }
  end

  def self.most_followed_questions(n)
    QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT *
      FROM questions
      WHERE questions.id IN (
        SELECT QF.question_id
        FROM questions
        JOIN question_follows AS QF ON QF.question_id = questions.id
        GROUP BY QF.question_id
        ORDER BY COUNT(*) DESC
        LIMIT ?);
    SQL
  end



end

class QuestionLikes

  attr_accessor :user_id, :question_id

  def initialize(options)
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.find_by_user_id(user_id)
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM question_likes AS QL
      WHERE QL.user_id = ?
    SQL
    QuestionLikes.new(*question_likes) unless question_likes.empty?
  end

  def self.find_by_question_id(question_id)
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM question_likes AS QL
      WHERE QL.question_id = ?
    SQL
    QuestionLikes.new(*question_likes) unless question_likes.empty?
  end

  def self.likers_for_question_id(question_id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM users
      JOIN question_likes AS QL ON QL.user_id = users.id
      WHERE ? = QL.question_id
    SQL
  end

  def self.liked_questions_for_user_id(user_id)
    QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM questions
      JOIN question_likes AS QL ON QL.question_id = questions.id
      WHERE ? = QL.user_id
    SQL
  end

  def self.num_likes_for_question_id(question_id)
    hash = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT COUNT(*)
      FROM question_likes AS QL
      WHERE ? = QL.question_id
    SQL
    hash.first["COUNT(*)"]
  end

  def self.most_liked_questions(n)
    QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT *
      FROM questions
      WHERE questions.id IN
        (SELECT QL.question_id
        FROM question_likes AS QL
        GROUP BY QL.question_id
        ORDER BY COUNT(*) DESC
        LIMIT ?);
    SQL
  end



end

class Replies

  attr_accessor :id, :user_id, :question_id, :body, :parent_id

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @body = options['body']
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT *
      FROM replies
      WHERE id = ?
    SQL
    Replies.new(*reply) unless reply.empty?
  end

  def self.find_by_user_id(user_id)
    QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT *
      FROM replies
      WHERE user_id = ?
    SQL
  end

  def self.find_by_question_id(question_id)
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT *
      FROM replies
      WHERE question_id = ?
    SQL
  end

  def self.find_by_parent_id(parent_id)
    QuestionsDatabase.instance.execute(<<-SQL, parent_id)
      SELECT *
      FROM replies
      WHERE parent_id = ?
    SQL
  end

  def author
    Users.find_by_id(self.user_id)
  end

  def question
    Questions.find_by_id(self.question_id)
  end

  def parent_reply
    Replies.find_by_id(self.parent_id)
  end

  def child_replies
    Replies.find_by_parent_id(self.id)
  end

end