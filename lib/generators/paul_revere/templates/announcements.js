
function hideAnnouncement(announcement_created_at) {
  setCookie(announcement_created_at, 'hidden');
  $("announcement").fade();
}

