class CreateEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :entries do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.datetime :published_at
      t.boolean :draft, null: false, default: true
      t.text :body_markdown, null: false
      t.text :body_html, null: false

      t.timestamps
    end
  end
end
