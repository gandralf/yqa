require "./question"
require "./authenticator"
require "./paging_navigator"
require "./questions_fetcher"
require "./question_fetcher"
require "./question_handler"

require "mechanize"

class YQA
  def initialize
    @mechanize = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }

    authenticator = Authenticator.new(@mechanize)
    authenticator.login('jesus.morningstar', 'hureia123')
  end

  def crawl_pages(start_page)
    question_fetcher = QuestionFetcher.new(@mechanize)
    question_handler = QuestionHandler.new

    questions_fetcher = QuestionsFetcher.new(@mechanize, question_fetcher, question_handler)
    paging_navigator = PagingNavigator.new(@mechanize, questions_fetcher)

    paging_navigator.navigate(start_page)
  end
end