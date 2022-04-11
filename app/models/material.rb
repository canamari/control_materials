class Material < ApplicationRecord
  has_many :material_logs
  validates :name, presence: true, uniqueness: true

  def quantity
    quantity_remove = self.material_logs.where(action: false).sum(:quantity)
    quantity_added = self.material_logs.where(action: true).sum(:quantity)

    quantity = quantity_added - quantity_remove
  end
end
