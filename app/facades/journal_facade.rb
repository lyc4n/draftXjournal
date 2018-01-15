class JournalFacade

  def initialize(journal)
    @journal = journal
  end

  def day_entries
    @day_entries ||= @journal.entries.on_day(Date.today)
  end

  def month_entries
    @month_entries ||= @journal.month_entries.on_month(Date.today.month)
  end
end
