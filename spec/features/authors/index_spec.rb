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
end
