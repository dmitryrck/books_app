require 'rails_helper'
require 'sidekiq/testing'

describe BookCreatorWorker do
  it 'create a book with zero quantity' do
    book = double.as_null_object
    expect(BookCreator).to receive(:new).with('1234').and_return(book)
    expect(book).not_to receive(:quantity).with(0)

    BookCreatorWorker.new.perform('1234')
  end

  it 'create a book cleaning isbn' do
    book = double.as_null_object
    expect(BookCreator).to receive(:new).with('1234').and_return(book)
    expect(book).not_to receive(:quantity).with(0)

    BookCreatorWorker.new.perform('1-2_3+4')
  end

  it 'create a book with quantity' do
    book = double.as_null_object
    expect(BookCreator).to receive(:new).with('1234').and_return(book)
    expect(book).to receive(:quantity=).with(10)

    BookCreatorWorker.new.perform('1234', 10)
  end
end
