class Review < ApplicationRecord
  AUTHORIZED_RATINGS = (1..5)

  before_validation :set_defaults
  belongs_to :list
  validates :content, presence: true
  validates :rating, inclusion: { in: (0..5) }, numericality: { only_integer: true }

  private

  def set_defaults
    self.rating = 0 if rating.blank?
  end
end
