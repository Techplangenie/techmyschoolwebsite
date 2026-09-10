#!/usr/bin/env bash
# Downloads the 32 photos that still live on the WordPress site into assets/.
# MUST be run while the old WordPress site is still online (before the DNS switch).
# Usage, from the repo root:   bash scripts/fetch-assets.sh
set -euo pipefail
mkdir -p assets assets/team
fail=0

if [ -s "assets/hero-community.jpg" ]; then echo "skip assets/hero-community.jpg"; else
  curl -fsSL --retry 3 -o "assets/hero-community.jpg" "https://techmyschool.org/wp-content/uploads/2024/11/d047b9_2a275c058ee949e6a1d5337b774c464cmv2.jpg" && echo "ok   assets/hero-community.jpg" || { echo "FAIL assets/hero-community.jpg"; fail=1; }
fi
if [ -s "assets/itp-presentation.jpg" ]; then echo "skip assets/itp-presentation.jpg"; else
  curl -fsSL --retry 3 -o "assets/itp-presentation.jpg" "https://techmyschool.org/wp-content/uploads/2024/11/IMG_9897-1.jpg" && echo "ok   assets/itp-presentation.jpg" || { echo "FAIL assets/itp-presentation.jpg"; fail=1; }
fi
if [ -s "assets/students-classroom.jpg" ]; then echo "skip assets/students-classroom.jpg"; else
  curl -fsSL --retry 3 -o "assets/students-classroom.jpg" "https://techmyschool.org/wp-content/uploads/2024/11/IMG_4541.jpg" && echo "ok   assets/students-classroom.jpg" || { echo "FAIL assets/students-classroom.jpg"; fail=1; }
fi
if [ -s "assets/team-donors.jpg" ]; then echo "skip assets/team-donors.jpg"; else
  curl -fsSL --retry 3 -o "assets/team-donors.jpg" "https://techmyschool.org/wp-content/uploads/2024/11/3-2-23-Fogo-De-Chao-2-1-1.jpg" && echo "ok   assets/team-donors.jpg" || { echo "FAIL assets/team-donors.jpg"; fail=1; }
fi
if [ -s "assets/teacher-training.jpg" ]; then echo "skip assets/teacher-training.jpg"; else
  curl -fsSL --retry 3 -o "assets/teacher-training.jpg" "https://techmyschool.org/wp-content/uploads/2024/11/IMG_4035_JPG.jpg" && echo "ok   assets/teacher-training.jpg" || { echo "FAIL assets/teacher-training.jpg"; fail=1; }
fi
if [ -s "assets/educator-work.jpg" ]; then echo "skip assets/educator-work.jpg"; else
  curl -fsSL --retry 3 -o "assets/educator-work.jpg" "https://techmyschool.org/wp-content/uploads/2024/11/yeidy.jpeg" && echo "ok   assets/educator-work.jpg" || { echo "FAIL assets/educator-work.jpg"; fail=1; }
fi
if [ -s "assets/esports.jpg" ]; then echo "skip assets/esports.jpg"; else
  curl -fsSL --retry 3 -o "assets/esports.jpg" "https://techmyschool.org/wp-content/uploads/2024/12/IMG_5833.jpg" && echo "ok   assets/esports.jpg" || { echo "FAIL assets/esports.jpg"; fail=1; }
fi
if [ -s "assets/conference-2026.jpg" ]; then echo "skip assets/conference-2026.jpg"; else
  curl -fsSL --retry 3 -o "assets/conference-2026.jpg" "https://techmyschool.org/wp-content/uploads/2025/03/2025-03-15-846.jpg" && echo "ok   assets/conference-2026.jpg" || { echo "FAIL assets/conference-2026.jpg"; fail=1; }
fi
if [ -s "assets/testi-carol.jpeg" ]; then echo "skip assets/testi-carol.jpeg"; else
  curl -fsSL --retry 3 -o "assets/testi-carol.jpeg" "https://techmyschool.org/wp-content/uploads/2024/11/WhatsApp-Image-2023-04-19-at-10_23_29-PM.jpeg" && echo "ok   assets/testi-carol.jpeg" || { echo "FAIL assets/testi-carol.jpeg"; fail=1; }
fi
if [ -s "assets/testi-vanessa.png" ]; then echo "skip assets/testi-vanessa.png"; else
  curl -fsSL --retry 3 -o "assets/testi-vanessa.png" "https://techmyschool.org/wp-content/uploads/2024/11/IMG_4064_HEIC.png" && echo "ok   assets/testi-vanessa.png" || { echo "FAIL assets/testi-vanessa.png"; fail=1; }
fi
if [ -s "assets/testi-keller.png" ]; then echo "skip assets/testi-keller.png"; else
  curl -fsSL --retry 3 -o "assets/testi-keller.png" "https://techmyschool.org/wp-content/uploads/2024/11/Screenshot-2024-08-21-at-9_58_08%E2%80%AFAM.png" && echo "ok   assets/testi-keller.png" || { echo "FAIL assets/testi-keller.png"; fail=1; }
