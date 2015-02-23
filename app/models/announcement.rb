class Announcement < ActiveRecord::Base
  def self.current
    order("created_at desc").first || new
  end

  def exists?
    !new_record?
  end

  def to_cookie_key
    "#{self.class.name.downcase}_#{created_at.iso8601}"
  end
end
