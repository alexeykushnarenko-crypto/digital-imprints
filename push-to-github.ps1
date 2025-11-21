# --- Digital Imprints Auto Push Script ---
# Auto-convert PNG to JPG, commit and push

Set-Location "C:\Users\USER\Pictures\digital-imprints"

Write-Host ""
Write-Host "=== DIGITAL IMPRINTS AUTO-PUSH ==="
Write-Host ""

# --- 1. PNG → JPG ---
Write-Host "Checking for .png files..."

$pngFiles = Get-ChildItem ".\img" -Filter *.png -File

if ($pngFiles.Count -gt 0) {
    foreach ($file in $pngFiles) {
        $newName = [System.IO.Path]::ChangeExtension($file.FullName, ".jpg")
        Write-Host ("Converting: {0} -> {1}" -f $file.Name, (Split-Path $newName -Leaf))
        Rename-Item -Path $file.FullName -NewName $newName -Force
    }
    Write-Host "PNG successfully converted to JPG."
} else {
    Write-Host "No PNG files found."
}

Write-Host ""

# --- 2. Add changes ---
git add .

# --- 3. Check if there are changes ---
$changes = git status --porcelain

if ([string]::IsNullOrWhiteSpace($changes)) {
    Write-Host "No changes to commit."
    exit
}

Write-Host "Detected changes:"
Write-Host $changes
Write-Host ""

# --- 4. Commit message ---
$defaultMessage = "Auto-update: images + gallery sync"

$commitMessage = Read-Host "Enter commit message (press Enter for default)"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = $defaultMessage
}

# --- 5. Commit ---
git commit -m "$commitMessage"

# --- 6. Push ---
Write-Host ""
Write-Host "Pushing to GitHub..."
git push -u origin main

Write-Host ""
Write-Host "Done! All changes pushed."
Write-Host "===================================="
