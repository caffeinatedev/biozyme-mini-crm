class CommissionReportTableComponent < ViewComponent::Base
  def initialize(quarters:)
    @quarters = quarters
  end

  private

  attr_reader :quarters
end