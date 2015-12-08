class ProjectCost < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :cost_type, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}

  # def self.search(q, user_id)
  #   projects = Project.where("user_id = ? AND name LIKE ?", user_id, q)
  #   project_costs = ProjectCost.includes(:project).where("cost_type LIKE ?", q)
  #   project_costs = project_costs.select{|cost| cost.project.user_id == user_id}
  #   projects += project_costs.map{|cost| cost.project}
  #   projects
  # end

  def self.search(pc, q)
    search = "%#{q}%"
    project_costs_search = Project.where(id: pc.where("cost_type LIKE LOWER(?)", search).pluck(:project_id)).arel.constraints.reduce(:and)
    project_search = Project.search(q).arel.constraints.reduce(:and)
    Project.where(project_search.or(project_costs_search))
  end
end
