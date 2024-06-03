class AddIdToLinksVisitors < ActiveRecord::Migration[7.1]
  def change
    add_column :links_visitors, :id, :primary_key
  end
end
