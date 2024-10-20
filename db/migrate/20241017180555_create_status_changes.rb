class CreateStatusChanges < ActiveRecord::Migration[8.0]
  def change
    create_enum :project_statuses, %w[created in_progress on_hold completed]

    create_table :status_changes do |t|
      t.enum :status, enum_type: :project_statuses, null: false, index: true

      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
