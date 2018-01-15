class JournalsController < ApplicationController
  def show
    @journal = JournalFacade.new(get_journal)
  end

  private

  def get_journal
    current_user.current_year_journal
  end
end
