# frozen_string_literal: true

class Computadora < ApplicationRecord
  RECURSOS = %i[memoria disco].freeze
  has_many :logs, dependent: :destroy
  has_many :programas, dependent: :destroy

  def instalar(programa)
    programas << programa
    chequeo_disco
    save!
  end

  def desinstalar(programa)
    return unless programas.include?(programa)

    programa.computadora = nil
    programa.save!
    save!
  end

  def ejecutar(programa)
    Programa.transaction do
      return unless programas.include?(programa)

      programa.ejecutar
      chequeo_memoria
      programa.correr(self)
    end
  end

  def programas_ejecutados_mas_que(numero)
    programas_ejecutando.filter { |programa| programa.ejecuciones > numero }
  end

  def programa_de_mas_memoria
    programas.max_by(&:consumo_de_memoria)
  end

  def programas_pesados
    programas.filter { |programa| programa.disco > (disco / 2) }
  end

  def programas_ejecutando
    programas.filter(&:ejecutando)
  end

  def programas_frenados
    programas.reject(&:ejecutando)
  end

  RECURSOS.each do |recurso|
    define_method "chequeo_#{recurso}" do
      raise "No hay suficiente #{recurso}" unless send("#{recurso}_disponible").positive?
    end

    define_method "#{recurso}_disponible" do
      send(recurso) - programas.sum { |programa| programa.send("consumo_de_#{recurso}") }
    end

    define_method "porcentaje_de_#{recurso}" do
      100 * (send("#{recurso}_disponible") / send(recurso))
    end
  end
end
