# language:pt

@api
@consultar_modelos
Funcionalidade: API | Validar o endpoint a partir de consulta de modelos veículos
  Como uma aplicação da Webmotors
  Quero chamar o endpoint da consulta de modelos de veículos
  Para validar o retorno da chamada com a lista de modelos disponíveis

  Esquema do Cenário: Validar o endpoint OnlineChallenge_model.get
    Dado ter uma massa configurada a partir dos modelos disponíveis do endpoint api_OnlineChallenge_model.get para o cenário "<tipo>"
    Quando chamar o endpoint api_OnlineChallenge_model.get
    Então validar o retorno do endpoint api_OnlineChallenge_model.get de cada modelo de cada marca chamada para o cenário "<tipo>"

    Exemplos:
      | tipo     |
      | positivo |
      | negativo |
