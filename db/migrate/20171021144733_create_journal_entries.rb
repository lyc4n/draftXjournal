class CreateJournalEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_entries do |t|
      t.belongs_to :journal, foreign_key: true
      t.integer :entry_type, null: false
      t.integer :status, null:false
      t.date :target_date, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
