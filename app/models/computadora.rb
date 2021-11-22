# frozen_string_literal: true

class Computadora < ApplicationRecord
  RECURSOS = %i[memoria disco].freeze
  has_many :logs, dependent: :destroy
  has_many :programas, dependent: :destroy

  def instalar(programa)
    programas << programa
    save!
  end

  def programas_ejecutando
    programas.filter(&:ejecutando)
  end

  def programas_frenados
    programas.reject(&:ejecutando)
  end

  RECURSOS.each do |recurso|
    validate "con_#{recurso}".to_sym

    define_method "con_#{recurso}" do
      raise "No hay suficiente #{recurso}" unless send("#{recurso}_disponible") >= 0
    end

    define_method "#{recurso}_disponible" do
      send(recurso) - programas.sum { |programa| programa.send("consumo_de_#{recurso}") }
    end
  end
end
