class CreateSchools < ActiveRecord::Migration[8.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.integer :school_admin_id

      t.timestamps
    end
  end
end
