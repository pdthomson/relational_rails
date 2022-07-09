class Manga < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :number_of_chapters
  validates_presence_of :author_id
  validates :completed, inclusion:[true, false]
  belongs_to :author
end
