class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string      :owner_name,  null: false
      t.string      :phone,       null: false
      t.string      :owner_email, null: false
      t.date        :date,        null: false
      t.time        :hour,        null: false
      t.belongs_to  :service,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
