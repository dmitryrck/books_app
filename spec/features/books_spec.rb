require 'rails_helper'

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
end
