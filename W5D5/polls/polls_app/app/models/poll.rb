# == Schema Information
#
# Table name: polls
#
#  id        :bigint           not null, primary key
#  author_id :integer
#  title     :string
#

class Poll < ApplicationRecord

  validates :title, :author_id, presence: true

  has_many :questions

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User


end
