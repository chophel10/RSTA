class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :complains, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :assigns, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { in: 2..20 }
  validates :cid, presence: true, length: { is: 11 }, uniqueness: true
  validates :phone, presence: true, format: { with: /(17|77|16)\d{6}/,
    message: "Invalid Phone Number." }
  def is_admin
    self.role_id == Role.admin
  end
  def is_customercare
    self.role_id == Role.customercare
  end
  def is_complainer
    self.role_id == Role.complainer
  end
end
