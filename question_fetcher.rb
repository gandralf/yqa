class QuestionFetcher
  def initialize(mechanize)
    @mechanize = mechanize
  end

  def fetch_question(url)
    question_page = @mechanize.get(url)

    question = Question.new
    question.url = url
    question.title = question_page.search("h1.subject").text
    question.category = "RE" # todo: parse
    question.body = question_page.search("div.content").text
    question.user = question_page.search("span.fn")[0].text
    question.date = question_page.search("div.qa-container abbr")[0].attributes['title'].text

    # todo: additional information, my answer

    question
  end
end