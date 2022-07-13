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
    expect(page).to have_content("Number of Mangas: #{author.manga_count}")
  end

  it "user story 8: has a link button to go back to mangas index" do
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
    manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)

    visit '/mangas'
    click_link 'Mangas'

    expect(page).to have_link("Mangas", :href=>"/mangas")
  end

  it "user story 9: has a link button to go back to the authors index" do
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
    manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)

    visit '/authors'
    click_link 'Authors'

    expect(page).to have_link("Authors", :href=>"/authors")
  end

  it "user story 10: when i visit my authors show page theres a link to take me to the authors manga names page" do
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
    manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)

    visit "/authors/#{author.id}"

    expect(page).to have_link("#{author.name}'s Mangas", :href=>"/authors/#{author.id}/mangas")
    click_link "#{author.name}'s Mangas"
    expect(current_path). to eq("/authors/#{author.id}/mangas")
  end

    it "User story 12: show page has link to update author and an edit form that gets updated with new info" do
      author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)

      visit "/authors/#{author.id}"
      click_link "Update Author"
      expect(current_path).to eq("/authors/#{author.id}/edit")
      fill_in('Name', with: 'Tatsuya Endo')
      select("true", from: :award_winner)
      fill_in(:year_published, with: 1993)
      click_button('Update Author')
      expect(current_path).to eq("/authors/#{author.id}")
      expect(page).to have_content("true")
      expect(page).to have_content(1993)
    end

    it "user story 19: can delete an author and all of its mangas" do
      author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
      manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
      manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)

      visit "/authors/#{author.id}"
      expect(page).to have_content('Tatsuya Endo')
      expect(page).to have_content(2001)
      expect(page).to have_content(false)
      click_on "Delete Author"
      expect(current_path).to eq("/authors")
      expect(page).to_not have_content('Tatsuya Endo')
      expect(page).to_not have_content(2001)
      expect(page).to_not have_content(false)

    end
end
