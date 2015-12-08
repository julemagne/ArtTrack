module ApplicationHelper

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user
  end

  def clocked_in?
    @current_user.projects.length == 0 ? nil : current_time_entry
  end

  def current_time_entry
    last_entry = TimeEntry.where(project: Project.where(user_id: @current_user.id)).last
    if last_entry
      return nil if last_entry.stop_time
      @current_time_entry ||= last_entry
    else
      return nil
    end
  end

  def proper_decimal(number)
    number.to_i == number ? number.floor : number
  end
end
