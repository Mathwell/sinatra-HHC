class CreateNurses < ActiveRecord::Migration
  def change
    create_table :nurses do |t|
    t.string :first_name
    t.string :last_name
  end
  end
end
