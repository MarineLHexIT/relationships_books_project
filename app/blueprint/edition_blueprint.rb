# frozen_string_literal: true

class EditionBlueprint < ApplicationBlueprint
  fields :published_date, :published_type, :published_language

  field :publisher_name do |record|
    record.publisher.name
  end

  field :book_name do |record|
    record.book.title
  end

  view :show do
    association :book, blueprint: BookBlueprint, default: {}
    association :publisher, blueprint: PublisherBlueprint, default: {}
  end
end
