# frozen_string_literal: true

class ProgramaVirus < Programa
  def correr(computadora)
    super
    return if computadora.blank?

    computadora.programas_ejecutados_mas_que(potencia).each { |programa| programa.ser_infectado_por(clonar) }
  end

  def clonar
    Programa.create!(attributes.except('id', 'created_at', 'updated_at', 'programa_id'))
  end
end
