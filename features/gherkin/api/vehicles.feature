# language:pt

@api
@consultar_veiculos
Funcionalidade: API | Validar o endpoint a partir de consulta de veículos
  Como uma aplicação da Webmotors
  Quero chamar o endpoint da consulta de veículos
  Para validar o retorno da chamada com a lista de veículos disponíveis

  Esquema do Cenário: Validar o endpoint OnlineChallenge_version.get
    Quando chamar o endpoint api_OnlineChallenge_vehicles.get para o cenário "<tipo>"
    Então validar o retorno do endpoint api_OnlineChallenge_vehicles.get de cada vehículo em cada página chamada para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
