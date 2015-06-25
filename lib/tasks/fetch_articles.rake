namespace :wizarddev do
  desc "Fetches blog articles from wizard.codes rss feed"
  task fetch_blog: :environment do
    fail "BLOG_RSS_URL ENV is not set" unless ENV['BLOG_RSS_URL']
    puts "Updating Blog"
    BlogEntry.update_blog
  end
end
