require 'rails_helper'
require 'sidekiq/testing'

describe 'Books' do
  it 'list current books' do
    Book.create!(
      isbn: '0345453743',
      title: "The Ultimate Hitchhiker's Guide to the Galaxy",
      authors: 'Adams, Douglas'
    )

    visit '/'

    expect(page).to have_content "The Ultimate Hitchhiker's Guide to the Galaxy"
    expect(page).to have_content 'Adams, Douglas'
  end

  context 'create' do
    it 'should be able to create a book' do
      visit '/'

      click_on 'Adicionar livro'

      fill_in 'ISBN', with: '9781118084786'
      fill_in 'Title', with: 'Ruby on Rails For Dummies'
      fill_in 'Author(s)', with: 'Barry Burd'

      click_on 'Criar'

      expect(page).to have_content 'Ruby on Rails For Dummies'
    end

    it 'should be able to create only with isbn' do
      Sidekiq::Testing.inline!
      VCR.use_cassette('search-isbn') do
        visit '/'

        click_on 'Adicionar livro'

        fill_in 'ISBN', with: '9781118084786'

        click_on 'Criar'

        expect(page).to have_content 'Ruby on Rails For Dummies'
      end
    end
  end
end
