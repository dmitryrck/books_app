require 'rails_helper'
require 'sidekiq/testing'

describe BookCreatorWorker do
  it 'call BookCreator' do
    expect(BookCreator).to receive(:create).with('1234')

    BookCreatorWorker.new.perform('1234')
  end
end
