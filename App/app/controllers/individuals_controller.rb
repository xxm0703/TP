class IndividualsController < ApplicationController
  def new
    @person = Individual.new
  end

  def create
    @person = Individual.new(individual_params)

    if @person.save
      redirect_to @person
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