fi
if [ -s "assets/team/robert-cobbs.webp" ]; then echo "skip assets/team/robert-cobbs.webp"; else
  curl -fsSL --retry 3 -o "assets/team/robert-cobbs.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Robert-Cobbs.webp" && echo "ok   assets/team/robert-cobbs.webp" || { echo "FAIL assets/team/robert-cobbs.webp"; fail=1; }
fi
if [ -s "assets/team/calen-kinnaly.webp" ]; then echo "skip assets/team/calen-kinnaly.webp"; else
  curl -fsSL --retry 3 -o "assets/team/calen-kinnaly.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Calen-Kinnaly.webp" && echo "ok   assets/team/calen-kinnaly.webp" || { echo "FAIL assets/team/calen-kinnaly.webp"; fail=1; }
fi
if [ -s "assets/team/earl-chamberlin.webp" ]; then echo "skip assets/team/earl-chamberlin.webp"; else
  curl -fsSL --retry 3 -o "assets/team/earl-chamberlin.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Earl-Chamberlin.webp" && echo "ok   assets/team/earl-chamberlin.webp" || { echo "FAIL assets/team/earl-chamberlin.webp"; fail=1; }
fi
if [ -s "assets/team/irina-cobbs.webp" ]; then echo "skip assets/team/irina-cobbs.webp"; else
  curl -fsSL --retry 3 -o "assets/team/irina-cobbs.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Irina-Cobbs.webp" && echo "ok   assets/team/irina-cobbs.webp" || { echo "FAIL assets/team/irina-cobbs.webp"; fail=1; }
fi
if [ -s "assets/team/chukwudi-asobo.webp" ]; then echo "skip assets/team/chukwudi-asobo.webp"; else
  curl -fsSL --retry 3 -o "assets/team/chukwudi-asobo.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Chukwudi-Asobo.webp" && echo "ok   assets/team/chukwudi-asobo.webp" || { echo "FAIL assets/team/chukwudi-asobo.webp"; fail=1; }
fi
if [ -s "assets/team/carlos-jimenez.png" ]; then echo "skip assets/team/carlos-jimenez.png"; else
  curl -fsSL --retry 3 -o "assets/team/carlos-jimenez.png" "https://techmyschool.org/wp-content/uploads/2024/11/PXL_20260405_233608878.PORTRAIT2.jpg-Carlos-E.-Jimenez-Cordero.png" && echo "ok   assets/team/carlos-jimenez.png" || { echo "FAIL assets/team/carlos-jimenez.png"; fail=1; }
fi
if [ -s "assets/team/natalia-morales.png" ]; then echo "skip assets/team/natalia-morales.png"; else
  curl -fsSL --retry 3 -o "assets/team/natalia-morales.png" "https://techmyschool.org/wp-content/uploads/2024/11/Screenshot_2026-07-13_at_9.13.56_PM-removebg-preview.png" && echo "ok   assets/team/natalia-morales.png" || { echo "FAIL assets/team/natalia-morales.png"; fail=1; }
fi
if [ -s "assets/team/ivonne-rosa.png" ]; then echo "skip assets/team/ivonne-rosa.png"; else
  curl -fsSL --retry 3 -o "assets/team/ivonne-rosa.png" "https://techmyschool.org/wp-content/uploads/2026/01/Ivonne-removebg-preview-e1768360113295.png" && echo "ok   assets/team/ivonne-rosa.png" || { echo "FAIL assets/team/ivonne-rosa.png"; fail=1; }
fi
if [ -s "assets/team/macarana-alvornoz.png" ]; then echo "skip assets/team/macarana-alvornoz.png"; else
  curl -fsSL --retry 3 -o "assets/team/macarana-alvornoz.png" "https://techmyschool.org/wp-content/uploads/2026/04/Professional_headshot_with_soft_lighting-removebg-preview.png" && echo "ok   assets/team/macarana-alvornoz.png" || { echo "FAIL assets/team/macarana-alvornoz.png"; fail=1; }
fi
if [ -s "assets/team/mariana-bermudez.png" ]; then echo "skip assets/team/mariana-bermudez.png"; else
  curl -fsSL --retry 3 -o "assets/team/mariana-bermudez.png" "https://techmyschool.org/wp-content/uploads/2024/11/A030D253-9932-4C60-ADE7-8835A38800BB_-_Mariana_Bermudez_Nieves-removebg-preview.png" && echo "ok   assets/team/mariana-bermudez.png" || { echo "FAIL assets/team/mariana-bermudez.png"; fail=1; }
fi
if [ -s "assets/team/ariana-colon.png" ]; then echo "skip assets/team/ariana-colon.png"; else
  curl -fsSL --retry 3 -o "assets/team/ariana-colon.png" "https://techmyschool.org/wp-content/uploads/2025/10/IMG_4277_-_Ariana_Colon-removebg-preview-e1760286669135.png" && echo "ok   assets/team/ariana-colon.png" || { echo "FAIL assets/team/ariana-colon.png"; fail=1; }
