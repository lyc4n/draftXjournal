class CreateUserAuths < ActiveRecord::Migration[5.1]
  def change
    create_table :user_auths do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :token, null: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end

    add_index :user_auths, [:provider, :uid], unique: true
  end
end
