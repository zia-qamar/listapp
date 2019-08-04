module Restore
  def restore_item(list)
    list.trashed = false
    list.save
    if list.class.name == 'List'
      list.list_items.update_all(trashed: false )
    end
  end

  def move_to_trash(list)
    list.trashed = true
    list.save
    if list.class.name == 'List'
      list.list_items.update_all(trashed: true)
    end
  end
end