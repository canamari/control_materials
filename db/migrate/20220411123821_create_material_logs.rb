class CreateMaterialLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :material_logs do |t|
      t.integer :material_id
      t.integer :quantity
      t.integer :user_id
      t.boolean :action

      t.timestamps
    end
  end
end
