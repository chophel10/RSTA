class CreateComplains < ActiveRecord::Migration[6.1]
  def change
    create_table :complains do |t|
      t.string :title
      t.text :content
      t.string :location
      t.date :start_date
      t.date :end_date
      t.boolean :resolve
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
