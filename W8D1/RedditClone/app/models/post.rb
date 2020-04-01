# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :sub_id, presence: true
    validates :author_id, presence: true
    
    belongs_to :sub,
        foreign_key: :sub_id,
        class_name: :Sub

  
    
    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

        
end
