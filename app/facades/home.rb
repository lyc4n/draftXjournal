class Home

  attr_reader :user, :drafts

  def initialize(user)
    @drafts = user.drafts
  end
end
