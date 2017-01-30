class CalculatorController < ApplicationController

  def new_profit
  end

  def new_basic_valuation
  end

  def profit
    @revenue = params[:revenue].to_i
    @expense = params[:expense].to_i
    @profit = @revenue - @expense
  end

  def basic_valuation
    @baseline_users = params[:baseline_users].to_i
    @pre_ad_growth = params[:pre_ad_growth].to_f
    @pre_ad_years = params[:pre_ad_years].to_i
    @arpu = params[:arpu].to_i
    @discount_rate = params[:discount_rate].to_f
    @plan_length = params[:plan_length].to_i
    @pv_plan = pv_plan.round(0)
  end

  private

  def user_growth
    (1 + @pre_ad_growth)**@pre_ad_years
  end

  def terminal_users
    @baseline_users * user_growth
  end

  def revenue
    @arpu * terminal_users
  end

  def years_of_revenue
    @plan_length - @pre_ad_years
  end

  def total_revenue
    revenue * years_of_revenue
  end

  def pv_annuity
    value = 0
    years_of_revenue.times do |year|
      value += revenue / ((1 + @discount_rate) ** (year + 1))
    end
    value
  end

  def pv_plan
    (1 / (1 + @discount_rate) ** @pre_ad_years) * pv_annuity
  end
end
