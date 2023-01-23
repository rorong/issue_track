class Issue < ApplicationRecord
  belongs_to :project
  has_many :issue_assignments, dependent: :destroy
  has_many :comments, dependent: :destroy
end
