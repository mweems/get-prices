require '../helper/required.rb'
require 'test/unit'
require '../app/get_data.rb'

class GetDataTest < Test::Unit::TestCase

  def get_data(html)
    GetData.new(html)
  end

  def test_get_data_gets_html_from_website
    test_data = File.read('../helper/text_file.txt')
    assert_equal(test_data, get_data('HTTP://amazon.com').get_html)
  end
end