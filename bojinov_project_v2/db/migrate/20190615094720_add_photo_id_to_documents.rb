class AddPhotoIdToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_reference :documents, :photo, foreign_key: true
  end
end
