class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :link
      t.string :tag
      t.string :department

      t.timestamps
    end
  end
end
