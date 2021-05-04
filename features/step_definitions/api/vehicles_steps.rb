Quando('chamar o endpoint api_OnlineChallenge_vehicles.get para o cenário {string}') do |tipo|
  pages = 1
  boolean_key = true
  @get_vehicles = []
  if tipo.eql?('positivo')
    while boolean_key.eql?(true)
      query = { 'Page' => pages }
      @get_vehicles[pages - 1] = WMC.get('/Vehicles', query: query)
      boolean_key = false if @get_vehicles.last.empty?
      pages += 1
    end
  else
    query = { 'Page' => API_DATA_LOAD['invalid_model'] }
    @get_vehicles[pages - 1] = WMC.get('/Vehicles', query: query)
  end
end

Entao('validar o retorno do endpoint api_OnlineChallenge_vehicles.get de cada vehículo em cada página chamada para o cenário {string}') do |tipo|
  if tipo.eql?('positivo')
    expect(@get_vehicles.all? { |call| call.code.eql?(API_DATA_LOAD['http_response_status']['ok']) }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['ID']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Make']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Model']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Version']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Image']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['KM']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Price']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['YearModel']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['YearFab']).not_to be_nil } }).to be_truthy
    expect(@get_vehicles.all? { |each_element| each_element.all? { |each_vehicle| expect(each_vehicle['Color']).not_to be_nil } }).to be_truthy
  else
    expect(@get_vehicles.first.code).to eql(API_DATA_LOAD['http_response_status']['bad_request'])
    expect(@get_vehicles.first['Message']).to eql(API_DATA_LOAD['default_errors']['messages']['message_invalid_request'])
    expect(@get_vehicles.first['MessageDetail']).to eql(API_DATA_LOAD['default_errors']['details']['details_parameter_contains_null_entry_page'])
  end
end
