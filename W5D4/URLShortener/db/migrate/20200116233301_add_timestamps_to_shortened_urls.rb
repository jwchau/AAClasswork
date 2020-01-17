class AddTimestampsToShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :shortened_urls
  end
end
