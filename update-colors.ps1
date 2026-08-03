param([string]$file)

$content = Get-Content $file -Raw
$content = $content -replace 'var\(--light-blue\)', 'var(--primary)'
$content = $content -replace 'var\(--very-light-blue\)', 'var(--primary-light)'
$content = $content -replace 'var\(--body-text\)', 'var(--text-primary)'
$content = $content -replace 'rgba\(91, 190, 247,', 'rgba(47, 128, 237,'
Set-Content $file $content
Write-Host "Updated $file"
