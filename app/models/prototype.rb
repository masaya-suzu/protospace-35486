class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :prototype_title, presence: true
  validates :prototype_catch_copy, presence: true
  validates :prototype_concept, presence: true
  validates :image, presence: true

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end
