class CreateJoinTableLinksVisitors < ActiveRecord::Migration[7.1]
  def change
    create_join_table :links, :visitors do |t|
      # t.index [:link_id, :visitor_id]
      # t.index [:visitor_id, :link_id]

			t.integer :visits
    end
  end
end
