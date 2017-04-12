class CreateDrafts < ActiveRecord::Migration[5.1]
  def change
    create_table :drafts do |t|
      t.text :content
      t.string :title
      t.datetime :archived_at
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
