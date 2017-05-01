class Home

  attr_reader :user, :drafts

  DRAFTS_PER_PAGE = 10

  def initialize(user, params={})
    @user = user
    @drafts = user.drafts.paginate(page: params[:page], per_page: DRAFTS_PER_PAGE)
  end
end
