class Book < ActiveRecord::Base
  validates :title, :isbn, :authors, presence: true
end
