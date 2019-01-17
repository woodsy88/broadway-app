class AddUserIdToPlays < ActiveRecord::Migration[5.2]
  def change
    add_reference :plays, :user, foreign_key: true
  end
end
