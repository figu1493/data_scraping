class Product < ActiveRecord::Base
  attr_accessible :name, :price, :size

  validates :name, uniqueness: true
end
