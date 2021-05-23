class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true, null: false
      t.text :tweet

      t.timestamps
    end
  end
end
