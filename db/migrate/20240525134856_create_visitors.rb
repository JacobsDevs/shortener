class CreateVisitors < ActiveRecord::Migration[7.1]
  def change
    create_table :visitors do |t|
			t.string :ip_address
			t.string :country
			t.string :city
			
      t.timestamps
    end
  end
end
