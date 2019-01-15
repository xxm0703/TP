class EquationsController < ApplicationController

  def render_writers
    @equation = Equation.find(params[:id])
    @people = Individual.all
    render 'render_writers'
  end

  def add_writer
    equation = Equation.find(params[:id])
    equation.writer_id = params[:writer_id]
    if equation.save!
      redirect_to equation
    else
      render plain: "Something went wrong on save!!"
    end

  end

  def index
    @equation = Equation.all
  end

  def show
    @equation = Equation.find(params[:id])
    # if @equation.writer_id
    #   @writer = Individual.find(@equation.writer_id)
    # else
    #   @writer = nil
    # end
  end

  def edit
    @equation = Equation.find(params[:id])
  end

  def new
    @equation = Equation.new
  end

	def create

    @equation = Equation.new(equation_params)
    calculate

    if @equation.save
      redirect_to @equation
    else
      render 'new'
    end
	end

  def update

    @equation = Equation.find(params[:id])

    if @equation.update(equation_params)
      calculate
      @equation.save
      redirect_to @equation
    else
      render 'edit'
    end
  end

  def destroy
    @equation = Equation.find(params[:id])
    @equation.destroy

    redirect_to equations_path
  end

private

  def calculate
    @output = []
    d = @equation.b**2-4*@equation.a*@equation.c

    if @equation.a == 0
      @equation.root1 = -@equation.c/@equation.b
      @equation.root2 = -@equation.c/@equation.b
      @output.push("It's a linear one...")
    elsif d < 0
      @equation.root1 = Float::NAN
      @equation.root2 = Float::NAN
      @output.push("No real roots...")
    else
      d = Math.sqrt(d)
      @equation.root1 = (-@equation.b-d)/2*@equation.a
      @equation.root2 = (-@equation.b+d)/2*@equation.a
      @output.push("X1: #{(-@equation.b-d)/2*@equation.a}")
      @output.push("X2: #{(-@equation.b+d)/2*@equation.a}")
    end
  end

  def equation_params
    params.require(:equation).permit(:a, :b, :c, :root1, :root2)
  end
end
