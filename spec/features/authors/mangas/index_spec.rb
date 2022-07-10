require 'rails_helper'

RSpec.describe 'author/manga index page' do

  it "User story 5: shows each author and its manga with all of the mangas attributes" do
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
    manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
    manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)
    visit "/authors/#{author.id}/mangas"

    expect(page).to have_content(manga1.name)
    expect(page).to have_content(manga1.completed)
    expect(page).to have_content(manga1.number_of_chapters)
    expect(page).to have_content(manga2.name)
    expect(page).to have_content(manga2.completed)
    expect(page).to have_content(manga2.number_of_chapters)
  end

end
