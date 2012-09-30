class Announcement < ActiveRecord::Base
  attr_accessible :body

  def self.current
    first(:order => 'created_at DESC') || new
  end
  
  def cookie_identifier
    self.created_at.strftime("%Y%m%d%H%M%S")
  end

  def exists?
    !new_record?
  end
end
