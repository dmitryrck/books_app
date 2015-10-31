class Book < ActiveRecord::Base
  validates :title, :isbn, :authors, presence: true
  validates :isbn, format: /\A\d+\Z/, allow_blank: true
  validates :isbn, uniqueness: true, allow_blank: true

  scope :ordered, -> { order(:title) }

  def to_s
    title
  end
end
