class GooglebookCatcher
  attr_accessor :isbn

  def initialize(isbn)
    self.isbn = isbn
  end

  def catch
    GoogleBooks.search("isbn:#{isbn}").first
  end
end
