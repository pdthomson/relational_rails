require 'rails_helper'

describe Manga, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :number_of_chapters}
    it { should allow_value(true).for(:completed) }
    it { should allow_value(false).for(:completed) }
    it { should validate_presence_of :author_id}
  end

  describe 'relationships' do
    it { should belong_to :author }
  end

  describe 'instance methods' do
    it "will only show the mangas with a true value on the index page" do
      author = Author.create!(name: "Yoshihiro Togashi", year_published: 1989, award_winner: true,)
      manga1 = author.mangas.create!(name: "YuYu Hakusho", completed: true, number_of_chapters: 175)
      manga2 = author.mangas.create!(name: "Hunter X Hunter", completed: false, number_of_chapters: 280)

      expect(Manga.true_value).to eq([manga1])
    end
  end
end
