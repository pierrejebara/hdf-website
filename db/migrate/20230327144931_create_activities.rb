class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :type
      t.date :date
      t.string :title
      t.text :description
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
