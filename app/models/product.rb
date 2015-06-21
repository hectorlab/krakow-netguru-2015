class Product < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  belongs_to :category
  belongs_to :user
  has_many :reviews

  def average_rating
    reviews = self.reviews
    review_sum = reviews.reduce(0) { |a, e| a + e.rating }
    (review_sum.to_f / reviews.count.to_f) unless review_sum == 0
  end
end
