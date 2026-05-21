# Quickstart

*คำแปลภาษาไทย — สำหรับฉบับต้นฉบับภาษาอังกฤษ ดู [QUICKSTART.md](QUICKSTART.md) / [SPEC.md](SPEC.md)*

ห้านาทีตั้งแต่ clone จนถึงสิ่งที่เผยแพร่และผนึกแล้ว ทดสอบบน macOS แล้ว Linux
ควรใช้งานได้ ผู้ใช้ Windows จะต้องใช้ WSL

## 0. สิ่งที่ต้องเตรียม

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. สร้างโครงร่าง

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. แก้ไขข้อเท็จจริง

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

แต่ละไฟล์คือหนึ่งข้อเท็จจริง UTF-8 ลงท้ายบรรทัดด้วย LF รูปแบบชื่อไฟล์คือ
`NN_short_name.txt` โดย NN เป็นเลขที่เติมศูนย์ด้านหน้า ไฟล์จะถูกเรียง
แบบ lexicographic เข้าไปในต้นไม้ Merkle ดังนั้น 02 จะมาหลัง 01 เสมอ

เคล็ดลับ: เรียบเรียงทุกข้อเท็จจริงให้เป็น *เหตุการณ์การตั้งชื่อหรือเหตุการณ์การประกาศ*
ไม่ใช่ข้อกล่าวอ้างเชิง ontological เกี่ยวกับโลก "Acme Corp ได้ประกาศว่าล็อต X
ผ่านการทดสอบ Y" นั้นตรวจสอบยืนยันได้ ส่วน "ล็อต X ปลอดภัย" นั้นไม่ได้

## 3. เริ่มต้น IPFS daemon (ครั้งเดียวต่อเครื่อง)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. ผนึก

```bash
bash build/seal.sh
```

ขั้นตอนนี้จะ:
1. แฮชแต่ละข้อเท็จจริง (SHA-256) คำนวณราก Merkle ในรูปแบบ Bitcoin
2. ประทับเวลาที่รากด้วย OpenTimestamps ผ่าน calendar อิสระสองแห่ง
   (ค่าเริ่มต้นคือ alice + finney — เปลี่ยนได้ผ่าน `MYRIAM_CAL_A`/`MYRIAM_CAL_B`)
3. ปักหมุดไดเรกทอรี `site/` ไว้บน IPFS และพิมพ์ CID ออกมา

รวมแล้ว: ~10 วินาที โดยมี IPFS daemon ที่อุ่นเครื่องแล้ว

## 5. แก้ไข `site/index.html`

แทนที่ตัวแทน (placeholder) ของเทมเพลตด้วยข้อเท็จจริง แฮช และราก Merkle
ที่แท้จริงของคุณ แฮชต่อข้อเท็จจริงที่แสดงต้องตรงกับไฟล์ข้อเท็จจริงแต่ละไฟล์
มิฉะนั้นหน้าจะ fail การตรวจสอบตนเอง

สำหรับแต่ละข้อเท็จจริง คัดลอกเนื้อความจากไฟล์ .txt ไปไว้ในบล็อก
`<div class="fact">` และวาง SHA-256 ลงในบล็อก `<div class="hash">`
ใต้บรรทัดนั้นโดยตรง ส่วนราก Merkle ให้นำไปไว้ในส่วนของ cryptographic-seal

(ใช่ ขั้นตอนนี้ generate อัตโนมัติได้ แต่จงใจไม่ทำ: ขั้นตอนที่ทำด้วยมือคือ
ขั้นตอนการทบทวนโดยมนุษย์ โพรโทคอลไม่ป้องกันการเผยแพร่สิ่งที่
คุณไม่ได้อ่าน)

## 6. ตรวจสอบในเครื่อง

```bash
python3 build/verify.py
```

ผลลัพธ์ที่คาดหวัง:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

คำว่า "Pending" นั้นปกติ — OTS calendar จะอัปเกรดการยืนยัน (attestation)
ให้เป็นการยืนยันแบบ Bitcoin เต็มรูปแบบภายในไม่กี่ชั่วโมง

## 7. Deploy

เลือกอย่างใดก็ได้:

- **Cloudflare Pages**: dashboard → Pages → Direct upload → ลาก `site/` เข้าไป
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` ใน `site/`, push ขึ้น repo, เปิดใช้งาน Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (เปิด static hosting)
- **VPS ธรรมดาก็ได้**: `scp -r site/* user@host:/var/www/html/`

CID ของ IPFS จากขั้นตอนที่ 4 ให้ URL แบบอ้างอิงเนื้อหาเพิ่มเติมแก่คุณ:
`https://<CID>.ipfs.dweb.link/` ใช้มัน

## 8. อัปเกรดใบเสร็จ OTS (ในภายหลัง)

ภายในไม่กี่ชั่วโมงหลังการผนึก ให้รัน:

```bash
ots upgrade build/merkle_root.txt.ots
```

ขั้นตอนนี้จะแปลงการยืนยันแบบ pending ของแต่ละ calendar ให้เป็น
การยืนยันแบบ Bitcoin เต็มรูปแบบที่อ้างอิงไปยังบล็อกเฉพาะ ให้ deploy ไฟล์
`.ots` ใหม่ไปยังโฮสต์ของคุณหลังจากอัปเกรดเสร็จ

## 9. แค่นั้นเอง

คุณได้เผยแพร่ข้อเท็จจริงชุดเล็ก ๆ ในรูปแบบที่บุคคลที่สามใด ๆ สามารถ:

- ดึงข้อเท็จจริงทั้งหมดผ่าน HTTP ธรรมดาจากโฮสต์ของคุณ
- คำนวณราก Merkle ใหม่จากไบต์ของข้อเท็จจริง
- เทียบกับรากที่คุณเผยแพร่
- ตรวจสอบยืนยันว่ารากถูก commit เข้าสู่ Bitcoin ในเวลาที่ OTS ประทับไว้
- ดึงข้อเท็จจริงชุดเดียวกันผ่าน IPFS โดยใช้ CID ที่เผยแพร่ ด้วยตนเอง
- ยืนยันว่าแฮชทุกค่าตรงกัน

หากขั้นตอนใดล้มเหลว แสดงว่าได้เกิดการแก้ไขขึ้น ผู้อ่านไม่ต้อง
ไว้วางใจคุณ พวกเขาเพียงแค่ต้องทำเลขให้ถูก
