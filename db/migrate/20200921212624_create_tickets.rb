class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.string :status
      t.boolean :accepted
      t.integer :accepted_by_id

      t.timestamps
    end
  end
end
