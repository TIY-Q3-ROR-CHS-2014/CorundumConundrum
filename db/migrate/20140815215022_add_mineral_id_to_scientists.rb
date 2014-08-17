class AddMineralIdToScientists < ActiveRecord::Migration
  def change
    add_column :scientists, :mineral_id, :integer
  end
end
