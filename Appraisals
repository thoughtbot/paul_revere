rails_versions = %w(
  5.0
  5.1
  5.2
  6.0
  6.1
)

rails_versions.each do |version|
  appraise "rails_#{version}" do
    gem "rails", "~> #{version}.0"

    if Gem::Version.new(version) >= Gem::Version.new("6.0")
      gem "sqlite3", "~> 1.4.0"
    else
      gem "sqlite3", "~> 1.3.13"
    end
  end
end
