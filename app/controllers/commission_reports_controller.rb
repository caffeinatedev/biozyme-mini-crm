class CommissionReportsController < ApplicationController
  def show
    @year = params[:year]&.to_i || Date.current.year
    @report = CommissionReport.new(user: current_user, year: @year)
  end
end
