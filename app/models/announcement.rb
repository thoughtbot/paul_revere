class Announcement

  mattr_accessor :file_path
  attr_accessor :created_at, :body

  def initialize
    if File.readable?(Announcement.file_path)
      file = File.open(Announcement.file_path)
      @body = file.read
      @created_at = file.mtime.to_i unless body.blank?
    end
  end

  def exists?
    !created_at.nil?
  end

end
