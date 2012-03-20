# encoding: utf-8

class PagingNavigator
  def initialize(mechanize, questions_fetcher)
    @mechanize = mechanize
    @questions_fetcher = questions_fetcher
  end

  # @param [Page] start_page
  def navigate(start_page)
    current_page = @mechanize.get(start_page)
    @questions_fetcher.fetch_questions(current_page)
    next_page = current_page.link_with(:text => /Próxima >/)
    navigate(next_page.href) if next_page
  end
end