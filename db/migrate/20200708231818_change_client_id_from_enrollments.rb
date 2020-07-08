class ChangeClientIdFromEnrollments < ActiveRecord::Migration[6.0]
  def change
    change_column :enrollments, :client_id, :bigint, null: true
  end
end
