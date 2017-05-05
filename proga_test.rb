require 'test/unit'
require_relative './proga.rb'


class ProgaTest < Test::Unit::TestCase
  def test_add_link
    #setup
    links = []
    link_body = ""
    rand_numb = rand(100)
    rand_numb.times do |link|
      rnub = rand(34)
      url = "http://assets#{rnub}.pavlyut.com"
      unless links.include? url
        links << url
        link_body += "<a href='#{url}'>blabla#{rnub}</a>"
        end
      end

    @links = links

    @page = Nokogiri::HTML("<html><body>#{link_body}</body></html>")
    proga = Proga.new
    proga.add_link(@page)
    extracted_links = proga.extract_links()
  end

  def test_extract_links
    proga = Proga.new
    proga.add_link(@page)
    extracted_links = proga.extract_links()
    assert_equal extracted_links.count, @links.count    
  end

  #execute

  def test_all_links_included
    proga = Proga.new
    proga.add_link(@page)
    extracted_links = proga.extract_links()
    #validate
    @links.each do |link|
      assert_equal extracted_links.include?(link), true
    end      
  end
end