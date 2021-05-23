class RenameFromTweetToContent < ActiveRecord::Migration[6.1]
  def change
    rename_column :tweets, :tweet, :content
  end
end
