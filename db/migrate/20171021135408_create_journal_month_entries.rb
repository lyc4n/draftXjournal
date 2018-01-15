class CreateJournalMonthEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_month_entries do |t|
      t.belongs_to :journal_month, foreign_key: true
      t.integer :entry_type, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
