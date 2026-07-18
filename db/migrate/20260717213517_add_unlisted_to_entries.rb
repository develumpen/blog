class AddUnlistedToEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :entries, :unlisted, :boolean, default: false
  end
end
