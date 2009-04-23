# Include hook code here

config.to_prepare do
  ApplicationController.helper(AnnouncementsHelper)
end
