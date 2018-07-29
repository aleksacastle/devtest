class CreateTargetGroup < ActiveRecord::Migration[5.2]
  def change
    create_table :target_groups do |t|
      t.string :name, null: false
      t.string :external_id, null: false
      t.string :secret_code, null: false

      t.timestamps
    end
  end
end
