class ImportFreshbooks
  attr_reader :client

  def initialize(url: ENV['FRESHBOOKS_API_URL'], token: ENV['FRESHBOOKS_AUTH_TOKEN'], client: nil)
    @client = client || FreshBooks::Client.new(url, token)
  end

  def invoices
    collect_resource("invoice")
  end

  def payments
    collect_resource("payment")
  end

  def raw_resource(resource, page)
    Rails.logger.info "Fetching #{resource} page #{page}"
    @client.send(resource.to_sym, page: page).list[resource.pluralize]
  end

  def collect_resource(resource, page = 1)
    resource_data = raw_resource(resource, page)
    resources = resource_data[resource]
    max_pages = resource_data["pages"].to_i
    Rails.logger.debug "Fetched #{resource} page #{page} of #{max_pages} pages"
    return resources if page >= max_pages
    resources + collect_resource(resource, page + 1)
  end

  def import_invoices
    invoices.map do |invoice|
      FreshbooksInvoice.import(invoice)
    end
  end

  def import_payments
    payments.map do |invoice|
      FreshbooksPayment.import(invoice)
    end
  end
end
