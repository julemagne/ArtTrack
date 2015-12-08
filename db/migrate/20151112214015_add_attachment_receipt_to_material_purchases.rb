class AddAttachmentReceiptToMaterialPurchases < ActiveRecord::Migration
  def self.up
    change_table :material_purchases do |t|
      t.attachment :receipt
    end
  end

  def self.down
    remove_attachment :material_purchases, :receipt
  end
end
