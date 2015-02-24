describe("Announcements", function() {
  beforeEach(function() {
    eraseCookie('test');
  });
  it("sets a cookie to hidden", function() {
    expect(readCookie('test')).toBe(null);
    hideAnnouncement('test');
    expect(readCookie('test')).toBe('hidden');
  });
});
