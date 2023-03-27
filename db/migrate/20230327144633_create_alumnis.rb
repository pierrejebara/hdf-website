class CreateAlumnis < ActiveRecord::Migration[7.0]
  def change
    create_table :alumnis do |t|
      t.string :name
      t.integer :graduation_year
      t.text :description
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
