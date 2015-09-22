class BookCreatorWorker
  include Sidekiq::Worker

  def perform(isbn)
    BookCreator.create(isbn)
  end
end
