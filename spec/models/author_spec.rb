require 'rails_helper'

describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :year_published}
    it { should allow_value(true).for(:award_winner)}
    it { should allow_value(false).for(:award_winner)}
  end
  describe 'relationships' do
    it { should have_many :mangas }
  end

  describe 'Class methods/model tests' do
    it "User story 6: can order authors by created at time" do
      Author.destroy_all
      author1 = Author.create!(name: "Haruichi Furudate", year_published: 2009, award_winner: true,)
      author2 = Author.create!(name: "Eiichiro Oda", year_published: 1997, award_winner: true,)

      expect(Author.ordered).to eq([author1, author2])
    end

    it "User story 7: can check the count of mangas bu the other" do
      Author.destroy_all
      author = Author.create!(name:"Tatsuya Endo", year_published: 2001, award_winner: false)
      manga1 = author.mangas.create!(name: "Haikyu!!", completed: true, number_of_chapters: 402)
      manga2 = author.mangas.create!(name: "King Kid", completed: true, number_of_chapters: 1)

      expect(author.manga_count).to eq(2)
    end
  end
end
