*Bản dịch tiếng Việt — để xem bản gốc tiếng Anh, xem [SPEC.md](SPEC.md)*

# Đặc tả giao thức MYRIAM-kit

## 0. Mục đích

Tài liệu này đặc tả một giao thức tối giản để công bố một tập nhỏ các sự kiện văn bản dưới dạng có thể phát hiện được giả mạo, có thể kiểm chứng bằng mật mã, và còn tồn tại được sau khi bất kỳ nhà cung cấp lưu trữ đơn lẻ nào bị gỡ bỏ.

Đây là sự khái quát hóa của giao thức lần đầu được triển khai tại [disclosure.host](https://disclosure.host) dưới tên gọi "MYRIAM v1."

## 1. Không phải mục tiêu

- Lưu trữ bí mật. Mọi thứ đều công khai theo bản chất xây dựng.
- Bộ dữ liệu lớn. Vượt quá ~20 sự kiện, giao thức không còn đúng hình dạng nữa.
- Công bố theo thời gian thực. Mỗi lần công bố là một sự kiện niêm phong rời rạc.
- Thu hồi. Giao thức là chỉ-thêm-vào ở cấp độ phiên bản.

## 2. Mô hình sự kiện

Một SỰ KIỆN là một tập tin văn bản UTF-8 với:

- Mẫu tên tập tin: `NN_short_name.txt` trong đó NN là chỉ số hai chữ số được đệm số không, bắt đầu từ 01.
- Dạng chuẩn: các byte như đã viết, không chuẩn hóa.
- Hash từng sự kiện: hex chữ thường của `SHA-256(file_bytes)`.

TẬP sự kiện là danh sách có thứ tự của tất cả các tập tin khớp mẫu trong `facts/`, được sắp xếp theo thứ tự từ điển.

Ràng buộc: mọi nội dung sự kiện NÊN được diễn đạt như một *sự kiện đặt tên* hoặc *sự kiện tuyên bố* có thể quy gán cho một bên cụ thể. Các tuyên bố bản thể luận ("mặt trăng là đá") làm suy yếu cổng kiểm chứng; chỉ có sự kiện công bố là có thể kiểm chứng, không phải bản thân tuyên bố. "X đã phát biểu rằng Y" là dạng đúng. "Y là đúng" thì không.

## 3. Gốc Merkle

Theo kiểu Bitcoin, như trong v0 của giao thức MYRIAM đã triển khai:

1. Lá: các hash SHA-256 từng sự kiện theo thứ tự của tập sự kiện.
2. Nếu một cấp có số lượng nút lẻ, hãy nhân đôi nút cuối cùng.
3. Hash cặp các nút liền kề: `parent = SHA-256(left_bytes || right_bytes)`, trong đó `left_bytes` và `right_bytes` là các giá trị hash 32-byte thô (không phải biểu diễn hex của chúng).
4. Lặp lại cho đến khi còn lại một nút. Đó là gốc Merkle.

Gốc được công bố dưới dạng hex chữ thường không có ký tự xuống dòng ở cuối.

### 3.1 Test vector

| Vector | Lá (các byte UTF-8 được hash) | Gốc mong đợi (hex) |
|---|---|---|
| A | `"a"` | `ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb` |
| B | `"a"`, `"b"` | `e5a01fee14e0ed5c48714f22180f25ad8365b53f9779f79dc4a3d7e93963f94a` |
| C | `"a"`, `"b"`, `"c"` | `d31a37ef6ac14a2db1470c4316beb5592e6afd4465022339adafda76a18ffabe` |

Bất kỳ phiên bản triển khai tuân thủ nào cũng PHẢI tái tạo các vector này. Chúng được dẫn xuất từ chính `lib/build.py` và có thể được tái tạo bằng kịch bản đó.

## 4. Cam kết Bitcoin

Gốc Merkle được cam kết vào chuỗi khối Bitcoin qua [OpenTimestamps](https://opentimestamps.org). Chính sách mặc định là:

> Đóng dấu chống lại ít nhất hai nhà điều hành lịch dưới sự kiểm soát hành chính độc lập.

Một biên lai thỏa mãn chính sách này có thể được kiểm chứng bởi bất kỳ bên nào có thể chạy `ots verify <receipt>.ots` và tiếp cận đường dẫn nâng cấp của một trong hai lịch.

Cặp nhà điều hành mặc định được tích hợp trong `lib/seal.sh`:

- `alice.btc.calendar.opentimestamps.org` — Peter Todd
- `finney.calendar.eternitywall.com` — Eternity Wall

Các phiên bản triển khai CÓ THỂ sử dụng các nhà điều hành khác. Chính sách đa dạng-nhân-chứng (≥2 nhà điều hành độc lập) là quy phạm; các nhà điều hành cụ thể thì không.

## 5. Phản chiếu định danh theo nội dung

Thư mục `site/` chứa trang đã công bố và các tập tin sự kiện NÊN được thêm vào IPFS:

```
ipfs add -r --cid-version=1 -Q site/
```

CIDv1 thu được (mã codec dag-pb) là địa chỉ nội dung của bản công bố. Nó có tính tất định từ nội dung byte của `site/`. Bất kỳ sự sửa đổi nào đối với bất kỳ tập tin nào trong `site/` đều tạo ra một CID khác.

Pin lên các dịch vụ bổ sung ngoài nút cục bộ của người công bố được khuyến nghị mạnh để bảo đảm độ bền; đặc tả này không bắt buộc các dịch vụ cụ thể.

## 6. Quản lý phiên bản

Giao thức là **chỉ-thêm-vào ở cấp độ phiên bản**. Mọi thay đổi đều yêu cầu một phiên bản mới đã niêm phong:

- Một bản sửa đổi đặc tả mới (hoặc không thay đổi)
- Một tập sự kiện mới, có thể kế thừa nguyên vẹn các sự kiện từ các phiên bản trước
- Một gốc Merkle mới
- Một biên lai OpenTimestamps mới
- Một CID IPFS mới

Mọi phiên bản trước đều được giữ công bố tại các URL có gắn phiên bản. Một thay đổi đối với bất kỳ sự kiện nào của v(N) đều yêu cầu v(N+1), với cả hai phiên bản đều hiển thị và có thể kiểm chứng lại được.

## 7. Kiểm chứng

Bất kỳ bên thứ ba nào cũng có thể kiểm chứng tính toàn vẹn của một bản công bố bằng cách:

1. Tải về các tập tin sự kiện và tính lại các hash SHA-256 từng sự kiện.
2. Tính lại gốc Merkle theo §3 và so sánh với gốc đã công bố.
3. Kiểm chứng biên lai OpenTimestamps đối với chuỗi khối Bitcoin cho chứng thực đầy đủ của ít nhất một lịch.
4. Tính lại CID IPFS một cách độc lập qua `ipfs add -r --cid-version=1` và so sánh với CID đã công bố.

`lib/verify.py` thực hiện các bước 1–3 mà không cần phụ thuộc bên ngoài ngoài stdlib của Python và client `ots`. Bước 4 cần client `ipfs`.

## 8. Cổng từ chối

Một bản công bố KHÔNG ĐƯỢC bao gồm một sự kiện mà:

- Định danh một bên thứ ba riêng tư chưa đồng ý được nêu tên.
- Trình bày một giả thuyết như một xác nhận.
- Không thể được rút gọn thành một sự kiện đặt tên/tuyên bố có thể kiểm chứng hoặc một hiện vật mật mã.
- Có khả năng dự kiến hợp lý làm tăng số tử vong có thể ngăn ngừa được khi công bố.

Quy tắc thứ tư là quy tắc chịu lực. Nó được thực thi tại bước con người xem xét bởi người công bố. Không có sự thực thi cấp giao thức nào đối với cổng từ chối; giao thức công bố bất kỳ byte nào được đưa cho nó. Người công bố chịu trách nhiệm về cổng này.

## 9. Tuyên bố trung thực về giới hạn

- **Có thể phát hiện được, chứ không phải là không thể.** Giao thức làm cho việc giả mạo có thể phát hiện được, không phải là không thể thực hiện được. Một kẻ tấn công có quyết tâm vẫn có thể thay thế một bản công bố khác và thuyết phục một số độc giả rằng đó là bản gốc. Giá trị của giao thức là việc thay thế trở nên có thể chứng minh được bằng mật mã đối với bất kỳ ai chạy kiểm tra.
- **Không có biện pháp phòng vệ chống lại việc công bố sự không thật.** Nếu người công bố niêm phong một sự kiện tuyên bố "X đã xảy ra" và X không xảy ra, giao thức sẽ niêm phong tuyên bố sai với cùng độ trung thực mà nó niêm phong các tuyên bố đúng. Giao thức chứng thực cho những gì đã *được công bố*, không phải cho những gì là *sự thật*.
- **Ký kết một bên.** v1 của MYRIAM đã triển khai sử dụng một chủ thể ký kết duy nhất. Ký kết đa bên là công việc tương lai.
- **Độ bền của pin.** Pin IPFS chỉ tại nút của người công bố mang lại "có sẵn khi máy của tôi đang chạy + bộ đệm gateway theo cơ hội." Độ bền dài hạn yêu cầu các pin dự phòng trên nhiều dịch vụ độc lập.

Các giới hạn này được nêu ở đây để không độc giả nào giả định rằng giao thức mang lại nhiều hơn những gì nó thực sự mang lại.
