// Downloads the photo assets from the live WordPress site into assets/.
// (The logos are already bundled in assets/ — this only fetches photos.)
// Run once from the repo root:  node scripts/fetch-assets.mjs
// Then commit the assets/ folder. After that, the site no longer depends on WordPress.
import { mkdirSync, existsSync, writeFileSync } from "node:fs";
import { get } from "node:https";

const MAP = {
  "https://techmyschool.org/wp-content/uploads/2024/11/d047b9_2a275c058ee949e6a1d5337b774c464cmv2.jpg": "assets/hero-community.jpg",
  "https://techmyschool.org/wp-content/uploads/2024/11/IMG_9897-1.jpg": "assets/itp-presentation.jpg",
  "https://techmyschool.org/wp-content/uploads/2024/11/IMG_4541.jpg": "assets/students-classroom.jpg",
  "https://techmyschool.org/wp-content/uploads/2024/11/3-2-23-Fogo-De-Chao-2-1-1.jpg": "assets/team-donors.jpg",
  "https://techmyschool.org/wp-content/uploads/2024/11/IMG_4035_JPG.jpg": "assets/teacher-training.jpg",
  "https://techmyschool.org/wp-content/uploads/2024/11/yeidy.jpeg": "assets/educator-work.jpg",
  "https://techmyschool.org/wp-content/uploads/2024/12/IMG_5833.jpg": "assets/esports.jpg",
  "https://techmyschool.org/wp-content/uploads/2025/03/2025-03-15-846.jpg": "assets/conference-2026.jpg",
  // Testimonial photos (from the old homepage)
  "https://techmyschool.org/wp-content/uploads/2024/11/WhatsApp-Image-2023-04-19-at-10_23_29-PM.jpeg": "assets/testi-carol.jpeg",
  "https://techmyschool.org/wp-content/uploads/2024/11/IMG_4064_HEIC.png": "assets/testi-vanessa.png",
  "https://techmyschool.org/wp-content/uploads/2024/11/Screenshot-2024-08-21-at-9_58_08%E2%80%AFAM.png": "assets/testi-keller.png",
  // Team headshots (from the old /our-team/ page)
  "https://techmyschool.org/wp-content/uploads/2024/11/Robert-Cobbs.webp": "assets/team/robert-cobbs.webp",
  "https://techmyschool.org/wp-content/uploads/2024/11/Calen-Kinnaly.webp": "assets/team/calen-kinnaly.webp",
  "https://techmyschool.org/wp-content/uploads/2024/11/Earl-Chamberlin.webp": "assets/team/earl-chamberlin.webp",
  "https://techmyschool.org/wp-content/uploads/2024/11/Irina-Cobbs.webp": "assets/team/irina-cobbs.webp",
  "https://techmyschool.org/wp-content/uploads/2024/11/Chukwudi-Asobo.webp": "assets/team/chukwudi-asobo.webp",
  "https://techmyschool.org/wp-content/uploads/2024/11/PXL_20260405_233608878.PORTRAIT2.jpg-Carlos-E.-Jimenez-Cordero.png": "assets/team/carlos-jimenez.png",
  "https://techmyschool.org/wp-content/uploads/2024/11/Screenshot_2026-07-13_at_9.13.56_PM-removebg-preview.png": "assets/team/natalia-morales.png",
  "https://techmyschool.org/wp-content/uploads/2026/01/Ivonne-removebg-preview-e1768360113295.png": "assets/team/ivonne-rosa.png",
  "https://techmyschool.org/wp-content/uploads/2026/04/Professional_headshot_with_soft_lighting-removebg-preview.png": "assets/team/macarana-alvornoz.png",
  "https://techmyschool.org/wp-content/uploads/2024/11/A030D253-9932-4C60-ADE7-8835A38800BB_-_Mariana_Bermudez_Nieves-removebg-preview.png": "assets/team/mariana-bermudez.png",
  "https://techmyschool.org/wp-content/uploads/2025/10/IMG_4277_-_Ariana_Colon-removebg-preview-e1760286669135.png": "assets/team/ariana-colon.png",
  "https://techmyschool.org/wp-content/uploads/2025/10/FB_IMG_1752755973053_-_Ms._Torres-removebg-preview.png": "assets/team/zaicha-torres.png",
  "https://techmyschool.org/wp-content/uploads/2025/10/20250916_133119_-_Yahaira_Murphy-removebg-preview-e1760287586869.png": "assets/team/yahaira-murphy.png",
  "https://techmyschool.org/wp-content/uploads/2025/10/perfil_2_-_Maestra_Munoz-removebg-preview.png": "assets/team/norma-munoz.png",
  "https://techmyschool.org/wp-content/uploads/2025/10/Screenshot_2025-09-19_at_1.54.36_PM_-_Robert_Cobbs-removebg-preview.png": "assets/team/jose-alicea.png",
  "https://techmyschool.org/wp-content/uploads/2024/11/Jordany-Lopez.webp": "assets/team/marina-osorio.webp",
  "https://techmyschool.org/wp-content/uploads/2026/04/Screenshot_20260202_172220_Gallery_-_KATHLEEN_MCGLONE-removebg-preview.png": "assets/team/kathleen-mcglone.png",
  "https://techmyschool.org/wp-content/uploads/2024/11/Aaron-Rosenblum.webp": "assets/team/aaron-rosenblum.webp",
  "https://techmyschool.org/wp-content/uploads/2024/11/Mehdi-Amani.webp": "assets/team/mehdi-amani.webp",
  "https://techmyschool.org/wp-content/uploads/2024/11/Kyle-Sumrow.webp": "assets/team/kyle-sumrow.webp",
  "https://techmyschool.org/wp-content/uploads/2025/10/PHOTO-2025-06-09-08-09-37_-_Armanie_Cordero-removebg-preview.png": "assets/team/armanie-cordero.png",
};

mkdirSync("assets", { recursive: true });
mkdirSync("assets/team", { recursive: true });

function fetchBuf(url, redirects = 0) {
  return new Promise((resolve, reject) => {
    if (redirects > 5) return reject(new Error("too many redirects: " + url));
    get(url, { headers: { "user-agent": "Mozilla/5.0 (TMS asset fetch)" } }, (res) => {
      if (res.statusCode >= 300 && res.statusCode < 400 && res.headers.location) {
        res.resume();
        return resolve(fetchBuf(new URL(res.headers.location, url).href, redirects + 1));
      }
      if (res.statusCode !== 200) {
        res.resume();
        return reject(new Error(`HTTP ${res.statusCode} for ${url}`));
      }
      const chunks = [];
      res.on("data", (c) => chunks.push(c));
      res.on("end", () => resolve(Buffer.concat(chunks)));
      res.on("error", reject);
    }).on("error", reject);
  });
}

let ok = 0, failed = 0;
for (const [url, path] of Object.entries(MAP)) {
  if (existsSync(path)) { console.log("skip (exists):", path); ok++; continue; }
  try {
    const buf = await fetchBuf(url);
    writeFileSync(path, buf);
    console.log(`ok: ${path} (${(buf.length / 1024).toFixed(0)} KB)`);
    ok++;
  } catch (e) {
    console.error(`FAILED: ${path} — ${e.message}`);
    failed++;
  }
}
console.log(`\nDone. ${ok} ok, ${failed} failed.`);
if (failed) process.exit(1);
