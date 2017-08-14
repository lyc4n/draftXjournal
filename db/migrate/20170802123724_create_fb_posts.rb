class CreateFbPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :fb_posts do |t|
      t.text :content
      t.datetime :post_date
      t.integer :status

      t.timestamps
    end
  end
end
