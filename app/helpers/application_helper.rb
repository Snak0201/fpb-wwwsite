module ApplicationHelper
  def page_title(title = '')
    title.present? ? "#{title} | ほしのなか政府" : 'ほしのなか政府'
  end
end
