require 'rails_helper'

describe 'GoogleBooks' do
  context 'catch a book by' do
    it 'isbn' do
      VCR.use_cassette('search-isbn') do
        book = GoogleBooks.search('isbn:9781118084786').first

        expect(book.title).to eq 'Ruby on Rails For Dummies'
      end
    end

    it 'title' do
      VCR.use_cassette('search-title') do
        books = GoogleBooks.search('intitle:Darth Vader')

        expect(books.map(&:title)).to be_all {|title| title =~ /Darth Vader/ }
      end
    end

    it 'author' do
      VCR.use_cassette('search-author') do
        books = GoogleBooks.search('inauthor:Tanenbaum')

        expect(books.map(&:authors)).to be_all {|author| author =~ /Tanenbaum/ }
      end
    end
  end
end
