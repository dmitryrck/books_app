require 'rails_helper'

describe GooglebookCatcher do
  let! :book do
    VCR.use_cassette('search-isbn') do
      GooglebookCatcher.new('9781118084786').catch
    end
  end

  context 'should to catch a book' do
    it 'return a GoogleBook::Item' do
      expect(book).to be_a GoogleBooks::Item
    end

    it 'with correct title' do
      expect(book.title).to eq 'Ruby on Rails For Dummies'
    end
  end
end
