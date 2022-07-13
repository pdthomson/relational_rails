require "rails_helper"

RSpec.describe "New author creation page" do

  it "user story 11: links you to a form to create a new author" do

    visit '/authors/new'

    fill_in('Name', with: 'Tatsuya Endo')
    select("true", from: :award_winner)
    fill_in(:year_published, with: 2001)
    click_button('Create Author')

    expect(current_path).to eq('/authors')
    expect(page).to have_content("Tatsuya Endo")
  end


end
