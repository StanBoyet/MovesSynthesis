class AddFromDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :from_date, :date
  end
end
