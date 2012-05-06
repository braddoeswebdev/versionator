class Article < ActiveRecord::Base
  attr_accessible :name, :position

  has_many :sections
end
