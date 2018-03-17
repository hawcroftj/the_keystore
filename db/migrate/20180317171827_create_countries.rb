class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.decimal :gst_rate

      t.timestamps
    end
  end
end
