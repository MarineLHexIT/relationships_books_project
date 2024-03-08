# frozen_string_literal: true

class BookBlueprint < ApplicationBlueprint

  fields :title, :isbn

  view :index do
    association :author, blueprint: AuthorBlueprint
    association :publishers, blueprint: PublisherBlueprint
    association :genres, blueprint: GenreBlueprint, default: {}
  end

  view :show do
    association :author, blueprint: AuthorBlueprint
    association :publishers, blueprint: PublisherBlueprint
    association :genres, blueprint: GenreBlueprint, default: {}
    association :editions, blueprint: EditionBlueprint
  end
end
