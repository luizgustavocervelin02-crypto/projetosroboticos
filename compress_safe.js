const sharp = require('sharp');
const fs = require('fs');
const path = require('path');

const imagesDir = path.join(__dirname, 'assets', 'images');
const htmlPath = path.join(__dirname, 'index.html');

async function optimizeImages() {
    const files = fs.readdirSync(imagesDir);
    let htmlContent = fs.readFileSync(htmlPath, 'utf8');

    for (const file of files) {
        if ((file.startsWith('proj') || file.startsWith('testimonial')) && (file.endsWith('.png') || file.endsWith('.jpg'))) {
            const ext = path.extname(file);
            const name = path.basename(file, ext);
            const inPath = path.join(imagesDir, file);
            const outPath = path.join(imagesDir, `${name}.webp`);

            console.log(`Optimizing ${file}...`);

            try {
                await sharp(inPath)
                    .resize({ width: 1000, withoutEnlargement: true })
                    .webp({ quality: 85 })
                    .toFile(outPath);

                const regex = new RegExp(`src="assets/images/${file}"`, 'g');
                htmlContent = htmlContent.replace(regex, `src="assets/images/${name}.webp"`);

            } catch (err) {
                console.error(`Failed on ${file}:`, err);
            }
        }
    }

    fs.writeFileSync(htmlPath, htmlContent, 'utf8');
    console.log('Safe project images converted to webp.');
}

optimizeImages();
