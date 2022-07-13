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

  it "User story 13: visits the author/mangas index page and links you to creating a new manga, then your linked back to the index page and able to see the new child" do
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)

    visit "/authors/#{author.id}/mangas"

    click_on "Create Manga"
    expect(current_path).to eq("/authors/#{author.id}/mangas/new")
    fill_in('Name', with: 'One Punch Man')
    select('false', from: :completed)
    fill_in(:number_of_chapters, with: 166)
    click_button "Create Manga"
    expect(current_path).to eq("/authors/#{author.id}/mangas")
    expect(page).to have_content("One Punch Man")
    expect(page).to have_content("false")
    expect(page).to have_content(166)
  end

  it "user story 16 sorts alphabetically" do
    author = Author.create!(name: "Yoshihiro Togashi", year_published: 1989, award_winner: true,)
    manga1 = author.mangas.create!(name: "YuYu Hakusho", completed: true, number_of_chapters: 175)
    manga2 = author.mangas.create!(name: "Hunter X Hunter", completed: false, number_of_chapters: 280)

    visit "authors/#{author.id}/mangas"

    click_on "Sort Alphabetically"
    expect(current_path).to eq("/authors/#{author.id}/mangas")
  end

  it "user story 21: you can give a number and have it return a list based on that number" do
    Manga.destroy_all
    author = Author.create!(name: "Yoshihiro Togashi", year_published: 1989, award_winner: true,)
    manga1 = author.mangas.create!(name: "YuYu Hakusho", completed: true, number_of_chapters: 175)
    manga2 = author.mangas.create!(name: "Hunter X Hunter", completed: false, number_of_chapters: 280)

    visit "authors/#{author.id}/mangas"

    fill_in("number_of_chapters", with: 176)

    click_button "Submit"

    expect(page).to have_content("Hunter X Hunter")
    expect(page).to_not have_content("YuYu Hakusho")
  end
end
