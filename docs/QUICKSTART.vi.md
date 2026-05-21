*Bản dịch tiếng Việt — để xem bản gốc tiếng Anh, xem [QUICKSTART.md](QUICKSTART.md)*

# Khởi động nhanh

Năm phút từ lúc clone đến khi có một bản công bố đã niêm phong. Đã được kiểm tra trên macOS; trên Linux dự kiến sẽ hoạt động; người dùng Windows cần WSL.

## 0. Điều kiện tiên quyết

```bash
brew install python3 opentimestamps-client ipfs
python3 -m pip install --user certifi  # for macOS SSL
```

## 1. Khởi tạo khung

```bash
git clone <wherever-this-lives> myriam-kit
cd myriam-kit
bash lib/myriam-init.sh my-first-publication
cd my-first-publication
```

## 2. Chỉnh sửa các sự kiện

```
facts/
├── 01_what_this_is.txt
├── 02_what_im_claiming.txt
└── 03_who_signs.txt
```

Mỗi tập tin là một sự kiện. UTF-8. Kết thúc dòng kiểu LF. Mẫu tên tập tin là `NN_short_name.txt` trong đó NN là số có hai chữ số được đệm số không. Chúng được sắp xếp theo thứ tự từ điển vào cây Merkle, do đó 02 luôn đứng sau 01.

Mẹo: hãy diễn đạt mọi sự kiện như một *sự kiện đặt tên hoặc tuyên bố*, chứ không phải như một tuyên bố bản thể luận về thế giới. "Acme Corp đã tuyên bố rằng lô X đã vượt qua bài kiểm tra Y" là có thể kiểm chứng. "Lô X an toàn" thì không.

## 3. Khởi động daemon IPFS (một lần cho mỗi máy)

```bash
ipfs init                 # one-time per user
ipfs daemon &             # background, leave running
```

## 4. Niêm phong

```bash
bash build/seal.sh
```

Lệnh này sẽ:
1. Hash từng sự kiện (SHA-256), tính gốc Merkle theo kiểu Bitcoin.
2. Đóng dấu thời gian cho gốc bằng OpenTimestamps qua hai lịch độc lập (mặc định là alice + finney — có thể ghi đè qua `MYRIAM_CAL_A`/`MYRIAM_CAL_B`).
3. Pin thư mục `site/` lên IPFS và in ra CID.

Tổng cộng: ~10 giây với một IPFS daemon đã sẵn sàng.

## 5. Chỉnh sửa `site/index.html`

Thay thế các phần giữ chỗ trong mẫu bằng các sự kiện, hash, và gốc Merkle thực tế của bạn. Các hash từng sự kiện được hiển thị phải khớp với các tập tin sự kiện, nếu không trang sẽ thất bại trong việc tự kiểm chứng của chính nó.

Với mỗi sự kiện, sao chép nội dung của tập tin .txt vào một khối `<div class="fact">` và đặt SHA-256 vào một `<div class="hash">` ngay bên dưới nó. Gốc Merkle nằm trong phần con dấu mật mã.

(Đúng vậy, bước này có thể được tự động hóa. Có chủ đích là không: bước thủ công chính là bước con người xem xét. Giao thức không bảo vệ chống lại việc bạn công bố thứ mà bạn chưa đọc.)

## 6. Kiểm chứng cục bộ

```bash
python3 build/verify.py
```

Đầu ra mong đợi:
```
OK  merkle root matches: <hex>
OK  N leaf hashes match
--- ots verify merkle_root.txt.ots ---
Pending confirmation in Bitcoin blockchain
```

Trạng thái "Pending" là bình thường — lịch OTS sẽ nâng cấp chứng thực này thành chứng thực Bitcoin đầy đủ trong vòng vài giờ.

## 7. Triển khai

Chọn bất kỳ phương án nào trong số sau:

- **Cloudflare Pages**: bảng điều khiển → Pages → Direct upload → kéo thả `site/`
- **Netlify**: `netlify deploy --dir=site --prod`
- **GitHub Pages**: `git init` trong `site/`, đẩy lên kho, bật Pages
- **S3**: `aws s3 sync site/ s3://your-bucket/ --delete` (bật static hosting)
- **VPS bất kỳ**: `scp -r site/* user@host:/var/www/html/`

CID của IPFS từ bước 4 cung cấp cho bạn một URL định danh theo nội dung bổ sung: `https://<CID>.ipfs.dweb.link/`. Hãy dùng nó.

## 8. Nâng cấp biên lai OTS (sau này)

Trong vòng ~vài giờ sau khi niêm phong, chạy:

```bash
ots upgrade build/merkle_root.txt.ots
```

Lệnh này chuyển đổi chứng thực đang chờ của mỗi lịch thành một chứng thực Bitcoin đầy đủ tham chiếu đến một khối cụ thể. Hãy triển khai lại tập tin `.ots` đến các máy chủ của bạn sau khi nâng cấp.

## 9. Xong

Bạn đã công bố một tập nhỏ các sự kiện theo cách mà bất kỳ bên thứ ba nào cũng có thể:

- Tải về tất cả các sự kiện qua HTTP đơn thuần từ máy chủ của bạn
- Tính lại gốc Merkle từ các byte của sự kiện
- So sánh với gốc đã công bố của bạn
- Kiểm chứng rằng gốc đã được cam kết vào Bitcoin tại thời điểm được đóng dấu OTS
- Tải về cùng các sự kiện một cách độc lập qua IPFS tại CID đã công bố
- Xác nhận rằng tất cả các hash đều khớp

Nếu bất kỳ bước nào trong số đó thất bại, đã có sự giả mạo. Người đọc không cần phải tin tưởng bạn. Họ chỉ cần làm phép toán.
