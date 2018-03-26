class JournalsController < ApplicationController
  def show
    @journal = JournalFacade.new(journal, date)


    respond_to do |format|
      format.json { render :show, locals: {journal: @journal}}
      format.html
    end
  end

  private

  def journal
    current_user.current_year_journal
  end

  def date
    if params[:month] && params[:day]
      Date.new(journal.year, params[:month].to_i, params[:day].to_i)
    else
      Date.today
    end
  end
end
