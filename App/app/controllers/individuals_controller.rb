class IndividualsController < ApplicationController
  def new
    @individual = Individual.new
  end

  def create
    @individual = Individual.new(individual_params)

    if @individual.save
      redirect_to @individual
    else
      render 'new'
    end
  end

  def show
    @person = Individual.find(params[:id])
  end

  def index
    @people = Individual.all
  end

private

  def individual_params
    params.require(:individual).permit(:name, :age, :height)
  end
end
