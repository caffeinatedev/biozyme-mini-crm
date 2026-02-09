class CommissionReport
  Quarter = Struct.new(:name, :direct_sales, :indirect_sales, :commission)

  DIRECT_RATE   = 0.05
  INDIRECT_RATE = 0.02

  def initialize(user:, year:)
    @user = user
    @year = year
  end

  def quarters
    (1..4).map do |quarter|
      range = quarter_date_range(quarter)

      direct = direct_sales(range)
      indirect = indirect_sales(range)

      Quarter.new(
        "Q#{quarter}",
        direct,
        indirect,
        calculate_commission(direct, indirect)
      )
    end
  end

  private

  attr_reader :user, :year

  def quarter_date_range(quarter)
    start_month = (quarter - 1) * 3 + 1
    start_date = Date.new(year, start_month, 1)
    end_date   = (start_date + 3.months).prev_day

    start_date..end_date
  end

  def direct_sales(range)
    Sale.where(user: user, sold_on: range).sum(:amount)
  end

  def indirect_sales(range)
    Sale.joins(:contact)
        .where(
          sold_on: range,
          contacts: { primary_user_id: user.id }
        )
        .where.not(user_id: user.id)
        .sum(:amount)
  end

  def calculate_commission(direct, indirect)
    (direct * DIRECT_RATE + indirect * INDIRECT_RATE).to_i
  end
end
