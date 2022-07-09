require 'rails_helper'

RSpec.describe 'the author index page' do
  it 'User story 1: display names of each "parent(author)"' do
    Author.destroy_all
    author = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
    visit '/authors'

    expect(page).to have_content(author.name)
  end
end
