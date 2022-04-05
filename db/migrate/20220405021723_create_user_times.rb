class CreateUserTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_times do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.integer :month_time
      t.integer :user_id
      t.string :date_of_times
      t.timestamps
    end
  end
end
