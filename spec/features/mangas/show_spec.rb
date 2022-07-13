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

  it "user story 14: From the mangas show page you can update and then get directed the show page with updated information" do
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
    manga = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)

    visit "mangas/#{manga.id}"

    click_on "Update Manga"
    expect(current_path).to eq("/mangas/#{manga.id}/edit")
    fill_in('Name', with: 'Haikyu!!')
    select('false', from: :completed)
    fill_in(:number_of_chapters, with: 403)
    click_button "Update Manga"
    expect(current_path).to eq("/mangas/#{manga.id}")
    expect(page).to have_content("Haikyu!!")
    expect(page).to have_content("false")
    expect(page).to have_content(403)
  end

  it "user story 20: can delete mangas and update the page" do
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true)
    manga = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)

    visit "/mangas/#{manga.id}"
    expect(page).to have_content("Haikyu!!")
    expect(page).to have_content(402)
    expect(page).to have_content(true)
    click_on "Delete Manga"
    expect(current_path).to eq("/mangas")
    expect(page).to_not have_content("Haiku!!")
    expect(page).to_not have_content(402)
    expect(page).to_not have_content(true)
  end
end
