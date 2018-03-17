class CreateProvinces < ActiveRecord::Migration[5.1]
  def change
    create_table :provinces do |t|
      t.string :name
      t.decimal :pst_rate
      t.decimal :hst_rate
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
