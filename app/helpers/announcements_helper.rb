module AnnouncementsHelper
  def announcement_visible?(announcement)
    announcement.exists? && announcement_unread?(announcement)
  end

  def announcement_unread?(announcement)
    cookies[announcement.to_cookie_key] != "hidden"
  end

  def current_announcement
    @current_announcement ||= Announcement.current
  end

  def announcement_visibility_allowed?
    !! current_user
  end
end
