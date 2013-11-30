module ApplicationHelper
  def guess_user_role
    # if we know it, return it
    return current_user.role if current_user
    guess = current_page?(org_login_path) ? 'org' : nil
    guess ||= cookies[:is_member] || 'donor'
  end
end
