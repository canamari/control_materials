class MaterialLog < ApplicationRecord
  belongs_to :material
  belongs_to :user

  validate :valid_quantity!, if: -> { self.action == false }

  def valid_quantity!

    quantity_remove = MaterialLog.where(material_id: self.material_id, action: false).sum(:quantity)
    quantity_added = MaterialLog.where(material_id: self.material_id, action: true).sum(:quantity)
    
    quantity = quantity_added - quantity_remove

    quantity = quantity - self.quantity

    return true if quantity > 0

    errors.add(:quantity, "quntidade invalida")

end

end
