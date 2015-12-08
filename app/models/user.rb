class User < ActiveRecord::Base
  has_many :projects
  has_many :material_purchases do
    def in_stock
      where("units_remaining > 0")
    end
  end
  has_many :material_uses
  has_many :project_costs
  has_many :sales
  has_many :sales_goals
  has_many :sales_channels
  has_many :material_uses
  has_many :project_costs
  has_many :sales
  has_secure_password
  has_attached_file :avatar, styles: { medium: "300x300>#", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
  validates :email, presence: true,
      uniqueness: { case_sensitive: false },
      format: {
        with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
        message: "Not a valid email address",
        on: :create
      }
  validates :password, length: { minimum: 8 }, allow_nil: true
  validates :hourly_rate, presence: true, numericality: {greater_than: 0}

end
