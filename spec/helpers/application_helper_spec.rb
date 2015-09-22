require 'rails_helper'

describe ApplicationHelper do
  context '#book_image_tag' do
    it 'return placehold image if nil image link book' do
      book = double(:Book, image_link: nil)
      expect(helper.book_image_tag(book)).to eq 'http://placehold.it/115x180.png'
    end

    it 'return placehold image if empty string image link book' do
      book = double(:Book, image_link: '')
      expect(helper.book_image_tag(book)).to eq 'http://placehold.it/115x180.png'
    end

    it 'return image link image if book has a imagem link' do
      book = double(:Book, image_link: 'http://example.com/1.jpg')
      expect(helper.book_image_tag(book)).to eq 'http://example.com/1.jpg'
    end
  end
end
