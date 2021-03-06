class Review < ActiveRecord::Base
  validates :user_id, presence: true	
  validates :content, presence: true
  validates :rating, presence: true

  belongs_to :product
  belongs_to :user
end
