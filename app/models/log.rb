# frozen_string_literal: true

class Log < ApplicationRecord
  belongs_to :programa
  belongs_to :computadora
  validates :hecho, presence: true
end
