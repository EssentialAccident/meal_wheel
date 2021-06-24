class ApplicationController < ActionController::Base
  def previous_monday(date)
    days_before = (date.wday + 5) % 7 + 1
    date.to_date - days_before
  end
end
