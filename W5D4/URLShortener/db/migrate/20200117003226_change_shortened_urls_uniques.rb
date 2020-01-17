class ChangeShortenedUrlsUniques < ActiveRecord::Migration[5.2]
  def change
    change_column :shortened_urls, :long_url, :string, unique: true
    remove_index :shortened_urls, [:long_url, :short_url]
    add_index :shortened_urls, :short_url, unique: true
  end
end
