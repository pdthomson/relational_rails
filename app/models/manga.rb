class Manga < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :number_of_chapters
  validates_presence_of :author_id
  validates :completed, inclusion:[true, false]
  belongs_to :author

  def self.true_value
    where(completed: true)
  end

  def self.sort_alphabetically
    order(:name)
  end

#   def mangas_chapters_over(chapters)
# require "pry"; binding.pry
#     self.mangas.where("number_of_chapters > ?", chapters)
#   end
end
