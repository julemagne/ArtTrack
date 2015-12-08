class BusinessExpense < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :amount, presence: true

  def self.search(q)
    q = "%#{q}%"
    BusinessExpense.where("name LIKE LOWER(?) OR description LIKE LOWER(?)", q, q)
  end
end
