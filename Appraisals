rails_versions = %w(
  5.0
  5.1
  5.2
)

rails_versions.each do |version|
  appraise "rails_#{version}" do
    gem "rails", "~> #{version}.0"

    gem "sqlite3", "~> 1.3.13"
  end
end

appraise "rails_6.0" do
  gem "rails", "~> 6.0.0.rc1"
end
