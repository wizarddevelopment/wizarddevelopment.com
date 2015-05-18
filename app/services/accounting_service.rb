# rubocop:disable Metrics/AbcSize
class AccountingService
  attr_reader :ledger
  def initialize
    @ledger = Ledger.new
    populate_ledger
  end

  def to_h
    {
      invoices: invoices,
      payments: payments,
      ledger: ledger.weekly_series
    }
  end

  private

  def populate_ledger
    add_invoices
    add_payments
  end

  def add_invoices
    invoices.each do |invoice|
      ledger.add_item(account: :invoices, date: invoice.date, amount: invoice.amount.to_f)
    end
  end

  def add_payments
    payments.each do |payment|
      ledger.add_item(account: :payments, date: payment.date, amount: payment.amount.to_f)
    end
  end

  def invoices
    FreshbooksInvoice.order(:date) # .where('date > ?', Date.today - 90.days)
  end

  def payments
    FreshbooksPayment.order(:date) # .where('date > ?', Date.today - 90.days)
  end

  class Ledger
    attr_reader :accounts, :dates, :weeks
    def initialize
      @accounts = {}
      @dates = {}
      @weeks = {}
    end

    def add_item(account:, date:, amount:)
      accounts[account] ||= {}
      accounts[account][date] ||= DaySummary.new(account: account, date: date, amount: 0)
      accounts[account][date].amount += amount

      add_to_weekly(account: account, date: date, amount: amount)
      add_to_daily(account: account, date: date, amount: amount)
    end

    def add_to_daily(account:, date:, amount:)
      dates[date] ||= {}
      dates[date][account] ||= DaySummary.new(account: account, date: date, amount: 0)
      dates[date][account].amount += amount
    end

    def add_to_weekly(account:, date:, amount:)
      date = date.beginning_of_week
      weeks[date] ||= {}
      weeks[date][account] ||= DaySummary.new(account: account, date: date, amount: 0)
      weeks[date][account].amount += amount
    end

    def fill_gaps
      dates_range = dates.keys
      account_names = accounts.keys
      (dates_range.min..dates_range.max).each do |date|
        account_names.each do |account|
          add_item(account: account, date: date, amount: 0)
        end
      end
    end

    def daily_series
      fill_gaps
      data = accounts.each_with_object({}) do |(account, days), series|
        series[account] = days.keys.sort.map { |date| days[date] }
      end
      data[:labels] = dates.keys.sort
      data
    end

    def weekly_series
      fill_gaps
      data = accounts.each_with_object({}) do |(account, _days), series|
        series[account] = weeks.keys.sort.map { |date| weeks[date][account] }
      end
      data[:labels] = weeks.keys.sort
      data
    end
  end

  class DaySummary
    attr_reader :account, :date, :amount
    attr_writer :amount
    def initialize(account:, date:, amount:)
      @date = date
      @amount = amount
      @account = account
    end
  end
end
