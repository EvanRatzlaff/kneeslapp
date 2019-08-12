class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.time :time
      t.date :date
      t.boolean :laughter
      t.text :room_performed
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
