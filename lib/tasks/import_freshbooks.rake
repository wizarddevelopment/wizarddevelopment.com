namespace :wizarddev do
  desc "Fetches blog articles from wizard.codes rss feed"
  task import_freshbooks: :environment do
    fail "Freshbooks ENV auth info missing" unless ENV['FRESHBOOKS_API_URL'] && ENV['FRESHBOOKS_AUTH_TOKEN']
    puts "Importing Freshbooks"
    importer = ImportFreshbooks.new
    invoices = importer.import_invoices
    payments = importer.import_payments
    puts "Imported #{invoices.count} invoices"
    puts "Imported #{payments.count} payments"
    puts "Finished importing Freshbooks"
  end
end
