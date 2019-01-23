class AddPlayIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :play, foreign_key: true
  end
end
