class Question
  attr_accessor :url, :category, :title, :body, :user, :date

  def initialize
    @url = nil
    @category = nil
    @title = nil
    @body = nil
    @user = nil
    @date = nil
  end
end