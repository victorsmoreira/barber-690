class CreateHaircuts < ActiveRecord::Migration[6.1]
  def change
    create_table :haircuts do |t|
      t.string :style
      t.float :price
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
