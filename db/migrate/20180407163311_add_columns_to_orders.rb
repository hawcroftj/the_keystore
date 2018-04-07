class AddColumnsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :total, :decimal
    add_column :orders, :tax_total, :decimal
  end
end
