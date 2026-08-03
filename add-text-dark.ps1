@('public/awareness.html', 'public/contact.html', 'public/our-doctor.html', 'public/services.html') | ForEach-Object {
    $content = Get-Content $_ -Raw
    if ($content -notmatch '--text-dark') {
        $content = $content -replace '(--shadow:.*?\);)', "`$1`n            --text-dark: #0F172A;"
        Set-Content $_ $content
        Write-Host "Added --text-dark to $_"
    } else {
        Write-Host "--text-dark already present in $_"
    }
}
