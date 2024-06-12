class CreateField < ActiveRecord::Migration[7.1]
  def change
    create_table :fields do |t|
      t.string :name
      t.string :label
      t.string :type

      t.timestamps
    end
  end
end
