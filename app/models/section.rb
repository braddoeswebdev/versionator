class Section < ActiveRecord::Base
  attr_accessible :article_id, :title, :position
  
  belongs_to :article
  has_many :versions
end
