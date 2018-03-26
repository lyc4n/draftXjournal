class JournalFacade

  attr_reader :journal, :date

  def initialize(journal, date=nil)
    @journal = journal
    @date    = date || Date.today
  end

  def day_entries
    @day_entries ||= @journal.entries.on_day(@date)
  end

  def month_entries
    @month_entries ||= @journal.month_entries.on_month(@date.month)
  end

  def json
    {
      journal:      @journal,
      dayEntries:   day_entries,
      monthEntries: month_entries
    }.to_json
  end
end
