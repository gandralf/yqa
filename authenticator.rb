class Authenticator
  def initialize(mechanize)
    @mechanize = mechanize
  end

  def login(username, password)
    @mechanize.get('http://br.answers.yahoo.com/my-activity') do |page|
      page.form_with(:id => "login_form") do |login_form|
        login_form.login = username
        login_form.passwd = password
      end.submit
    end
  end
end