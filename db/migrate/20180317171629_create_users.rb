class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :address
      t.string :city
      t.string :post_code
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
