param([string]$file)

$content = Get-Content $file -Raw

# Map specific variable names based on file
if ($file -like "*contact.html") {
    $content = $content -replace 'var\(--light-blue\)', 'var(--primary)'
    $content = $content -replace 'var\(--very-light-blue\)', 'var(--primary-light)'
    $content = $content -replace 'var\(--dark-blue\)', 'var(--text-primary)'
    $content = $content -replace 'var\(--deep-blue\)', 'var(--text-primary)'
    $content = $content -replace 'var\(--body-text\)', 'var(--text-primary)'
    $content = $content -replace 'var\(--muted-text\)', 'var(--text-secondary)'
} elseif ($file -like "*our-doctor.html") {
    $content = $content -replace 'var\(--light-blue\)', 'var(--primary-light)'
    $content = $content -replace 'var\(--accent\)', 'var(--primary)'
    $content = $content -replace 'var\(--dark\)', 'var(--text-primary)'
    $content = $content -replace 'var\(--text\)', 'var(--text-primary)'
} elseif ($file -like "*services.html") {
    $content = $content -replace 'var\(--light-blue\)', 'var(--primary)'
    $content = $content -replace 'var\(--dark-blue\)', 'var(--text-primary)'
    $content = $content -replace 'var\(--soft-blue\)', 'var(--primary-light)'
    $content = $content -replace 'var\(--body-text\)', 'var(--text-primary)'
    $content = $content -replace 'var\(--muted\)', 'var(--text-secondary)'
}

# Replace hex colors too
$content = $content -replace 'rgba\(91, 190, 247,', 'rgba(47, 128, 237,'
$content = $content -replace '5bbef7', '2F80ED'
$content = $content -replace '5BBEF7', '2F80ED'
$content = $content -replace '1b4f8c', '1F2937'
$content = $content -replace '1B4F8C', '1F2937'
$content = $content -replace 'F4FBFF', 'EAF6FF'
$content = $content -replace '2C3E50', '1F2937'
$content = $content -replace '2c3e50', '1F2937'

Set-Content $file $content
Write-Host "Updated $file with proper variable mappings"
