# frozen_string_literal: true

class ComputadorasController < ApplicationController
  def index
    @computadoras = Computadora.all
  end

  def show
    @computadora = computadora
    @programas = Programa.where(computadora: nil)
  end

  def instalar
    computadora.instalar(programa)
    redirect_to computadora_path(computadora)
  end

  def ejecutar
    programa.ejecutar
    redirect_to computadora_path(computadora)
  end

  def frenar
    programa.frenar
    redirect_to computadora_path(computadora)
  end

  private

  def computadora
    @computadora ||= Computadora.find_by(id: params[:id])
  end

  def programa
    @programa ||= Programa.find_by(id: params[:id_de_programa])
  end
end
