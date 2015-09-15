require 'rails_helper'

describe 'GoogleBooks' do
  context 'catch a book by' do
    it 'isbn' do
      book = GoogleBooks.search('isbn:9781118084786').first
      expect(book.title).to eq 'Ruby on Rails For Dummies'
    end

    it 'title' do
      search = GoogleBooks.search('intitle:Darth Vader')
      titles = search.map(&:title)

      expect(titles).to be_all {|title| title =~ /Darth Vader/ }
    end

    it 'author' do
      search = GoogleBooks.search('inauthor:Tanenbaum')
      authors = search.map(&:authors)

      expect(authors).to be_all {|author| author =~ /Tanenbaum/ }
    end
  end
end
