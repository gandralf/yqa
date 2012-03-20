require "rspec"
require "mechanize"
require "./yqa"

describe "My behaviour" do
  before(:all) do
    @yqa = YQA.new
  end

  it "should craw a page" do
    start_page = 'http://br.answers.yahoo.com/my-activity/qa?link=answer'
    @yqa.crawl_pages(start_page)
  end
end