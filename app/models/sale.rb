class Sale < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :sales_channel
  validates :gross, presence: true, numericality: {greater_than: 0}
  validates :date, presence: true


  def net_profit
    gross - project.total_expenses
  end

  def self.search(q)
    search =  "%#{q}%"
    Sale.includes(:project).where(project_id: Project.search(q).pluck(:id))
  end
end
