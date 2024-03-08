# frozen_string_literal: true

require "oj"

Blueprinter.configure do |config|
  config.generator = Oj # default JSON
  config.sort_fields_by = :definition
  config.datetime_format = "%Y-%m-%dT%H:%M:%S.%L%:z"
end

ActionController::Renderers.add(:json) do |resource, options|
  resource_class = case resource
                   when ActiveRecord::Relation
                     resource.klass
                   when ActiveRecord::Base
                     resource.class.name
                   else
                     Array(resource)&.first&.class&.name
                   end

  blueprint_class_name = "#{resource_class}Blueprint"
  blueprint_class = options.fetch(:blueprint, blueprint_class_name.safe_constantize)

  if blueprint_class
    send_data blueprint_class.render(resource, **options), type: Mime[:json]
  else
    Rails.logger.warn "Blueprint '#{blueprint_class_name}' not found and `:blueprint` option missing."
    send_data resource.to_json, type: Mime[:json]
  end
end
