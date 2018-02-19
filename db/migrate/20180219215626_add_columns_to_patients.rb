class AddColumnsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :dob, :string
    add_column :patients, :schedule, :string
    add_column :patients, :status, :string
  end
end
