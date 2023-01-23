class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.string :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
