Dado('acessar a home') do
  @page = Busca.new
  @page.load
end

Quando('realizar a busca pelo produto') do
  @page.buscar_por_marca
  @page.filtrar_por_modelo
  @page.filtrar_por_versao
end

Quando('filtrar por uma loja') do
  @page.filtrar_por_loja
  within_window(switch_to_window(windows.last))
  @page.fechar_simulacao_popup
  @page.selecionar_estoque_loja
end

Entao('validar se os resultados foram apresentados') do
  sleep(5) # sleep necessario para carregamento do modal
  expect(@page.div_veiculos.text).not_to be_empty
end
