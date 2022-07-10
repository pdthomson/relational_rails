require 'rails_helper'

RSpec.describe 'the author show page' do

  it "user story 2: see all authors attributes by id" do
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    visit "authors/#{author.id}"

    expect(page).to have_content(author.name)
    expect(page).to have_content(author.year_published)
    expect(page).to have_content(author.award_winner)
  end

  it "user story 7: shows the count of mangas an author has" do
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
    manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)

    visit "authors/#{author.id}"

    expect(page).to have_content(author.name)
    expect(page).to have_content(author.manga_count)
  end
end
