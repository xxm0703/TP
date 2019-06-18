class AddDocumentIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_reference :photos, :document, foreign_key: true
  end
end
