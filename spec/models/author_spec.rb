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
end
