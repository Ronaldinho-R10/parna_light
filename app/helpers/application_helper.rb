module ApplicationHelper

    require 'net/http'
    require 'uri'
    require 'json'
    require 'geocoder'

    def send_request
        bairro = Local.last.bairro
        rua = Local.last.rua
        logradouro = Local.last.logradouro
        referencia = Local.last.referencia
        numero = Local.last.numero
        address = bairro + " " + "Parnamirim"
        localizacao = Geocoder.search(address)
        coordenadas = localizacao.first.coordinates
        lat = coordenadas[0].to_s 
        long = coordenadas[1].to_s
        uri = URI.parse("http://localhost:3007/api/v1/bairros/")
        header = {'Content-Type': 'application/json'}
        bairro = {nome_bairro: bairro, rua:rua, logradouro:logradouro, referencia:referencia, numero:numero, lat:lat, long:long}
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri, header)
        request.body = bairro.to_json
        puts request.body
        response = http.request(request)
        puts response
        puts lat
        puts long
        end

    def button_path
        out = ''
        out << link_to('Salvar Local', send_request, class: 'btn btn-primary')
        out.html_safe
    end 

end
