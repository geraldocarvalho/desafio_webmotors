# language:pt

@api
@consultar_marcas
Funcionalidade: API | Validar o endpoint a partir de consulta de marca de veículos
  Como uma aplicação da Webmotors
  Quero chamar o endpoint da consulta de marcas de veículos cadastrados
  Para validar o retorno da chamada com a lista de veículos disponíveis

  Cenário: Validar o endpoint OnlineChallenge_make.gets
    Quando chamar o endpoint api_OnlineChallenge_make.get
    Então validar o retorno do endpoint api_OnlineChallenge_make.get
