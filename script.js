const imgFolder = 'img/';
const totalImages = 50;
const gallery = document.getElementById('gallery');

for (let i = 1; i <= totalImages; i++) {
    const num = i.toString().padStart(2, '0');
    const imgSrc = `${imgFolder}thumb${num}.jpg`;

    const figure = document.createElement('figure');
    figure.className = 'gallery-item';

    const img = document.createElement('img');
    img.src = imgSrc;
    img.alt = `Digital Imprint ${num}`;

    const caption = document.createElement('figcaption');
    caption.textContent = num;

    figure.appendChild(img);
    figure.appendChild(caption);
    gallery.appendChild(figure);
}
