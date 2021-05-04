# language:pt

@api
@consultar_versao_veiculos
Funcionalidade: API | Validar o endpoint a partir de consulta de versões veículos
  Como uma aplicação da Webmotors
  Quero chamar o endpoint da consulta de versões de veículos
  Para validar o retorno da chamada com a lista de versões disponíveis

  Esquema do Cenário: Validar o endpoint OnlineChallenge_version.get
    Dado ter uma massa configurada a partir dos modelos disponíveis do endpoint api_OnlineChallenge_version.get para o cenário "<tipo>"
    Quando chamar o endpoint api_OnlineChallenge_version.get para o cenário "<tipo>"
    Então validar o retorno do endpoint api_OnlineChallenge_version.get de cada versiono de cada marca chamada para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
