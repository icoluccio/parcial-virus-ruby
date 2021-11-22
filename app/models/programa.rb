# frozen_string_literal: true

class Programa < ApplicationRecord
  belongs_to :computadora, optional: true
  belongs_to :programa, optional: true
  has_many :programas, dependent: :destroy

  def consumo_de_memoria
    return 0 unless ejecutando

    memoria + programas.sum(&:consumo_de_memoria)
  end

  def consumo_de_disco
    disco + programas.sum(&:consumo_de_disco)
  end

  def ejecutar
    update(ejecutando: true)
  end

  def frenar
    update(ejecutando: false)
  end
end
