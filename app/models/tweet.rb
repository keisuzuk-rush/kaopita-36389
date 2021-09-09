class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_one_attached :image

  validates :text, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
