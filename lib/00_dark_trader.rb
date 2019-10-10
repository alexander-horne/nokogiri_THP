require 'nokogiri'
require 'open-uri'
require 'rubygems'

def crypto_name_array
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  crypto_name = []
  crypto = page.xpath("//a[@class='link-secondary']")
  crypto.each { |crypto| crypto_name << crypto.text }
  return crypto_name
end

def crypto_pricing_array
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  price_name = []
  price = {}
  price = page.xpath("//a[@class='price']")
  price.each { |price| price_name << price.text }
  return price_name
end

def result(crypto_name_array, crypto_pricing_array)
  return "#{crypto_name_array} => #{crypto_pricing_array}"
end

puts result(crypto_name_array, crypto_pricing_array)
