class AddAttachmentAvatarToMinerals < ActiveRecord::Migration
  def self.up
    change_table :minerals do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :minerals, :avatar
  end
end
