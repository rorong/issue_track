class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :issues
  has_many :project_assignments
  has_many :projects , through: :project_assignments
  has_many :invitations, class_name: 'User', foreign_key: :invited_by_id
end
