class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.text    :name,         null: false
      t.text    :description,  null: false
      t.float   :value,        null: false
      t.string  :image,        null: false
      t.timestamps
    end
  end
end
