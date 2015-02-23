module AnnouncementsHelper
  def announcement_hidden?(announcement)
    cookies["announcement_#{announcement.created_at}"] == "hidden"
  end

  def current_announcement
    @current_announcement ||= Announcement.current
  end

  def announcement_visibility_allowed?
    !! current_user
  end
end
