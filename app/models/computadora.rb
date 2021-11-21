# frozen_string_literal: true

class Computadora < ApplicationRecord
  has_many :logs, dependent: :destroy
end
