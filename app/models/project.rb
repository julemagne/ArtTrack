class Project < ActiveRecord::Base
  belongs_to :user
  has_many :time_entries
  has_many :sales, dependent: :restrict_with_error
  has_many :material_uses
  has_many :project_costs
  validates :name, presence: true
  accepts_nested_attributes_for :material_uses, reject_if: proc { |attributes| attributes['units'].blank? }, allow_destroy: :true
  accepts_nested_attributes_for :project_costs, reject_if: :all_blank, allow_destroy: :true

  def total_time
    # Set a default value for time entry total_time field later
    time_entries.reduce(0.0){|sum, t| sum + (t.total_time || 0)}
  end

  def estimated_value
    total_expenses + time_expense
  end

  def time_expense
    user.hourly_rate * total_time/3600
  end

  def total_expenses
    total_material_cost + total_other_expenses
  end

  def total_material_cost
    # project = Project.joins(:material_uses).where('material_purchase_id' => material_purchases.id).includes(:material_purchases)
    # project.material_uses.where(material_purchase_id: project.user.material_purchases)
    materials = MaterialUse.includes(:material_purchase).where(project_id: id)
    if materials.length > 0
      cost = materials.map{|x|  x.material_purchase.cost}
      units = materials.map{|x|  x.material_purchase.units}
      total_units = materials.map {|x| x.units}

      (cost.sum/units.sum) * total_units.sum
    else
      0
    end
  end

  def total_other_expenses
    if project_costs.length > 0
      project_costs.map{|cost| cost.amount}.reduce(:+)
    else
      0
    end
  end

  def self.search(q)
    search =  "%#{q}%"
    Project.where("projects.name LIKE LOWER(?) OR projects.description LIKE LOWER(?)", search, search)
  end
end
