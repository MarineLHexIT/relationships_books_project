# frozen_string_literal: true

class EditionBlueprint < ApplicationBlueprint
  fields :published_date, :published_type, :published_language
  association :book, blueprint: BookBlueprint, default: {}
  association :publisher, blueprint: PublisherBlueprint, default: {}
end
