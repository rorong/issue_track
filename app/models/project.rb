class Project < ApplicationRecord
    has_many :issues, dependent: :destroy
    has_many :project_assignments
    has_many :user, through: :project_assignments

    validates :title, presence: true

end
