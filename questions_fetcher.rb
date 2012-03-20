class QuestionsFetcher
  # @param [QuestionFetcher] question_fetcher
  # @param [QuestionHandler] question_handler
  def initialize(mechanize, question_fetcher, question_handler)
    @mechanize = mechanize
    @question_fetcher = question_fetcher
    @question_handler = question_handler
  end

  # @param [Page] page
  def fetch_questions(page)
    page.links.each do |link|
      if link.href.match '/question/index;'
        question = @question_fetcher.fetch_question(link.href)
        @question_handler.new_question(question)
      end
    end
  end
end