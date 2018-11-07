class CreateIndividuals < ActiveRecord::Migration[5.2]
  def change
    create_table :individuals do |t|
      t.string :name
      t.integer :age
      t.decimal :height

      t.timestamps
    end
  end
end
