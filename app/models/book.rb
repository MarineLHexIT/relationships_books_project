class Book < ApplicationRecord
  belongs_to :author
  has_many :editions
  has_many :publishers, through: :editions
  has_and_belongs_to_many :genres
end
