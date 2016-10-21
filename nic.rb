require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

before do
	content_type :json
end

get '/api/v1/:parametro' do
	if params[:parametro]
		url = "https://www.nic.cl/registry/Whois.do?d=#{params[:parametro]}&buscar=Enviar&a=inscribir"
		b = Nokogiri::HTML(open(url))
		if b.at_css('table.tablaresultados')
		 	{ :estado => '0' }.to_json
		else
		 	{ :estado => '1' }.to_json
		end
	else
		{ :estado => '3' }.to_json
	end

end