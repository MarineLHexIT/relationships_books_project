# frozen_string_literal: true

class PublisherBlueprint < ApplicationBlueprint
  fields :name

  view :show do
    association :books, blueprint: BookBlueprint, default: {}
  end
end
