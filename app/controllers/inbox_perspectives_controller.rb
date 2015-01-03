class InboxPerspectivesController < PerspectivesController
  private

  def klass
    InboxPerspective
  end

  def perspective_fields
    super << [ :show_items ]
  end
end
