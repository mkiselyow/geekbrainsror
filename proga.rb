# 1. Письменная речь.
# 2. Болезнь инструмента.
# 3. Требования к результату.
# 4. План программы

# Задача: Программа получает ссылку на страницу, выбирает оттуда все ссылки которые найдет и выводит их на экран.
# Ограничения: программа должна получать ссылку от меня в интерактивном режиме (используя метод gets)

# Программа:
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

class Proga

  def self.test
    proga = Proga.new
    proga.add_link('https://www.yandex.ru')
    proga.extract_links()
    proga.print_links()
  end

  def initialize()
    @print_links = [] # массив, в который будут складываться все ссылки с выбранной страницы
  end

  # 1. получает ссылку на страницу
  def add_link(link = 'http://www.nokogiri.org/tutorials/installing_nokogiri.html')
    puts "Please, input a web-site" # запрос у пользователя ссылки на сайт
    @link = link
  end

  # 2. выбирает оттуда все ссылки которые найдет
  def extract_links
    doc = Nokogiri::HTML(open(@link, allow_redirections: :all))
    puts "### Search for href's by css"
    doc.css('a').map do |link|
      @print_links << link['href'] if link['href'].include? "http"
      @print_links.uniq!
    end
  end

  # 3. и выводит их на экран
  def print_links
    puts @print_links
  end

end

Proga.test

# class ProgaTest
#   def should_get_link

    # proga = Proga.new
    # proga.add_link('https://www.yandex.ru')
    # proga.extract_links()

    # expect(proga.print_links).to_include 'https://www.yandex.ru'
    
    # proga.print_links()
#   end
# end