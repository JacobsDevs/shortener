class CreateLandingPage < ActiveRecord::Migration[7.1]
  def change
    create_table :landing_pages do |t|
      t.string :destination

      t.timestamps
    end
  end
end
