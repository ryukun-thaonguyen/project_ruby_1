module ApplicationHelper
  def full_title(page_title = '')
      base_title = t :base_title
      return page_title + " | " + base_title if page_title.blank?
      page_title + " | " + base_title
  end

  def current_language
      I18n.locale
  end
end
