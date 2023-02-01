class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :description, presence: true
  validates :title, presence: true



end
