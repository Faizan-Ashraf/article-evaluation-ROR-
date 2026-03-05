class SubmissionPolicy
  attr_reader :user, :submission

  def initialize(user, submission)
    @user = user
    @submission = submission
  end

  def index?
    # Only competitors see "My Results" in the navbar
    user.competitor?
  end

  def show?
    user.admin? || submission.competitor == user
  end

  def create?
    user.competitor?
  end

  def new?
    create?
  end

  def edit?
    user.admin?
  end

  def update?
    user.admin?
  end

  def evaluate?
    user.admin?
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if @user.admin?
        @scope.all
      elsif @user.competitor?
        @scope.where(competitor: @user)
      else
        @scope.none
      end
    end
  end
end