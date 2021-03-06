class Author < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :year_published
  validates :award_winner, inclusion:[true, false]
  has_many :mangas, dependent: :destroy

  def self.ordered
    Author.order(created_at: :asc)
  end

  def manga_count
    mangas.count
  end
end
