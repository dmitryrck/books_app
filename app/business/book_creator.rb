class BookCreator
  class << self
    def create_by_isbn(isbn)
      Book.create catch_the_book_by_isbn(isbn)
    end

    private

    def catch_the_book_by_isbn(isbn)
      data_hash Catchers::GoogleBook.new(isbn).catch
    end

    def data_hash(object)
      result = {}

      case object
      when GoogleBooks::Item then
        result[:title]          = object.title
        result[:authors]        = object.authors
        result[:isbn]           = object.isbn
        result[:year_published] = Date.parse(object.published_date).try(:year) rescue nil
      end

      result
    end
  end
end
