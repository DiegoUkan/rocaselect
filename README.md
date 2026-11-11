# Roca Select

Briefing e protótipo navegável do **Roca Select**: o portal de saldos e benefícios das lojas Select
(Roca Cerámica e Incepa). Cada pedido faturado gera um saldo para a loja, válido por 12 meses, que
pode ser usado numa loja exclusiva de brindes, cursos, treinamentos, campanhas e experiências.

> Protótipo de apresentação. Os dados ficam salvos no navegador de cada pessoa.
> Lojas Di Bagno, Elevare Acabamentos, Loja Roca e Kinta aparecem em sites públicos como
> revendas Roca Select; categorias, pedidos e valores atribuídos a elas são fictícios.

## Abrir

- **No computador:** abra `Roca-Select-Briefing.html` no Chrome ou Edge. É um arquivo único,
  com as logos embutidas.
- **No servidor (CasaOS):** veja [`deploy/README.md`](deploy/README.md). O app
  [`deploy/casaos.yml`](deploy/casaos.yml) baixa o site deste repositório automaticamente.

## Estrutura

```
src/roca-select.html        código-fonte (HTML, CSS e JS num arquivo só)
assets/                     logos oficiais (Roca, Incepa, Grupo Lamosa)
tools/build.ps1             gera o arquivo final com as logos embutidas
Roca-Select-Briefing.html   arquivo final, para abrir ou enviar
deploy/                     servidor Docker (nginx) para o CasaOS
docs/                       decisões de alinhamento do projeto
```

## Alterar e publicar

1. Edite `src/roca-select.html`.
2. No PowerShell, na pasta do projeto: `.\tools\build.ps1`
   (atualiza `Roca-Select-Briefing.html` e `deploy/site/index.html`).
3. Faça commit e push. No CasaOS, reinicie o app Roca Select para baixar a versão nova.
