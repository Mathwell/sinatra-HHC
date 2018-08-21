class AddColumnsToNurses < ActiveRecord::Migration
  def change
    add_column :nurses, :user_id, :integer

  end
end
