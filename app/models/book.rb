class Book < ActiveRecord::Base
  validates :title, :isbn, :authors, presence: true

  def to_s
    title
  end
end
