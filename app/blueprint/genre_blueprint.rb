# frozen_string_literal: true

class GenreBlueprint < ApplicationBlueprint
  fields :name

  view :index do
    association :books, blueprint: BookBlueprint, default: {}
  end
end
