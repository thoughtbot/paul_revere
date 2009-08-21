namespace :paul do  
  namespace :revere do
    desc "Install javascript file"  
    task :install => :environment do  
      plugin_root = File.join(Rails.root, 'vendor', 'plugins', 'paul_revere')
      [File.join('public', 'javascripts', 'announcements.js')].each do |relative_path|
        system "cp #{File.join(plugin_root, relative_path)} #{File.join(Rails.root, relative_path)}"
      end
    end  
  end
end  
