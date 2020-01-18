class GreatMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, unique: true, presence: true

      t.timestamp
    end

    create_table :polls do |t|
      t.integer :author_id, presence: true
      t.string :title, presence: true

      t.timestamp
    end

    create_table :questions do |t|
      t.integer :poll_id, presence: true
      t.string :text, presence: true

      t.timestamp
    end


    create_table :answer_choices do |t|
      t.integer :question_id, presence: true
      t.string :text, presence: true

      t.timestamp
    end

    create_table :responses do |t|
      t.integer :user_id, presence: true
      t.integer :answer_choice_id, presence: true

      t.timestamp
    end

  end
end
