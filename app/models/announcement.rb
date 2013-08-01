class Announcement < ActiveRecord::Base
  if Rails::VERSION::MAJOR < 4
    attr_accessible(:body)
  end

  def self.current
    order('created_at desc').first || new
  end

  def exists?
    !new_record?
  end
end
