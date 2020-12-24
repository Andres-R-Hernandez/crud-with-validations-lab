class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true, if: :same_artist_same_year?

  validates :released, inclusion: [true, false]

  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year }, if: :released?

  validates :artist_name, presence: true

  def same_artist_same_year?
    Song.exists?(artist_name: self.artist_name, release_year: self.release_year)
  end

  def released?
    self.released == true
  end

end
