require 'rails_helper'

describe BooksController do
  context 'when creates book and' do
    it 'it is successful, expires cache' do
      book = double(:Book).as_null_object
      allow(Book).to receive(:new).and_return(book)
      allow(book).to receive(:save).and_return(true)

      expect_any_instance_of(BooksController).to receive(:expire_fragment).with('books-index')

      post :create, book: { title: 'ok', isbn: '123', authors: 'abc' }
    end

    it 'it is fail, does not expire cache' do
      book = double(:Book).as_null_object
      allow(Book).to receive(:new).and_return(book)
      allow(book).to receive(:save).and_return(false)

      expect_any_instance_of(BooksController).not_to receive(:expire_fragment)

      post :create, book: { title: 'abc', isbn: '', authors: '' }
    end
  end

  context 'when updates book and' do
    it 'it is successful, expires cache' do
      book = double(:Book).as_null_object
      allow(Book).to receive(:find).and_return(book)
      allow(book).to receive(:update).and_return(true)

      expect_any_instance_of(BooksController).to receive(:expire_fragment).with('books-index')

      patch :create, book: { title: 'ok', isbn: '123', authors: 'abc' }
    end

    it 'it is fail, does not expire cache' do
      book = double(:Book).as_null_object
      allow(Book).to receive(:find).and_return(book)
      allow(book).to receive(:update).and_return(false)

      expect_any_instance_of(BooksController).not_to receive(:expire_fragment)

      patch :create, book: { title: 'abc', isbn: '', authors: '' }
    end
  end
end
