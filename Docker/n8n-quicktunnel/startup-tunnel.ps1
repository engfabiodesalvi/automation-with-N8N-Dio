Write-Host "========================================="
Write-Host "  Iniciando Cloudflare Quick Tunnel"
Write-Host "========================================="

# Pasta do projeto (ajuste se necessário)
Set-Location "C:\Docker\n8n-quicktunnel"

# Inicia o tunnel em background e captura saída
$process = Start-Process cloudflared `
    -ArgumentList "tunnel --url http://localhost:5678" `
    -NoNewWindow `
    -RedirectStandardOutput tunnel.log `
    -RedirectStandardError tunnel.log `
    -PassThru

Write-Host "Aguardando geração da URL do tunnel..."
Start-Sleep -Seconds 5

# Lê o log e extrai a URL
$log = Get-Content "tunnel.log" -Raw

if ($log -match "https://([a-zA-Z0-9\-\.]+\.trycloudflare\.com)") {

    $host = $matches[1]
    Write-Host "Tunnel detectado: $host"

    # Atualiza o .env
    "N8N_HOST=$host" | Set-Content ".env"

    Write-Host "Arquivo .env atualizado."

    # Reinicia containers
    Write-Host "Reiniciando n8n..."
    docker compose down
    docker compose up -d

    Write-Host "n8n atualizado com nova URL."
    Write-Host "Acesse: https://$host"
}
else {
    Write-Host "ERRO: Não foi possível detectar a URL do tunnel."
    Write-Host "Verifique o arquivo tunnel.log"
}