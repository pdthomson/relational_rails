require 'rails_helper'

RSpec.describe 'the author index page' do
  it 'User story 1: display names of each "parent(author)"' do
    Author.destroy_all
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
    visit '/authors'

    expect(page).to have_content(author.name)
  end

  it "User story 6: Order all authors and show when they were created" do
    Author.destroy_all
    author1 = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
    author2 = Author.create!(name: "Eiichiro Oda", year_published: 1997, award_winner: true,)

    visit '/authors'

    expect("Haruichi Furudate").to appear_before("Eiichiro Oda")
  end

  it "user story 11: click link to go to a create new author form " do
    visit '/authors'
    expect(page).to have_content('New Author')
    click_link 'New Author'
    expect(current_path).to eq("/authors/new")
  end

  it "user story 17: Update the authors information from the authors index page" do
    Author.destroy_all
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    author2 = Author.create!(name: "Eiichiro Oda", year_published: 1997, award_winner: true,)

    visit '/authors'
    within "#author-#{author.id}" do
      click_on 'edit'
      expect(current_path).to eq("/authors/#{author.id}/edit")
    end
    fill_in('Name', with: 'Tatsuya Endo')
    select("true", from: :award_winner)
    fill_in(:year_published, with: 1993)
    click_button('Update Author')

    expect(current_path).to eq("/authors/#{author.id}")
    expect(page).to have_content("true")
    expect(page).to have_content(1993)
  end

  it "user story 22: Delete authors from the author show page" do
    # As a visitor
    # When I visit the parent index page
    # Next to every parent, I see a link to delete that parent
    # When I click the link
    # I am returned to the Parent Index Page where I no longer see that parent
    Author.destroy_all
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    author2 = Author.create!(name: "Eiichiro Oda", year_published: 1997, award_winner: true,)

    visit '/authors'
    expect(page).to have_content(author.name)
    expect(page).to have_content(author2.name)

    within "#author-#{author.id}" do
      click_on "delete"
      expect(current_path).to eq("/authors")
    end
    expect(page).to_not have_content(author.name)
    expect(page).to have_content(author2.name)
  end
end
