class CreateTaggings < ActiveRecord::Migration[8.0]
  def change
    create_table :blog_taggings do |t|
      t.references :entry, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
