// Переключение языков
const toggleBtn = document.getElementById('toggle-lang');
const textRu = document.getElementById('text-ru');
const textEng = document.getElementById('text-eng');

toggleBtn.addEventListener('click', () => {
  if (textRu.style.display === "none") {
    textRu.style.display = "block";
    textEng.style.display = "none";
    toggleBtn.textContent = "ENG";
  } else {
    textRu.style.display = "none";
    textEng.style.display = "block";
    toggleBtn.textContent = "RU";
  }
});

// Галерея - динамическая генерация 50 изображений
const galleryGrid = document.getElementById('gallery-grid');
for (let i = 1; i <= 50; i++) {
  const img = document.createElement('img');
  let num = i.toString().padStart(2, '0');
  img.src = `img/thumb${num}.jpg`;
  img.alt = `Digital Imprint ${num}`;
  img.classList.add('gallery-item');
  galleryGrid.appendChild(img);
}
