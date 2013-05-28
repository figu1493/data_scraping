class Product < ActiveRecord::Base
  attr_accessible :name, :price, :size
end
