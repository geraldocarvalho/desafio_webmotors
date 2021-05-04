class Busca < SitePrism::Page
  set_url ''

  element :input_busca, '#searchBar'
  element :btn_busca, 'div.SearchBar__results__result__name', text: 'Honda', match: :prefer_exact
  element :btn_busca_modelos, 'div.Filters__line--icon--right', text: 'Todos os modelos', match: :prefer_exact
  element :btn_modelo, 'a.Filters__line', text: 'CITY'
  element :btn_busca_versoes, 'div.Filters__line--icon--right', text: 'Todas as versões'
  element :btn_versao, 'a.Filters__line', text: '1.5 LX 16V FLEX 4P MANUAL'
  element :checkbox_loja, 'label.Checkbox', text: 'Loja'
  element :div_veiculos, 'div.ContainerCardVehicle'
  element :btn_estoque_loja, 'i.CardSeller__stock__seller__arrow'
  elements :vehicle, 'a.CardVehicle__linkPhoto'
  element :btn_simulacao, 'div.modal--close'

  def buscar_por_marca
    input_busca.set('Honda')
    btn_busca.click
  end

  def fechar_simulacao_popup
    btn_simulacao.click
  end

  def filtrar_por_modelo
    btn_busca_modelos.click
    btn_modelo.click
  end

  def filtrar_por_versao
    btn_busca_versoes.click
    btn_versao.click
  end

  def filtrar_por_loja
    checkbox_loja.click
    vehicle.first.click
  end

  def selecionar_estoque_loja
    btn_estoque_loja.click
  end
end
