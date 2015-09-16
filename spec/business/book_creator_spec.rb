require 'rails_helper'

describe BookCreator do
  let! :book do
    VCR.use_cassette('search-isbn') do
      BookCreator.create_by_isbn('9781118084786')
    end
  end

  context 'create a book by isbn' do
    it 'should be a book' do
      expect(book).to be_a Book
    end

    it 'should be persisted' do
      expect(book.persisted?).to be true
    end

    it 'with correct isbn' do
      expect(book.isbn).to eq '9781118084786'
    end

    it 'with correct title' do
      expect(book.title).to eq 'Ruby on Rails For Dummies'
    end

    it 'with correct authors' do
      expect(book.authors).to eq 'Barry Burd'
    end

    it 'with correct published year' do
      expect(book.year_published).to eq 2011
    end
  end
end
