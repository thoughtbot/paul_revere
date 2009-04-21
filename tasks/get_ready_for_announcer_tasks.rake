namespace :get do  
  namespace :ready do
    namespace :for do
      desc "Install javascript file"  
      task :announcer => :environment do  
        plugin_root = File.join(Rails.root, 'vendor', 'plugins', 'get_ready_for_announcer')
        [File.join('public', 'javascripts', 'announcements.js')].each do |relative_path|
          system "cp #{File.join(plugin_root, relative_path)} #{File.join(Rails.root, relative_path)}"
        end
      end  
    end
  end
end  

