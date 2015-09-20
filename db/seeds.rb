require 'ffaker'

20.times do
  Book.create(
    isbn: rand(9999999999).to_s,
    title: FFaker::Lorem.phrase,
    authors: "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
  )
end
