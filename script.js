document.addEventListener("DOMContentLoaded", () => {
    const gallery = document.querySelector(".gallery");
    const totalImages = 50;

    for (let i = 1; i <= totalImages; i++) {
        const num = String(i).padStart(2, "0");
        const imgPath = `img/thumb${num}.jpg`;

        const item = document.createElement("div");
        item.className = "gallery-item";

        const img = document.createElement("img");
        img.src = imgPath;
        img.alt = `Artwork ${num}`;
        img.onerror = () => {
            img.src = "img/placeholder.jpg";
        };

        item.appendChild(img);
        gallery.appendChild(item);
    }
});
