require 'rails_helper'

describe Book do
  subject do
    Book.new title: 'I am Iron Man',
      authors: 'Stark, Tony & Yinsen, Ho',
      isbn: '1234'
  end

  it { is_expected.to be_valid }

  it 'should not be valid with no title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'should not be valid with no authors' do
    subject.authors = nil
    expect(subject).not_to be_valid
  end

  it 'should not be valid with no isbn' do
    subject.isbn = nil
    expect(subject).not_to be_valid
  end

  it 'should not be valid with non-digit isbn' do
    subject.isbn = '12-3456-789-0'
    expect(subject).not_to be_valid
  end

  it 'should allow isbn starting with 0' do
    subject.isbn = '0234567890'
    expect(subject).to be_valid
  end

  it 'generate to_s' do
    expect(subject.to_s).to eq 'I am Iron Man'
  end

  it 'should not be valid with duplicated isbn' do
    subject.save
    book = Book.new(isbn: subject.isbn, title: 'Other title', authors: 'Other Author')
    expect(book).not_to be_valid
  end
end
