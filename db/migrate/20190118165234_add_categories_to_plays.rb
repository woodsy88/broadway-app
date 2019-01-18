class AddCategoriesToPlays < ActiveRecord::Migration[5.2]
  def change
    add_reference :plays, :category, foreign_key: true
  end
end
