Dado('ter uma massa configurada a partir dos modelos disponíveis do endpoint api_OnlineChallenge_model.get para o cenário {string}') do |tipo|
  @make_get_marcas = []
  if tipo.eql?('positivo')
    @get_make = WMC.get('/make')
    @get_make.each do |each_make|
      @make_get_marcas << each_make['ID']
    end
  else
    @make_get_marcas << API_DATA_LOAD['invalid_model']
  end
end

Quando('chamar o endpoint api_OnlineChallenge_model.get') do
  @get_model = []
  @make_get_marcas.each_with_index do |make_id, index|
    query = { 'MakeID' => make_id }
    @get_model[index] = WMC.get('/model', query: query)
  end
end

Entao('validar o retorno do endpoint api_OnlineChallenge_model.get de cada modelo de cada marca chamada para o cenário {string}') do |tipo|
  if tipo.eql?('positivo')
    expect(@get_model.all? { |each_model| each_model.code.eql?(API_DATA_LOAD['http_response_status']['ok']) }).to be_truthy
    expect(@get_model.all? { |each_make| each_make.all? { |each_model| expect(each_model['MakeID']).not_to be_nil } }).to be_truthy
    expect(@get_model.all? { |each_make| each_make.all? { |each_model| expect(each_model['ID']).not_to be_nil } }).to be_truthy
    expect(@get_model.all? { |each_make| each_make.all? { |each_model| expect(each_model['Name']).not_to be_nil } }).to be_truthy
    expect(@get_model.all? { |each_make| each_make.all? { |each_model| API_DATA_LOAD['models'].any? { |model| model.eql?(each_model['Name']) } } }).to be_truthy
  else
    expect(@get_model.first.code).to eql(API_DATA_LOAD['http_response_status']['bad_request'])
    expect(@get_model.first['Message']).to eql(API_DATA_LOAD['default_errors']['messages']['message_invalid_request'])
    expect(@get_model.first['MessageDetail']).to eql(API_DATA_LOAD['default_errors']['details']['details_parameter_contains_null_entry_make_id'])
  end
end
