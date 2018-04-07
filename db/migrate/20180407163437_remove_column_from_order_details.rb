class RemoveColumnFromOrderDetails < ActiveRecord::Migration[5.1]
  def self.up
    remove_column :order_details, :tax_charged
  end
end
