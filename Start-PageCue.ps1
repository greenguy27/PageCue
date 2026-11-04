# Start-PageCue.ps1
# Runs PageCue at http://localhost:8765 so the browser allows the camera and microphone.
# Browsers block or keep re-asking for camera access on pages opened straight from a folder
# (file://). A localhost address counts as secure, so recording works and permission is remembered.
#
# Only this computer can reach it (it listens on 127.0.0.1). Nothing is uploaded anywhere.
# Keep the window open while you use PageCue; close it to stop.
# Works in Windows PowerShell 5.1 and PowerShell 7. No install, no admin rights.

$ErrorActionPreference = 'Stop'
$root = [System.IO.Path]::GetFullPath($PSScriptRoot)
if (-not $root.EndsWith([System.IO.Path]::DirectorySeparatorChar)) { $root += [System.IO.Path]::DirectorySeparatorChar }
$port = 8765
$url  = "http://localhost:$port/"

$listener = [System.Net.Sockets.TcpListener]::new([System.Net.IPAddress]::Loopback, $port)
try {
    $listener.Start()
} catch {
    Write-Host "Port $port is already in use. PageCue is probably already running; opening it."
    try { Start-Process $url } catch { Write-Host "Open $url in your browser." }
    exit 0
}

$types = @{
    '.html' = 'text/html; charset=utf-8'
    '.js'   = 'text/javascript; charset=utf-8'
    '.css'  = 'text/css; charset=utf-8'
    '.json' = 'application/json; charset=utf-8'
    '.md'   = 'text/markdown; charset=utf-8'
    '.txt'  = 'text/plain; charset=utf-8'
    '.svg'  = 'image/svg+xml'
    '.png'  = 'image/png'
    '.jpg'  = 'image/jpeg'
    '.ico'  = 'image/x-icon'
}

Write-Host ""
Write-Host "  PageCue is running at $url"
Write-Host "  Keep this window open while you use PageCue. Close it to stop."
Write-Host ""
try { Start-Process $url } catch { Write-Host "  Open $url in your browser." }

while ($true) {
    $client = $listener.AcceptTcpClient()
    try {
        $stream = $client.GetStream()
        $reader = [System.IO.StreamReader]::new($stream, [System.Text.Encoding]::ASCII, $false, 4096, $true)
        $requestLine = $reader.ReadLine()
        while ($true) { $h = $reader.ReadLine(); if ($null -eq $h -or $h -eq '') { break } }

        $method = 'GET'; $path = '/'
        if ($requestLine -match '^(GET|HEAD) (\S+)') {
            $method = $Matches[1]
            $path = [System.Uri]::UnescapeDataString(($Matches[2] -split '\?')[0])
        }
        if ($path -eq '/') { $path = '/index.html' }

        $file = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($root, $path.TrimStart('/').Replace('/', [System.IO.Path]::DirectorySeparatorChar)))
        if ($file.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase) -and [System.IO.File]::Exists($file)) {
            $body = [System.IO.File]::ReadAllBytes($file)
            $status = '200 OK'
            $type = $types[[System.IO.Path]::GetExtension($file).ToLower()]
            if (-not $type) { $type = 'application/octet-stream' }
        } else {
            $body = [System.Text.Encoding]::UTF8.GetBytes('Not found')
            $status = '404 Not Found'
            $type = 'text/plain; charset=utf-8'
        }

        $head = "HTTP/1.1 $status`r`nContent-Type: $type`r`nContent-Length: $($body.Length)`r`nCache-Control: no-store`r`nConnection: close`r`n`r`n"
        $headBytes = [System.Text.Encoding]::ASCII.GetBytes($head)
        $stream.Write($headBytes, 0, $headBytes.Length)
        if ($method -ne 'HEAD') { $stream.Write($body, 0, $body.Length) }
        $stream.Flush()
    } catch {
        # A dropped connection should never stop the server.
    } finally {
        $client.Close()
    }
}
