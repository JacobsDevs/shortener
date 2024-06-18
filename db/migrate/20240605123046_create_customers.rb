class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :ip_address
			t.string :email
			t.string :phone_number
			t.hstore 'customs', default: {}

      t.timestamps
    end
  end
end