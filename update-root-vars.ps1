param([string]$file)

$oldRoot = @"
        :root {
            --white: #FFFFFF;
            --light-blue: #5BBEF7;
            --very-light-blue: #F4FBFF;
            --dark-blue: #1B4F8C;
            --body-text: #2C3E50;
        }
"@

$newRoot = @"
        :root {
            --white: #FFFFFF;
            --primary: #2F80ED;
            --primary-light: #EAF6FF;
            --text-primary: #1F2937;
            --text-secondary: #4B5563;
            --border: #D6EAF8;
            --surface: #F8FCFF;
            --shadow: rgba(31, 41, 55, 0.06);
        }
"@

$content = Get-Content $file -Raw
if ($content -match [regex]::Escape($oldRoot)) {
    $content = $content -replace [regex]::Escape($oldRoot), $newRoot
    Set-Content $file $content
    Write-Host "Updated root variables in $file"
} else {
    Write-Host "Root variables already updated in $file"
}
