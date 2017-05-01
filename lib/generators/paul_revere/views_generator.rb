module PaulRevere
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path(
        "../../../../app/views/announcements",
        __FILE__,
      )

      desc "Copy built-in partials to Rails application"
      def copy_partials
        filename_pattern = File.join self.class.source_root, "*.erb"
        Dir.glob(filename_pattern).map { |f| File.basename f }.each do |f|
          copy_file f, "app/views/announcements/#{f}"
        end
      end
    end
  end
end
