# frozen_string_literal: true

require 'administrate/base_dashboard'

class ProgramaDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    type: Field::Select.with_options(collection: %w[Programa ProgramaVirus]),
    nombre: Field::String,
    ejecuciones: Field::Number,
    memoria: Field::Number,
    disco: Field::Number,
    computadora: Field::BelongsTo,
    programas: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    nombre
    type
    memoria
    disco
    ejecuciones
    programas
    computadora
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    nombre
    type
    ejecuciones
    memoria
    disco
    programas
    computadora
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    nombre
    type
    ejecuciones
    memoria
    disco
    programas
    computadora
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how computadoras are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(computadora)
  #   "Computadora ##{computadora.id}"
  # end
end
