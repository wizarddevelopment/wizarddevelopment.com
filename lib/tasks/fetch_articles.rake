namespace :wizarddev do

  desc "Fetches blog articles from wizard.codes rss feed"
  task fetch_blog: :environment do
    fail "BLOG_RSS_URL ENV is not set in config/application.yml" unless ENV['BLOG_RSS_URL']
    puts "Fetching Blog"
    BlogEntry.update_from_blog(ENV['BLOG_RSS_URL'])
  end
end
