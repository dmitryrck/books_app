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
end
