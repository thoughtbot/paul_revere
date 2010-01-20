class Announcement < ActiveRecord::Base
  def self.current
    first(:order => 'created_at DESC') || new
  end

  def exists?
    !new_record?
  end
end
