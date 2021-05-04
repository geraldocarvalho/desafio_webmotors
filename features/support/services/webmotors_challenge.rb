# configuracoes dinamicas do HTTParty
module WMC
  include HTTParty
  base_uri 'https://desafioonline.webmotors.com.br/api/OnlineChallenge'
  format :json
  headers 'Content-Type': 'application/json'
end
