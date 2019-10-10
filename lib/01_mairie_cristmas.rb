require 'nokogiri'
require 'open-uri'
require 'rubygems'

def mairie_ville
  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  mairie_name = []
  mairie = page.xpath("//a[@class='lientxt']")
  mairie.map{|mairie| mairie_name << mairie.text}
  return mairie_name
end

puts mairie_ville