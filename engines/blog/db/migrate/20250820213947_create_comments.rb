class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_comments do |t|
      t.references :user, foreign_key: { to_table: :users }, null: true
      t.references :entry, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.string :url
      t.text :comment, null: false

      t.timestamps
    end
  end
end
