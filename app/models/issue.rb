class Issue < ActiveRecord::Base
  attr_accessible :content, :status, :title
end
