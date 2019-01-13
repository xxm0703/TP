class AddIndividualRefToEquation < ActiveRecord::Migration[5.2]
  def change
    add_reference :equations, :writer, foreign_key: true
  end
end
