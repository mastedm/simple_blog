module ApplicationHelper
  def setting key
    setting = Setting.find_by_key key
    setting ? setting.value : "Specified {{#{key}}} setting for text here..."
  end
  
  def setting_image key, version
    setting = Setting.find_by_key key
    url = (setting && setting.image) ? setting.image.url(version) : "/images/avatar.jpg"
    
    "<img src=\"#{url}\" alt=\"\" />".html_safe
  end
end
