require 'nokogiri'
require 'open-uri'
require 'json'

url = "https://www.nic.cl/registry/Whois.do?d=asdasdasd&buscar=Enviar&a=inscribir"
b = Nokogiri::HTML(open(url))
if b.css('table.tablaresultados')
 	puts b.css('table.tablaresultados').to_s
else
 	puts b.css('body').to_s
end