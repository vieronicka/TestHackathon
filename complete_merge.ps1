# PowerShell script to complete Git merge
Set-Location "C:\Users\VieronickaKanesamoor\MasterTestHack\TestHackathon"

# Set Git editor to a simple echo command
$env:GIT_EDITOR = "echo"

# Complete the merge with default message
git commit --no-edit

# Check status
git status

# Push changes
git push origin main
