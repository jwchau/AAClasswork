# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#

class Response < ApplicationRecord

  validates :user_id, :answer_choice_id, presence: true

  belongs_to :user

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  


end
