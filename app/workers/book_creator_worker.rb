class BookCreatorWorker
  include Sidekiq::Worker

  def perform(isbn, quantity = 0)
    creator = BookCreator.new(isbn)
    creator.get_attributes

    book = creator.book
    book.quantity = quantity unless quantity.to_i.zero?
    book.save
  end
end
