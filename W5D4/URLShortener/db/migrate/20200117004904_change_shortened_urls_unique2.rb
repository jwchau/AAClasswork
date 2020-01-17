class ChangeShortenedUrlsUnique2 < ActiveRecord::Migration[5.2]
  def change
    change_column :shortened_urls, :long_url, :string, unique: false
    change_column :shortened_urls, :short_url, :string, unique: false
    remove_index :shortened_urls, :short_url
    add_index :shortened_urls, [:long_url, :short_url], unique: true
  end
end
