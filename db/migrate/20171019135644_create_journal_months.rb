class CreateJournalMonths < ActiveRecord::Migration[5.1]
  def change
    create_table :journal_months do |t|
      t.belongs_to :journal, foreign_key: true
      t.integer :month

      t.timestamps
    end
  end
end
