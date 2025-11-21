# Скрипт для автоматической отправки изменений на GitHub

# Перейти в папку проекта
Set-Location "C:\Users\USER\Pictures\digital-imprints"

# Добавляем все изменения
git add .

# Просим пользователя ввести комментарий коммита
$commitMessage = Read-Host "Введите сообщение коммита"

# Если сообщение пустое, используем стандартное
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    $commitMessage = "Update Digital Imprints collection"
}

# Делаем коммит
git commit -m "$commitMessage"

# Пушим на GitHub
git push -u origin main
