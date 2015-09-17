class EditCats < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer, presence: true
  end
end
