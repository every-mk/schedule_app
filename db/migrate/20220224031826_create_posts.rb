class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 20, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :all_day, null: false
      t.text :memorandum, limit: 500

      t.timestamps
    end
  end
end
