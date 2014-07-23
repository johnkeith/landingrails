module ApplicationHelper
  def reload_flash
    page.replace_html "flash_messages", partial: 'partials/flashes'
  end
end
