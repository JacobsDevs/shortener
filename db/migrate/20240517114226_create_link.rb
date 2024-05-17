class CreateLink < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.string :shortlink
      t.string :link

      t.timestamps
    end
  end
end
