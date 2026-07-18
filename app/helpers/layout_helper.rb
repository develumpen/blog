module LayoutHelper
  def menu_items
    MenuItem.includes(:entry).where.not(entry: { draft: true })
  end
end
