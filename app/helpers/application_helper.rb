module ApplicationHelper
  def class_for_flash_type(type)
    case type
    when "notice" then "bg-blue-50 text-blue-400 border-2 border-blue-100"
    when "alert" then "bg-red-50 text-red-400 border-2 border-red-100"
    end
  end
end
