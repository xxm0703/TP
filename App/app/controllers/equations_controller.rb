class EquationsController < ApplicationController

  def new
    @equation = Equation.new
  end

	def create
		a = params[:equation][:a].to_f
		b = params[:equation][:b].to_f
		c = params[:equation][:c].to_f
		@output = []
		if a == 0
      params[:equation][:root1] = -c/b
      params[:equation][:root2] = -c/b
      Equation.create(equation_params)

  		@output.push("It's a linear one...")
			render 'show'
			return
		end

		d = b**2-4*a*c

		if d < 0
      params[:equation][:root1] = Nil
      params[:equation][:root2] = Nil
      Equation.create(equation_params)

			@output.push("No real roots...")
			render 'show'
			return
		end

		d = Math.sqrt(d)
    params[:equation][:root1] = (-b-d)/2*a
    params[:equation][:root2] = (-b+d)/2*a
    Equation.create(equation_params)

		@output.push("X1: #{(-b-d)/2*a}")
		@output.push("X2: #{(-b+d)/2*a}")


		render 'show'
	end

private
  def equation_params
    params.require(:equation).permit(:a, :b, :c, :root1, :root2)
  end
end
