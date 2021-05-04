Dado('ter uma massa configurada a partir dos modelos disponíveis do endpoint api_OnlineChallenge_version.get para o cenário {string}') do |tipo|
  @get_versions = []
  if tipo.eql?('positivo')
    @get_make = WMC.get('/make')
    @get_make_marcas = []
    @get_make.each do |each_make|
      @get_make_marcas << each_make['ID']
    end
    @get_model = []
    @get_make_marcas.each_with_index do |make_id, index|
      query = { 'MakeID' => make_id }
      @get_model[index] = WMC.get('/model', query: query)
    end
    @get_model.each { |each_model| each_model.each { |each_version| @get_versions << each_version['ID'] } }
  else
    @get_versions << API_DATA_LOAD['invalid_model']
  end
end

Quando('chamar o endpoint api_OnlineChallenge_version.get para o cenário {string}') do |tipo|
  @get_version = []
  @get_versions.each_with_index do |make_id, index|
    query = { 'ModelID' => make_id }
    @get_version[index] = WMC.get('/version', query: query)
    while @get_version[index].size < 5 && tipo.eql?('positivo') # while necessario devido ao bug em que a api as vezes não retorna 5 resultados
      @get_version[index] = WMC.get('/version', query: query)
    end
  end
end

Entao('validar o retorno do endpoint api_OnlineChallenge_version.get de cada versiono de cada marca chamada para o cenário {string}') do |tipo|
  if tipo.eql?('positivo')
    expect(@get_version.all? { |call| call.code.eql?(API_DATA_LOAD['http_response_status']['ok']) }).to be_truthy
    expect(@get_version.all? { |each_model| each_model.all? { |each_version| expect(each_version['ModelID']).not_to be_nil } }).to be_truthy
    expect(@get_version.all? { |each_model| each_model.all? { |each_version| expect(each_version['ID']).not_to be_nil } }).to be_truthy
    expect(@get_version.all? { |each_model| each_model.all? { |each_version| expect(each_version['Name']).not_to be_nil } }).to be_truthy
    expect(@get_version.all? { |each_model| API_DATA_LOAD['versions'].all? { |version| each_model.any? { |each_version| version.eql?(each_version['Name']) } } }).to be_truthy
  else
    expect(@get_version.first.code).to eql(API_DATA_LOAD['http_response_status']['bad_request'])
    expect(@get_version.first['Message']).to eql(API_DATA_LOAD['default_errors']['messages']['message_invalid_request'])
    expect(@get_version.first['MessageDetail']).to eql(API_DATA_LOAD['default_errors']['details']['details_parameter_contains_null_entry_model_id'])
  end
end
