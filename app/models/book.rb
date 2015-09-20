class Book < ActiveRecord::Base
  validates :title, :isbn, :authors, presence: true

  scope :ordered, -> { order(:title) }

  def to_s
    title
  end
end
