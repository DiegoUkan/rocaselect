# Gera o arquivo final (autocontido) a partir de src/roca-select.html,
# embutindo as logos de assets/ como data URI.
# Saídas:
#   Roca-Select-Briefing.html   -> para abrir direto no navegador / enviar por e-mail
#   deploy/site/index.html      -> o mesmo arquivo, pronto para o servidor Docker
$root = Split-Path -Parent $PSScriptRoot
$src = [IO.File]::ReadAllText((Join-Path $root 'src\roca-select.html'), [Text.Encoding]::UTF8)
function B64($p) { 'data:image/png;base64,' + [Convert]::ToBase64String([IO.File]::ReadAllBytes((Join-Path $root $p))) }
$out = $src.Replace('%%LOGO_ROCA%%', (B64 'assets\logo-roca.png')).Replace('%%LOGO_INCEPA%%', (B64 'assets\logo-incepa-640.png')).Replace('%%LOGO_LAMOSA%%', (B64 'assets\logo-lamosa.png'))
$utf8 = New-Object Text.UTF8Encoding $false
$dest = Join-Path $root 'Roca-Select-Briefing.html'
[IO.File]::WriteAllText($dest, $out, $utf8)
$siteDir = Join-Path $root 'deploy\site'
New-Item -ItemType Directory -Force $siteDir | Out-Null
[IO.File]::WriteAllText((Join-Path $siteDir 'index.html'), $out, $utf8)
"OK -> $dest ($([math]::Round((Get-Item $dest).Length/1KB)) KB)"
"OK -> $(Join-Path $siteDir 'index.html')"
