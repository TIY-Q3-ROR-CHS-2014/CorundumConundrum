class Mineral < ActiveRecord::Base
  belongs_to :smithsonian
  
  has_many :mineral_checkouts
  has_many :scientists, through: :mineral_checkouts

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
