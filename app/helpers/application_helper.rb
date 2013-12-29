module ApplicationHelper
  def guess_user_role
    # if we know it, return it
    if current_user && current_user.role.present?
      return 'org' if current_user.role == 'organization'
      return current_user.role
    end
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

  def item_offer_location(item_offer)
    location = []
    location.push "#{item_offer.city}," if item_offer.city.present?
    location.push "#{item_offer.state}" if item_offer.state.present?
    location.push "#{item_offer.zip}" if item_offer.zip.present?
    location.join(' ')
  end
end
