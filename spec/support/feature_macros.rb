module FeatureMacros
  def select_date(date, options = {})
    field = options[:from]
    base_id = 'viewing_date'
    year, month, day = date.split(',')
    select year,  :from => "#{base_id}_1i"
    select month, :from => "#{base_id}_2i"
    select day,   :from => "#{base_id}_3i"
  end

  def select_time(time, options = {})
    field = options[:from]
    base_id = 'viewing_start_time'
    hour, minute = time.split(',')
    select hour,  :from => "#{base_id}_4i"
    select minute, :from => "#{base_id}_5i"
  end
end
