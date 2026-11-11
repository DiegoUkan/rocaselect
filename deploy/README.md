# Roca Select — servidor Docker (CasaOS)

Um container **nginx** pequeno (~20 MB) que serve o briefing e o protótipo em uma porta do servidor.
O site é estático: os dados da demonstração ficam salvos no navegador de cada pessoa.

```
deploy/
├── casaos.yml                Opção 1: CasaOS, baixa o site do GitHub (recomendada)
├── docker-compose.yml        Opção 2: CasaOS, com envio manual do index.html
├── docker-compose.build.yml  Opção 3: build com terminal/SSH
├── Dockerfile                usado pela Opção 3
├── nginx/default.conf        config do nginx (Opções 1 e 3)
└── site/index.html           o site (gerado por tools/build.ps1)
```

Sempre que mudar o protótipo, rode `tools/build.ps1` no PC: ele atualiza `site/index.html`.

---

## Opção 1 — CasaOS puxando do GitHub (recomendada)

1. No painel do CasaOS: **App Store → "+" (Custom Install)** → ícone de **Importar**
   no canto superior direito → cole o conteúdo de [`casaos.yml`](casaos.yml) → **Install**.
2. Abra `http://IP-DO-SERVIDOR:8090`.

O container baixa `deploy/site/index.html` deste repositório (branch `main`) a cada início.
**Para atualizar:** faça push no GitHub e reinicie o app no CasaOS. O GitHub pode levar
até 5 minutos para servir o arquivo novo. Se o GitHub estiver inacessível, o app continua
servindo a última cópia, que fica salva em `/DATA/AppData/rocaselect/site`.

## Opção 2 — CasaOS com envio manual

1. **Envie o site.** No app **Files** do CasaOS, crie a pasta
   `/DATA/AppData/rocaselect/site` e faça upload do arquivo `deploy/site/index.html`.
2. **Instale o app.** No painel do CasaOS: **App Store → "+" (Custom Install)** →
   ícone de **Importar** no canto superior direito → cole o conteúdo de
   `docker-compose.yml` → **Submit / Install**.
3. **Teste.** Abra `http://IP-DO-SERVIDOR:8090`.

**Porta ocupada?** Troque `8090` no `docker-compose.yml` (em `ports` e em `port_map`).

**Atualizar o site:** substitua o `index.html` na mesma pasta pelo app Files.
Não precisa reiniciar o container. Se o navegador mostrar a versão antiga, use Ctrl+F5.

## Opção 3 — com terminal (SSH)

Copie a pasta `deploy/` para o servidor (por exemplo, para `~/rocaselect`) e rode:

```bash
cd ~/rocaselect && docker compose -f docker-compose.build.yml up -d --build
```

Para atualizar, copie o novo `site/index.html` e rode o mesmo comando.
Esta opção também ativa compressão gzip, cabeçalho `noindex` e o endpoint `/healthz`.
Use **uma** das opções, não as duas: o nome do container é o mesmo.

---

## Domínio `rocaselect.diegoukan.com`

### Caminho A — Nginx Proxy Manager (está na App Store do CasaOS)

1. **DNS:** no painel do seu domínio, crie um registro **A** `rocaselect` apontando para o IP
   público da sua casa (ou um **CNAME** para o seu DDNS, se o IP muda).
2. **Roteador:** encaminhe as portas **80** e **443** para o servidor.
   > O painel do CasaOS usa a porta 80 por padrão. Mude a porta dele em
   > *Configurações* antes, ou o Nginx Proxy Manager não consegue usar a 80.
3. **Proxy Manager → Proxy Hosts → Add:**
   - Domain: `rocaselect.diegoukan.com`
   - Forward: `http` · IP do servidor · porta `8090`
   - Aba **SSL:** *Request a new certificate* (Let's Encrypt) + *Force SSL*

### Caminho B — Cloudflare Tunnel (se o domínio estiver na Cloudflare)

Não precisa abrir porta no roteador. Instale o **cloudflared** (também há na App Store do
CasaOS). No painel *Zero Trust → Networks → Tunnels*, crie um *Public Hostname*
`rocaselect.diegoukan.com` → `http://IP-DO-SERVIDOR:8090`. O HTTPS é automático.

### Recomendo colocar senha

A página usa as marcas Roca e Incepa e cita nomes de lojas reais com valores fictícios.
O HTML já pede para buscadores não indexarem (`noindex`), mas isso não impede o acesso.
Para restringir o acesso:

- **Nginx Proxy Manager:** *Access Lists* → crie usuário e senha → selecione a lista no Proxy Host.
- **Cloudflare:** *Zero Trust → Access → Applications* → libere só e-mails autorizados.
