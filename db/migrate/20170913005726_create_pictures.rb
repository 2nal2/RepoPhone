class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.timestamps
      t.belongs_to :smartphone, index: true
      t.attachment :image
    end
  end
end
