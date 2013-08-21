require '../helper/required.rb'
require 'HTTParty'

class GetData

  def initialize(html)
    @html = html
  end

  def get_html
    data = HTTParty.get(@html)
  end
end