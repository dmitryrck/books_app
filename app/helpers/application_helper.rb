module ApplicationHelper
  def book_image_url(book)
    return 'http://placehold.it/115x180.png' if book.image_link.blank?

    book.image_link
  end
end
