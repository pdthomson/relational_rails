require 'rails_helper'

RSpec.describe 'the manga index page' do
  it 'User story 3: Display mangas and all attributes' do
    # User Story 3, Child Index
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes:
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
    save_and_open_page
  end



end
