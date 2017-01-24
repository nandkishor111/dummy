module ApplicationHelper
  def full_name
    current_user.fullname&.titleize
  end

  
end
