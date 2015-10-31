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
      fill_in 'Título', with: 'Ruby on Rails For Dummies'
      fill_in 'Autor(es)', with: 'Barry Burd'
      fill_in 'Quantidade', with: '10'

      click_on 'Criar'

      expect(page).to have_content 'Ruby on Rails For Dummies'

      expect(Book.last.quantity).to eq 10
    end

    it 'should be able to create only with isbn' do
      Sidekiq::Testing.inline!
      VCR.use_cassette('search-isbn') do
        visit '/'

        click_on 'Adicionar livro'

        fill_in 'ISBN', with: '9781118084786'
        fill_in 'Quantidade', with: '20'

        click_on 'Criar'

        expect(page).to have_content 'Ruby on Rails For Dummies'

        expect(Book.last.quantity).to eq 20
      end
    end

    it 'should not be able to create with duplicated ISBN' do
      Sidekiq::Testing.inline!
      VCR.use_cassette('search-isbn') do
        visit '/'
        click_on 'Adicionar livro'
        fill_in 'ISBN', with: '9781118084786'
        click_on 'Criar'
        expect(page).to have_content 'Ruby on Rails For Dummies'
      end

      VCR.use_cassette('search-isbn') do
        visit '/'
        click_on 'Adicionar livro'
        fill_in 'ISBN', with: '9781118084786'
        click_on 'Criar'
        expect(page).to have_css('div.caption', count: 1)
      end
    end
  end

  context 'edit' do
    it 'should update' do
      book = Book.create!(
        isbn: '0345453743',
        title: "The Ultimate Hitchhiker's Guide to the Galaxy",
        authors: 'Douglas Adams'
      )

      visit edit_book_path(book)

      fill_in 'ISBN', with: 'B00FY8UDSM'
      fill_in 'Título', with: 'Memórias Póstumas de Brás Cubas'
      fill_in 'Autor(es)', with: 'Machado de Assis'

      click_on 'Atualizar'

      expect(page).to have_content 'Memórias Póstumas de Brás Cubas'
      expect(page).to have_content 'Machado de Assis'
    end
  end
end
