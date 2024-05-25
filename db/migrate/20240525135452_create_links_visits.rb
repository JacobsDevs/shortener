class CreateLinksVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :links_visits do |t|
      t.integer :link_id
			t.integer :visitor_id

      t.timestamps
    end
  end
end
