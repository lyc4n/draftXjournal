class CreateJournals < ActiveRecord::Migration[5.1]
  def change
    create_table :journals do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :year,   null: false
      t.integer :status, null: false, default: 1

      t.timestamps
    end
  end
end
