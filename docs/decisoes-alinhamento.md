# Roca Select — decisões de alinhamento

Registro da conversa de alinhamento (11/11/2026) antes do protótipo.

## Programa
- Nome do sistema: **Roca Select**. Mostra as duas marcas: **Roca Cerámica e Incepa** (Roca Brasil Cerámica / Grupo Lamosa).
- É o mesmo programa das lojas Roca Select, classificadas em **Gold, Black e Black Signature**.
- Percentual de saldo por categoria (ajustável no painel): Gold 1,5% · Black 2% · Black Signature 3%.
- Cada cliente = 1 CNPJ, com **1 acesso** só.
- Dados de exemplo: clientes reais apenas se encontrados publicamente na internet; valores sempre fictícios.

## Regra do saldo
- Percentual incide sobre o **pedido inteiro**.
- Pedido entra → saldo aparece como **"a liberar"**; vira **disponível no faturamento**; cancelamento/devolução estorna.
- Validade de **12 meses a partir da data de faturamento**.
- Consumo sempre do **lote mais antigo** (FIFO / o que vence primeiro).
- Alertas de vencimento em **90 / 60 / 30 dias**.
- Saldo perdido (vencido): fica para uma fase futura.

## Loja
- Catálogo **totalmente cadastrável** pela equipe interna. Categorias iniciais: brindes, cursos, treinamentos, campanhas, material de PDV/expositores, ambientação de showroom, eventos com arquitetos, renders/fotos, amostras, viagens/experiências.
- Item mais caro que o saldo: cliente pode pôr na **lista de interesse** ou **pagar a diferença**.
- Item de valor fixo com saldo suficiente: **aprovação direta**. Mas cada item tem a opção de exigir aprovação manual (particularidades).
- Saldo pode ser usado **para terceiros** (ex.: viagem de presente para um arquiteto).
- Itens sem preço (ex.: campanha) → **solicitar orçamento** com briefing.

## Orçamentos e área interna
- Fluxo: cliente solicita → Comercial triagem → Trade Marketing precifica → cliente aceita → saldo debitado → execução → concluído.
- Perfis internos (7): **Representante** (só a carteira dele), **Comercial**, **Trade Marketing**, **Supervisor**, **Gerente Regional**, **Gerente Geral** — cada um com seus acessos. Só o Gerente Geral configura percentuais, validade e alçadas.
- Pessoas no protótipo: Supervisor **Charles**; Gerente Regional **Ricardo Neves**; Gerente Geral **Juliano Sthuart**; Trade Marketing **Sandra**. (Representantes e Comercial seguem fictícios.)
- **Ajuste manual de saldo**: só lançado por quem é da empresa, com justificativa e **aprovação por alçada**:
  até R$ 5.000 → Supervisor ou acima · até R$ 20.000 → Gerente Regional ou acima · acima disso → só o Gerente Geral. Quem solicita não aprova. Valores configuráveis.

## Entregável da etapa 1
- Um HTML único: **briefing** (contexto, regras, fluxos) + **protótipo navegável** com troca de perfil e dados salvos no navegador.
- Visual premium: preto + dourado champanhe; logos oficiais do site.
- Objetivo: algo rápido para mostrar potencial e conquistar a aprovação.

## Hospedagem
- Servidor Docker (nginx estático) no CasaOS do usuário, porta 8090 por padrão — ver `deploy/README.md`.
- Endereço futuro: **rocaselect.diegoukan.com** (proxy reverso com HTTPS). Recomendado proteger com senha.
- Os dados da demonstração ficam no navegador de cada visitante (sem banco compartilhado nesta etapa).

## Etapa 2 (depois)
- PDF com estimativa de horas/meses para o usuário desenvolver sozinho, ~2 h/dia após o expediente.
