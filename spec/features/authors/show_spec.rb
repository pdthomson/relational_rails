require 'rails_helper'

RSpec.describe 'the author show page' do

  it "user story 2: see all parents attributes by id" do
    author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
    visit "authors/#{author.id}"

    expect(page).to have_content(author.name)
    expect(page).to have_content(author.year_published)
    expect(page).to have_content(author.award_winner)
  end


end
