# frozen_string_literal: true

class BookBlueprint < ApplicationBlueprint

  fields :title, :isbn

  view :index do
    association :author, blueprint: AuthorBlueprint
    association :publishers, blueprint: PublisherBlueprint
  end

  view :show do
    association :editions, blueprint: EditionBlueprint
  end
end
