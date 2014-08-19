class AddAvatarToMinerals < ActiveRecord::Migration
  def change
    add_column :minerals, :avatar, :string
  end
end
