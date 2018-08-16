class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  CATEGORY = %w[chinese italian japanese french belgian].freeze

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: CATEGORY }

  def avg_rating
    total = reviews.to_a.reduce(0) { |sum, rev| sum + rev.rating }
    (total / reviews.count.to_f).round(1)
  end
end
