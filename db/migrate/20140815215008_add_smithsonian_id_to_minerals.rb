class AddSmithsonianIdToMinerals < ActiveRecord::Migration
  def change
    add_column :minerals, :smithsonian_id, :integer
  end
end
