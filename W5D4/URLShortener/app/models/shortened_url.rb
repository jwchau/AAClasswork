# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord

    validates :user_id, :long_url, presence: true
    validates :short_url, uniqueness: true

    def self.random_code
        code = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(code)
            code = SecureRandom.urlsafe_base64
        end
        code
    end

    def self.create!(user, long_url)
        code = ShortenedUrl.random_code

        ShortenedUrl.create(user_id: user.id, long_url: long_url, short_url: code)
    end

    belongs_to :submitter,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id


end
