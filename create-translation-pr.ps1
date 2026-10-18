# Create PR for populate_arabian_breed_name_ar.py -> engeshra/naasl
# Prerequisites: git, GitHub CLI (gh), and: gh auth login

$ErrorActionPreference = "Stop"
$RepoUrl = "https://github.com/engeshra/naasl.git"
$Branch = "feat/arabian-breed-name-ar-google"
$CloneDir = Join-Path $env:TEMP "naasl-pr-$(Get-Random)"
$SourceBackend = "D:\naasl\apps\naasl-backend"

Write-Host "Checking GitHub auth..." -ForegroundColor Cyan
gh auth status 2>&1 | Out-Null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Not logged in. Run: gh auth login" -ForegroundColor Red
    exit 1
}

Write-Host "Cloning $RepoUrl (shallow)..." -ForegroundColor Cyan
git clone --depth 1 --branch main $RepoUrl $CloneDir
Set-Location $CloneDir

git checkout -b $Branch

$DestScripts = Join-Path $CloneDir "apps\naasl-backend\scripts"
if (-not (Test-Path (Split-Path $DestScripts -Parent))) {
    New-Item -ItemType Directory -Force -Path (Split-Path $DestScripts -Parent) | Out-Null
}
if (-not (Test-Path $DestScripts)) {
    $RootScripts = Join-Path $CloneDir "scripts"
    if (Test-Path $RootScripts) {
        $DestScripts = $RootScripts
        Write-Host "Using repo root scripts/ folder" -ForegroundColor Yellow
    } else {
        New-Item -ItemType Directory -Force -Path $DestScripts | Out-Null
    }
}

# Main script + required helpers only (Google Translate workflow)
$ScriptFiles = @(
    "populate_arabian_breed_name_ar.py",
    "horse_name_arabic.py",
    "horse_name_translators.py",
    "README-populate-arabian-breed-name-ar.md",
    ".gitignore"
)

Write-Host "Copying scripts..." -ForegroundColor Cyan
foreach ($f in $ScriptFiles) {
    Copy-Item (Join-Path $SourceBackend "scripts\$f") (Join-Path $DestScripts $f) -Force
}

git add -A
git status

$CommitMsg = @"
Add populate_arabian_breed_name_ar.py for Google Translate name_ar.

Arabian-breed horses only, with cache/resume for long batch runs.
"@

git commit -m $CommitMsg

Write-Host "Pushing branch $Branch..." -ForegroundColor Cyan
git push -u origin $Branch

$PrBody = @"
## Summary
- Add ``populate_arabian_breed_name_ar.py`` to fill ``horses.name_ar`` for Arabian-related breeds via Google Translate
- Includes cache/resume (``horse_name_arabian_google_cache.json``) for long runs
- Helpers: ``horse_name_arabic.py``, ``horse_name_translators.py``

## Test plan
- [ ] ``python scripts/populate_arabian_breed_name_ar.py --preview 10``
- [ ] ``python scripts/populate_arabian_breed_name_ar.py --rewrite --only-new --limit 50``
- [ ] Confirm ``name_ar`` updated in DB for Arabian breed horses
"@

gh pr create --repo engeshra/naasl --base main --head $Branch `
  --title "Add Arabian breed name_ar script (Google Translate)" `
  --body $PrBody

Write-Host "Done. Clone dir: $CloneDir" -ForegroundColor Green
