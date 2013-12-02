module ApplicationHelper
  def guess_user_role
    # if we know it, return it
    return current_user.role if current_user
    guess = current_page?(org_login_path) ? 'org' : nil
    guess ||= cookies[:is_member] || 'donor'
  end

  def how_many_to_show(what_to_show, how_many, page)
    count = what_to_show.count
    return "0" if count == 0
    first_num = ((page-1) * how_many) + 1
    return "0" if first_num > count
    last_num = first_num + (how_many - 1)
    last_num = count if last_num > count
    return "#{first_num}" if first_num == last_num
    "#{first_num}-#{last_num}"
  end
end
