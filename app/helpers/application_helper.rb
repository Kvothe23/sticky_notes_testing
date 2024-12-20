module ApplicationHelper
  def note_color(id)
    colors = %w[yellow pink blue green orange]
    colors[id % colors.size]
  end
end
