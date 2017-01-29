class CalculatorController < ApplicationController
  def new
  end

  def calculate
    @revenue = params[:revenue].to_i
    @expense = params[:expense].to_i
    @profit = @revenue - @expense
    render_to_string 'new'
  end
end
