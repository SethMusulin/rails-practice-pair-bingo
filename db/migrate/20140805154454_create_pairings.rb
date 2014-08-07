class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :user_id
      t.index :user_id
      t.integer :partner_id
      t.index :partner_id
      t.date :date
      t.timestamps
    end
  end
end
