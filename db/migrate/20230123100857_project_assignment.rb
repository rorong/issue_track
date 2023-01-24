class ProjectAssignment < ActiveRecord::Migration[7.0]
  def change
    create_table :project_assignments do |t|
      t.references :user, nullable: false
      t.references :project, nullable: false

      t.timestamps
    end
  end
end
