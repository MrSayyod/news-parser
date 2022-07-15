class ApplicationController < ActionController::Base
  def urlHelper(url)
    if url.start_with?('/')
      url.prepend('https://www.bbc.com')
    else
      url
    end
  end

  helper_method :urlHelper
end
