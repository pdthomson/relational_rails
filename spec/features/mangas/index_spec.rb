require 'rails_helper'

RSpec.describe 'the manga index page' do
  it 'User story 3: Display mangas and all attributes' do
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
    manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
    manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)

    visit "/mangas"

    expect(page).to have_content(manga1.name)
    expect(page).to have_content(manga1.completed)
    expect(page).to have_content(manga1.number_of_chapters)
    expect(page).to have_content(manga2.name)
    expect(page).to have_content(manga2.completed)
    expect(page).to have_content(manga2.number_of_chapters)
  end

  it "user story 15: shows only the mangas with a true value" do
    author = Author.create!(name: "Yoshihiro Togashi", year_published: 1989, award_winner: true,)
    manga1 = author.mangas.create!(name: "YuYu Hakusho", completed: true, number_of_chapters: 175)
    manga2 = author.mangas.create!(name: "Hunter X Hunter", completed: false, number_of_chapters: 280)

    visit '/mangas'

    expect(page).to have_content(manga1.name)
    expect(page).to have_content(manga1.completed)
    expect(page).to have_content(manga1.number_of_chapters)
    expect(page).to_not have_content(manga2.name)
    expect(page).to_not have_content(manga2.completed)
    expect(page).to_not have_content(manga2.number_of_chapters)
  end

  it "user story 18: has an edit button to edit the manga and update it" do
    author = Author.create!(name: "Yoshihiro Togashi", year_published: 1989, award_winner: true,)
    manga1 = author.mangas.create!(name: "YuYu Hakusho", completed: true, number_of_chapters: 165)
    manga2 = author.mangas.create!(name: "Hunter X Hunter", completed: true, number_of_chapters: 280)
    visit '/mangas'

    within "#manga-#{manga1.id}" do
      click_on 'edit'
      expect(current_path).to eq("/mangas/#{manga1.id}/edit")
    end
    fill_in('Name', with: 'YuYu Hakusho')
    select('false', from: :completed)
    fill_in(:number_of_chapters, with: 175)
    click_button 'Update Manga'
    expect(current_path).to eq("/mangas/#{manga1.id}")
    expect(page).to have_content("false")
    expect(page).to have_content(175)
  end

  it "user story 23: deletes a manga from the manga index" do
    author = Author.create!(name: "Yoshihiro Togashi", year_published: 1989, award_winner: true,)
    manga1 = author.mangas.create!(name: "YuYu Hakusho", completed: true, number_of_chapters: 165)
    manga2 = author.mangas.create!(name: "Hunter X Hunter", completed: true, number_of_chapters: 280)

    visit "/mangas"
    expect(page).to have_content(manga1.name)
    expect(page).to have_content(manga2.name)
    
    within "#manga-#{manga1.id}" do
      click_on "delete"
      # save_and_open_page
      expect(current_path).to eq("/mangas")
    end
    expect(page).to_not have_content(manga1.name)
    expect(page).to have_content(manga2.name)
  end

end
