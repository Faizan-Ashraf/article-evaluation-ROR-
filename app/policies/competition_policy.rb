class CompetitionPolicy
  attr_reader :user, :competition

  def initialize(user, competition)
    @user = user
    @competition = competition
  end

  def create?
    user&.admin?
  end

  def new?
    create?
  end

  def submissions?
    user&.admin?
  end

  def evaluate?
    user&.admin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user&.admin?
        @scope.all
      else
        @scope.where(is_active: true)
      end
    end
  end
end
