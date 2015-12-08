class SalesGoal < ActiveRecord::Base
  belongs_to :user
  has_one :sales_channel
  validates :amount, presence: true, numericality: {greater_than: 0}
  validates :length_of_time, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_greater_start_time

  def end_time_greater_start_time
    end_time > start_time
  end

  def self.update_goals(user_id)
    goals = SalesGoal.where('user_id = ?', user_id)
    goals.each do |goal|
      #Finds all sales within the sales goal start/end dates
      sales = applicable_sales(user_id, goal)
      if sales.count > 0
        success = goal.success
        goal.success = sum_of_sales(sales) >= goal.amount
        goal.save unless success == goal.success
      end
    end
  end

  def self.applicable_sales(user_id, goal)
    sales = Sale.joins(:project).where('projects.user_id' => user_id).includes(:sales_channel)
    start_date = goal.start_time
    end_date = goal.end_time
    if goal.sales_channel_id
      sales.select{|sale| sale.date.between?(start_date, end_date) && sale.sales_channel_id == goal.sales_channel_id}
    else
      sales.select{|sale| sale.date.between?(start_date, end_date)}
    end
  end

  def self.sum_of_sales(sales)
    sales.map{|sale| sale.gross}.reduce(:+)
  end

  def self.percent_completion(goal)
    sales = applicable_sales(goal.user_id, goal)
    return sum_of_sales(sales) / goal.amount if sales.length > 0
    return 0
  end

  def days_remaining
    begin
      (end_time - Date.today).to_i
    rescue
      ""
    end
  end
end
