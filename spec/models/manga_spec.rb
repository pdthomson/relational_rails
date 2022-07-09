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

end
