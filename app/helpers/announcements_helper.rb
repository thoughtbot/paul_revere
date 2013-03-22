module AnnouncementsHelper
  def announcement_hidden?(announcement)
    cookies["announcement_#{announcement.cookie_identifier}"] == "hidden"
  end

  def current_announcement
    @current_announcement ||= Announcement.current
  end
end
