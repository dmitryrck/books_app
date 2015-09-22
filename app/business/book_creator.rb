class BookCreator
  attr_reader :isbn

  delegate :title, :authors, :year_published, :image_link, :persisted?, :save,
    to: :book, allow_nil: true

  def initialize(isbn)
    @isbn = isbn
  end

  def self.create(isbn)
    creator = new(isbn)
    creator.get_attributes
    creator.save
    creator.book
  end

  def get_attributes
    book.attributes = data_hash(GooglebookCatcher.new(isbn).catch)
  end

  def save
    book.save
  end

  def book
    @book ||= Book.new isbn: @isbn
  end

  private

  def data_hash(object)
    result = {}

    case object
    when GoogleBooks::Item then
      result[:title]          = object.title
      result[:image_link]     = object.image_link
      result[:authors]        = object.authors
      result[:isbn]           = object.isbn
      result[:year_published] = object.published_date.split('-')[0]
    end

    result
  end
end
