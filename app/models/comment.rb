class Comment < ActiveRecord::Base
  attr_accessible :content, :issue_id, :user_id
  belongs_to :user
  belongs_to :issue
end
