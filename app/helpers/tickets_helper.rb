module TicketsHelper
  def count_closed
    content_tag(:span, @tickets.closed.count, class: 'label round counter') if @tickets.closed.any?
  end

  def count_on_hold
    content_tag(:span, @tickets.on_hold.count, class: 'label round counter') if @tickets.on_hold.any?
  end

  def count_unassigned
    content_tag(:span, @tickets.unassigned.count, class: 'label round counter') if @tickets.unassigned.any?
  end

  def count_open
    content_tag(:span, @tickets.open.count) if @tickets.open.any?
  end
end
