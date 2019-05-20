module Helpers
  def get_token
    timout = Capybara.default_max_wait_time
    timout.times do
      js_script = 'return window.localStorage.getItem("default_auth_token");'
      @token = page.execute_script(js_script)
    end
    @token
  end
end