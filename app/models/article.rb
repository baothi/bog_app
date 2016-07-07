class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  
  default_scope 
  belongs_to :user
end
