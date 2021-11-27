class CreateAssigns < ActiveRecord::Migration[6.1]
  def change
    create_table :assigns do |t|
      t.references :user, null: false, foreign_key: true
      t.references :complain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
