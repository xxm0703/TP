class IndividualsController < ApplicationController
  def create
  end

  def show
    @person = Individual.find(params[:id])
  end

  def index
    @people = Individual.all
  end
end
