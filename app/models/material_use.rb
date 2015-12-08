class MaterialUse < ActiveRecord::Base
  belongs_to :material_purchase
  belongs_to :project
  belongs_to :user

  # validates :name, presence: true
  validates :material_purchase,   presence: true

  validates :units,               presence: true, numericality: {greater_than: 0.00}
  validate :enough_in_stock, on: [:create, :update]

  delegate :name,                 to: :material_purchase


  def enough_in_stock
    unless MaterialPurchase.find(material_purchase_id).units_remaining >= units
      errors.add(:units, "|| There are only #{MaterialPurchase.find(material_purchase_id).units_remaining} in stock" )
      false
    else
      true
    end
  end


  def self.search(mu, q)
    search =  "%#{q}%"
    # material_uses_search = Project.where(id: mu.where("material_purchase.name = ?", search).where("name LIKE LOWER(?)", search).pluck(:project_id)).arel.constraints.reduce(:and)
    project_search = Project.search(q).arel.constraints.reduce(:and)
    Project.where(project_search)

    #MaterialUse.where('name LIKE ? OR description LIKE ?', search, search)
  end

  def cost
    units * (material_purchase.cost / material_purchase.units)
  end
end
