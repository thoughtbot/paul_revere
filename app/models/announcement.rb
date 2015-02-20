class Announcement < ActiveRecord::Base
  def self.current
    order('created_at desc').first || new
  end

  def exists?
    !new_record?
  end
end
