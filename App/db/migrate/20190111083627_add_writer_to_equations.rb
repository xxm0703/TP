class AddWriterToEquations < ActiveRecord::Migration[5.2]
  def change
    add_column :equations, :writer, :Individual
  end
end
