class Publisher < ApplicationRecord
  has_many :editions
  has_many :books, through: :editions
end
