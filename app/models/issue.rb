class Issue < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy

end
