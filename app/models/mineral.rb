class Mineral < ActiveRecord::Base
  belongs_to :smithsonian
  
  has_many :mineral_checkouts
  has_many :scientists, through: :mineral_checkouts
end
