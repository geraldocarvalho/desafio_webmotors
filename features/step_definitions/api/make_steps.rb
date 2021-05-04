Quando('chamar o endpoint api_OnlineChallenge_make.get') do
  @get_make = WMC.get('/make')
end

Entao('validar o retorno do endpoint api_OnlineChallenge_make.get') do
  expect(@get_make.code).to eql(API_DATA_LOAD['http_response_status']['ok'])
  expect(@get_make.all? { |value| expect(value['ID']).not_to be_nil }).to be_truthy
  expect(@get_make.all? { |value| expect(value['Name']).not_to be_nil }).to be_truthy
  expect(@get_make.all? { |response| API_DATA_LOAD['makes'].any? { |data| data.eql?(response['Name']) } }).to be_truthy
end
