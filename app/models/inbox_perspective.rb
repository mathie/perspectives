class InboxPerspective < Perspective
  enum show_items: [
    :available_items,
    :remaining_items,
    :all_items
  ]
end
