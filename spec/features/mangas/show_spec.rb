require 'rails_helper'

RSpec.describe 'the manga show page' do
  it "user story 4: shows the manga and attributes based on id" do
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
    manga = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)

    visit "mangas/#{manga.id}"

    expect(page).to have_content(manga.name)
    expect(page).to have_content(manga.completed)
    expect(page).to have_content(manga.number_of_chapters)
  end
end
