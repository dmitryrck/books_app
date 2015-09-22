require 'rails_helper'

describe BookCreator do
  subject do
    BookCreator.new(isbn)
  end

  context 'create a book by isbn' do
    before do
      VCR.use_cassette('search-isbn') do
        subject.get_attributes
      end
    end

    let :isbn do
      '9781118084786'
    end

    it 'should be a book' do
      expect(subject.book).to be_a Book
    end

    it 'should save' do
      expect { subject.save }.to change { subject.book.persisted? }.to(true)
    end

    it 'with correct isbn' do
      expect(subject.isbn).to eq '9781118084786'
    end

    it 'with correct title' do
      expect(subject.title).to eq 'Ruby on Rails For Dummies'
    end

    it 'with correct authors' do
      expect(subject.authors).to eq 'Barry Burd'
    end

    it 'with correct published year' do
      expect(subject.year_published).to eq 2011
    end

    it 'with correct image link' do
      expect(subject.image_link).to eq 'http://books.google.com.br/books/content?id=CHx7Cb9a32cC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api'
    end
  end

  context 'create a book by isbn with two authors' do
    before do
      VCR.use_cassette('search-isbn-2-authors') do
        subject.get_attributes
      end
    end

    let :isbn do
      '0387493336'
    end

    it 'should be a book' do
      expect(subject.book).to be_a Book
    end

    it 'should save' do
      expect { subject.save }.to change { subject.book.persisted? }.to(true)
    end

    it 'should store isbn13' do
      expect(subject.book.isbn).to eq '9780387493336'
    end

    it 'with correct title' do
      expect(subject.title).to eq 'Computer Algebra Recipes: An Advanced Guide to Scientific Modeling'
    end

    it 'with correct authors' do
      expect(subject.authors).to eq 'Richard H. Enns, George C. McGuire'
    end

    it 'with correct published year' do
      expect(subject.year_published).to eq 2007
    end

    it 'with correct image link' do
      expect(subject.image_link).to eq 'http://books.google.com.br/books/content?id=g9_iebhkbNcC&printsec=frontcover&img=1&zoom=1&edge=none&source=gbs_api'
    end
  end

  context 'create a book by isbn with year only in search results' do
    before do
      VCR.use_cassette('search-isbn-year-only') do
        subject.get_attributes
      end
    end

    let :isbn do
      '1937785491'
    end

    it 'should be a book' do
      expect(subject.book).to be_a Book
    end

    it 'should be persisted' do
      expect { subject.save }.to change { subject.book.persisted? }.to(true)
    end

    it 'should store isbn13' do
      expect(subject.book.isbn).to eq '9781937785499'
    end

    it 'with correct title' do
      expect(subject.title).to eq "Programming Ruby 1.9 & 2.0: The Pragmatic Programmers' Guide"
    end

    it 'with correct authors' do
      expect(subject.authors).to eq 'David Thomas, Chad Fowler, Andrew Hunt'
    end

    it 'with correct published year' do
      expect(subject.year_published).to eq 2013
    end

    it 'with correct image link' do
      expect(subject.image_link).to eq 'http://books.google.com.br/books/content?id=2LulngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api'
    end
  end
end
