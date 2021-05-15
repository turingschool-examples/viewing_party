module ApplicationHelper
  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours}:#{rest}"
  end
end