fi
if [ -s "assets/team/zaicha-torres.png" ]; then echo "skip assets/team/zaicha-torres.png"; else
  curl -fsSL --retry 3 -o "assets/team/zaicha-torres.png" "https://techmyschool.org/wp-content/uploads/2025/10/FB_IMG_1752755973053_-_Ms._Torres-removebg-preview.png" && echo "ok   assets/team/zaicha-torres.png" || { echo "FAIL assets/team/zaicha-torres.png"; fail=1; }
fi
if [ -s "assets/team/yahaira-murphy.png" ]; then echo "skip assets/team/yahaira-murphy.png"; else
  curl -fsSL --retry 3 -o "assets/team/yahaira-murphy.png" "https://techmyschool.org/wp-content/uploads/2025/10/20250916_133119_-_Yahaira_Murphy-removebg-preview-e1760287586869.png" && echo "ok   assets/team/yahaira-murphy.png" || { echo "FAIL assets/team/yahaira-murphy.png"; fail=1; }
fi
if [ -s "assets/team/norma-munoz.png" ]; then echo "skip assets/team/norma-munoz.png"; else
  curl -fsSL --retry 3 -o "assets/team/norma-munoz.png" "https://techmyschool.org/wp-content/uploads/2025/10/perfil_2_-_Maestra_Munoz-removebg-preview.png" && echo "ok   assets/team/norma-munoz.png" || { echo "FAIL assets/team/norma-munoz.png"; fail=1; }
fi
if [ -s "assets/team/jose-alicea.png" ]; then echo "skip assets/team/jose-alicea.png"; else
  curl -fsSL --retry 3 -o "assets/team/jose-alicea.png" "https://techmyschool.org/wp-content/uploads/2025/10/Screenshot_2025-09-19_at_1.54.36_PM_-_Robert_Cobbs-removebg-preview.png" && echo "ok   assets/team/jose-alicea.png" || { echo "FAIL assets/team/jose-alicea.png"; fail=1; }
fi
if [ -s "assets/team/marina-osorio.webp" ]; then echo "skip assets/team/marina-osorio.webp"; else
  curl -fsSL --retry 3 -o "assets/team/marina-osorio.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Jordany-Lopez.webp" && echo "ok   assets/team/marina-osorio.webp" || { echo "FAIL assets/team/marina-osorio.webp"; fail=1; }
fi
if [ -s "assets/team/kathleen-mcglone.png" ]; then echo "skip assets/team/kathleen-mcglone.png"; else
  curl -fsSL --retry 3 -o "assets/team/kathleen-mcglone.png" "https://techmyschool.org/wp-content/uploads/2026/04/Screenshot_20260202_172220_Gallery_-_KATHLEEN_MCGLONE-removebg-preview.png" && echo "ok   assets/team/kathleen-mcglone.png" || { echo "FAIL assets/team/kathleen-mcglone.png"; fail=1; }
fi
if [ -s "assets/team/aaron-rosenblum.webp" ]; then echo "skip assets/team/aaron-rosenblum.webp"; else
  curl -fsSL --retry 3 -o "assets/team/aaron-rosenblum.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Aaron-Rosenblum.webp" && echo "ok   assets/team/aaron-rosenblum.webp" || { echo "FAIL assets/team/aaron-rosenblum.webp"; fail=1; }
fi
if [ -s "assets/team/mehdi-amani.webp" ]; then echo "skip assets/team/mehdi-amani.webp"; else
  curl -fsSL --retry 3 -o "assets/team/mehdi-amani.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Mehdi-Amani.webp" && echo "ok   assets/team/mehdi-amani.webp" || { echo "FAIL assets/team/mehdi-amani.webp"; fail=1; }
fi
if [ -s "assets/team/kyle-sumrow.webp" ]; then echo "skip assets/team/kyle-sumrow.webp"; else
  curl -fsSL --retry 3 -o "assets/team/kyle-sumrow.webp" "https://techmyschool.org/wp-content/uploads/2024/11/Kyle-Sumrow.webp" && echo "ok   assets/team/kyle-sumrow.webp" || { echo "FAIL assets/team/kyle-sumrow.webp"; fail=1; }
fi
if [ -s "assets/team/armanie-cordero.png" ]; then echo "skip assets/team/armanie-cordero.png"; else
  curl -fsSL --retry 3 -o "assets/team/armanie-cordero.png" "https://techmyschool.org/wp-content/uploads/2025/10/PHOTO-2025-06-09-08-09-37_-_Armanie_Cordero-removebg-preview.png" && echo "ok   assets/team/armanie-cordero.png" || { echo "FAIL assets/team/armanie-cordero.png"; fail=1; }
fi

if [ "$fail" -ne 0 ]; then
  echo; echo "Some downloads failed. Do NOT switch the domain yet — re-run this script."; exit 1
fi
echo; echo "All 32 images downloaded. Safe to commit and push."
