module ApplicationHelper
  def setting key
    setting = Setting.find_by_key key
    setting ? setting.value : "Specified {{#{key}}} setting for text here..."
  end
end
