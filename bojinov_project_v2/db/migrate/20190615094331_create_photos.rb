class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.binary :data, null: false
      t.string :filename
      t.string :mime_type

      t.timestamps
    end
  end
end
