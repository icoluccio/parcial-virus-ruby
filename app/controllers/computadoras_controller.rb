# frozen_string_literal: true

class ComputadorasController < ApplicationController
  def index
    @computadoras = Computadora.all
  end

  def show
    @computadora = computadora
    @programas = []
  end

  def instalar; end

  private

  def computadora
    @computadora ||= Computadora.find_by(id: params[:id])
  end
end
