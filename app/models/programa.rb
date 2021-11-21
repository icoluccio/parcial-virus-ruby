# frozen_string_literal: true

class Programa < ApplicationRecord
  belongs_to :computadora, allow_nil: true
end
