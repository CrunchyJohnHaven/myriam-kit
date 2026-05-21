*תרגום לעברית — לגרסה המקורית באנגלית, ראו [QUICKSTART.md](QUICKSTART.md)*

# התחלה מהירה

חמש דקות מ-clone ועד פרסום חתום. נבדק על macOS; אמור לעבוד על Linux; משתמשי Windows יזדקקו ל-WSL.

## 0. דרישות מקדימות

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. הקמת שלד (Scaffold)

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. עריכת העובדות

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

כל קובץ הוא עובדה אחת. קידוד UTF-8. סופי שורות LF. תבנית שם הקובץ היא `NN_short_name.txt` כאשר NN הוא מספר בן שתי ספרות מרופד באפסים מובילים. הקבצים ממוינים לקסיקוגרפית לתוך עץ Merkle, כך ש-02 תמיד מגיע אחרי 01.

טיפ: נסחו כל עובדה כ*אירוע שיום או הצהרה*, ולא כטענה אונטולוגית על העולם. "חברת Acme Corp הצהירה כי אצווה X עברה את בדיקה Y" ניתן לאימות. "אצווה X בטוחה" אינו ניתן לאימות.

## 3. הפעלת ה-daemon של IPFS (פעם אחת לכל מחשב)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. חתימה

```bash
bash build/seal.sh

```

הפעולה הזו תבצע:
1. תקצור כל עובדה (SHA-256), ותחשב את שורש Merkle בסגנון Bitcoin.
2. תחתום את השורש בזמן באמצעות OpenTimestamps דרך שני יומנים בלתי תלויים
   (alice + finney כברירת מחדל — ניתן לעקוף באמצעות `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. תצמיד את תיקיית `site/` ל-IPFS ותדפיס את ה-CID.

סה"כ: כ-10 שניות עם daemon חם של IPFS.

## 5. עריכת `site/index.html`

החליפו את ה-placeholders של התבנית בעובדות, בתקצירים ובשורש Merkle האמיתיים שלכם. תקצירי ה-SHA-256 המוצגים לכל עובדה חייבים להתאים לקבצי העובדות עצמם, אחרת הדף ייכשל באימות העצמי שלו.

עבור כל עובדה, העתיקו את גוף קובץ ה-.txt לתוך בלוק `<div class="fact">` ושימו את ה-SHA-256 ב-`<div class="hash">` מתחתיו ישירות. שורש Merkle נכנס בקטע החותם הקריפטוגרפי.

(כן, ניתן ליצור את זה אוטומטית. הוא לא נוצר אוטומטית — בכוונה: הצעד הידני הוא צעד הסקירה האנושית. הפרוטוקול אינו מגן מפני פרסום משהו שלא קראתם.)

## 6. אימות מקומי

```bash
python3 build/verify.py
```

הפלט הצפוי:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

ה-"Pending" הוא תקין — יומן ה-OTS ישדרג את האישור לאישור Bitcoin מלא בתוך מספר שעות.

## 7. פריסה (Deploy)

בחרו אחת מהאפשרויות:

- **Cloudflare Pages**: לוח בקרה → Pages → Direct upload → גררו את `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` בתוך `site/`, דחפו למאגר, הפעילו Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (עם אירוח סטטי מופעל)
- **כל VPS פשוט**: `scp -r site/* user@host:/var/www/html/`

ה-CID של IPFS מצעד 4 נותן לכם כתובת URL נוספת מאוזכרת-לפי-תוכן: `https://<CID>.ipfs.dweb.link/`. השתמשו בה.

## 8. שדרוג קבלת ה-OTS (מאוחר יותר)

תוך מספר שעות מהחתימה, הריצו:

```bash
ots upgrade build/merkle_root.txt.ots
```

זה ממיר את האישור הממתין של כל יומן לאישור Bitcoin מלא שמפנה לבלוק ספציפי. פרסו מחדש את קובץ ה-`.ots` למארחים שלכם לאחר השדרוג.

## 9. וזה הכול

פרסמתם מערך מצומצם של עובדות באופן שבו כל צד שלישי יכול:

- להוריד את כל העובדות באמצעות HTTP פשוט מהמארח שלכם
- לחשב מחדש את שורש Merkle מבייטי העובדות
- להשוות מול השורש שפרסמתם
- לאמת שהשורש הוטבע ב-Bitcoin בזמן שנחתם ב-OTS
- להוריד באופן עצמאי את אותן עובדות דרך IPFS לפי ה-CID שפורסם
- לוודא שכל התקצירים תואמים

אם אחד מהשלבים האלה נכשל — בוצע שיבוש. הקורא אינו חייב לסמוך עליכם. עליו רק לעשות את החשבון.
