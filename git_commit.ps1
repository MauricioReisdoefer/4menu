param(
    [string]$msg = $(Read-Host "Digite a mensagem do commit")
)

git add .
git commit -m "$msg"
git push origin main
