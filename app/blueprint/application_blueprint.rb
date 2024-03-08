# frozen_string_literal: true

class ApplicationBlueprint < Blueprinter::Base
  # Fields
  identifier :id
  fields :created_at, :updated_at

  def self.render_unit(unit)
    return if unit.blank?

    if %w[kg un].include?(unit)
      { value: :unsto, label: I18n.t('enumerize.product.unit.unsto') }
    else
      { value: unit, label: I18n.t("enumerize.product.unit.#{unit}") }
    end
  end
end
