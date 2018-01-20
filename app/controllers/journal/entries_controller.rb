class Journal::EntriesController < ApplicationController
  def show
    @entries = journal.entries.on_day(selected_day)
    respond_to do |format|
      format.json do
        render json: @entries
      end
    end
  end

  private

  def selected_day
    Date.strptime(params[:day])
  end

  def journal
    current_user.current_year_journal
  end
end
