class AddLandingPageIdToFields < ActiveRecord::Migration[7.1]
  def change
    add_reference :fields, :landing_page, null: false, foreign_key: true
  end
end
