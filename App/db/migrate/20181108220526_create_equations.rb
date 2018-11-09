class CreateEquations < ActiveRecord::Migration[5.2]
  def change
    create_table :equations do |t|
      t.decimal :a
      t.decimal :b
      t.decimal :c
      t.decimal :root1
      t.decimal :root2
      t.timestamps
    end
  end
end
