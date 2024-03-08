# frozen_string_literal: true

class AuthorBlueprint < ApplicationBlueprint
  fields :first_name, :last_name

  view :index do
    fields :first_name, :last_name
  end

  view :show do
    fields :first_name, :last_name
    association :books, blueprint: BookBlueprint, default: {}
  end
end
