*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

# Bộ công cụ Chứng thực Lô Vắc-xin

Một ví dụ myriam-kit chìa khóa trao tay dành cho các nhà sản xuất vắc-xin, cơ
quan đảm bảo chất lượng và các cơ quan y tế công cộng muốn công bố một con
dấu chống giả mạo, được neo trên Bitcoin, cho việc xuất xưởng một lô.

## Bộ công cụ này phòng vệ trước điều gì

**Các chế độ thất bại mà con dấu phát hiện được:**

- **Sửa đổi hồi tố thầm lặng các kết quả kiểm nghiệm xuất xưởng.** Tất cả 8
  tệp PDF kiểm nghiệm xuất xưởng trong ví dụ đều được băm. Việc băm lại sau
  khi xuất xưởng sẽ phát hiện bất kỳ sửa đổi nào.
- **Tranh chấp về việc tiêu chuẩn kỹ thuật nào đã áp dụng tại thời điểm xuất
  xưởng.** FACT 02 đã được niêm phong chứa thông tin nhận dạng lô chính tắc
  và mã băm của hồ sơ sản xuất. Các tranh chấp trong tương lai kiểu "tiêu
  chuẩn đã luôn là X" có một mỏ neo công khai.
- **Thu hẹp phạm vi thu hồi một cách thầm lặng.** Các cam kết về cảnh giác
  dược phẩm trong FACT 05 được niêm phong; việc không tôn trọng chúng có
  thể được quan sát một cách công khai.
- **Tái thiết lập tiêu chuẩn hồi tố cho một lô không đạt tiêu chuẩn.** Nếu
  một kết quả kiểm nghiệm xuất xưởng thực ra là một PASS ở mức ranh giới và
  bị phân loại lại thành FAIL sau khi xuất xưởng, các mã băm báo cáo đã niêm
  phong chứng minh được những gì tệp PDF kết quả gốc đã ghi.

**Các chế độ thất bại KHÔNG được bao quát:**

- Gian lận trong chính quy trình sản xuất (con dấu neo các kết quả kiểm
  nghiệm, không phải tính toàn vẹn của sản xuất).
- Các phản ứng bất lợi là hậu quả sinh học của một lô đã đạt tiêu chuẩn
  (con dấu không chứng nhận an toàn lâm sàng, chỉ chứng nhận tính toàn vẹn
  của tài liệu).
- Tranh chấp về việc phiên bản nào của một đặc tả quy chế là có thẩm quyền.

## Khi nào nên sử dụng bộ công cụ này

Hãy cân nhắc niêm phong việc xuất xưởng một lô nếu:

- Bạn là một nhà sản xuất vắc-xin muốn chứng minh tính toàn vẹn pháp y của
  hồ sơ xuất xưởng vượt xa những gì các cơ quan quản lý yêu cầu
- Bạn là một đội QA đang áp dụng thực hành "công bố những gì chúng tôi
  chứng thực"
- Bạn là một nhà sản xuất quy mô nhỏ/quốc gia trong một khu vực pháp lý có
  hạ tầng quy chế yếu hơn, muốn neo hồ sơ lô vào một bộ xác minh toàn cầu
- Bạn là một cơ quan y tế công cộng hoặc tổ chức phi chính phủ đang điều
  hành một chương trình sản xuất vắc-xin phi thương mại (ví dụ cho các bệnh
  bị bỏ quên)

## Tiền lệ về tử vong trong lịch sử

- **Nhiễm bẩn heparin (2008, Trung Quốc):** chondroitin sulfate đã được
  sulfat hóa quá mức giả mạo trong các lô heparin. Một bản kê khai kiểm
  nghiệm xuất xưởng đã niêm phong sẽ làm cho việc sửa đổi thầm lặng hồ sơ
  kiểm nghiệm sau khi xuất xưởng có thể phát hiện được bằng mật mã.
- **Tylenol cyanide (1982):** tranh chấp hồi tố về điểm gốc của hành vi giả
  mạo. Một mã băm hồ sơ sản xuất đã niêm phong neo trạng thái trước phân
  phối.
- **Các đợt thu hồi lô vắc-xin khác nhau** nơi câu hỏi "lô này đã từng được
  kiểm nghiệm đúng cách chưa" trở thành tranh chấp nhiều năm sau.

Bộ công cụ KHÔNG phải là một giải pháp cho BẤT KỲ vấn đề nào trong số này
theo nghĩa nghiêm ngặt — nhưng trong mỗi trường hợp, các chứng thực lô đã
niêm phong sẽ cung cấp một dòng thời gian pháp y rõ ràng hơn.

## Cách fork bộ công cụ này cho một lô thực

```bash
cp -r ~/Genesis/myriam-kit/examples/vaccine-batch-attestation ~/release-FBP-XXXX
cd ~/release-FBP-XXXX
$EDITOR facts/*.txt       # replace fictional content with real batch
bash build/seal.sh        # SEAL BEFORE distribution begins
python3 build/verify.py   # confirm
```

**THỜI ĐIỂM CỰC KỲ QUAN TRỌNG**: niêm phong tại thời điểm QA xuất xưởng,
TRƯỚC KHI lô được phân phối. Một con dấu sau khi phân phối có giá trị pháp y
yếu hơn.

## Tích hợp với hạ tầng dược phẩm hiện có

- **Hồ sơ eCTD (FDA / EMA):** URL công bố đã niêm phong hoặc CID IPFS có thể
  được tham chiếu trong phần Module 3 (chất lượng)
- **Tiền thẩm định của WHO:** bản kê khai đã niêm phong chứng minh chuỗi
  kiểm nghiệm trước xuất xưởng cho các khu vực pháp lý ngoài FDA/EMA
- **Phản hồi cảnh giác dược phẩm:** FACT 05 cam kết nhà sản xuất báo cáo
  niêm phong các số đếm AE tổng hợp vào thời điểm 6 và 12 tháng
- **Hệ thống thu hồi (RxConnect, MedWatch):** nếu cần thu hồi, chính phạm vi
  thu hồi được niêm phong dưới MYRIAM, cung cấp xác minh công khai rằng tất
  cả các lô đã phân phối đang được xử lý

## Bộ công cụ này KHÔNG thay thế những gì

- Hồ sơ quy chế của FDA / EMA / WHO
- Dấu vết kiểm toán GMP (con dấu neo KẾT QUẢ, không phải hồ sơ quy trình
  thô)
- Cơ sở dữ liệu cảnh giác dược phẩm (VAERS / EudraVigilance)
- Hệ thống điều phối thu hồi

## Giấy phép

Phạm vi công cộng (CC0). Hãy fork. Không yêu cầu ghi công.
