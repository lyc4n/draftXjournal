class Journal::MonthEntriesController < ApplicationController
  def show
    @month_entries = journal.month_entries.on_month(params[:month])

    respond_to do |format|
      format.json do
        render json: @month_entries
      end
    end
  end

  private

  def journal
    current_user.current_year_journal
  end
end
