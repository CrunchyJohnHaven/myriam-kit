*Bản dịch tiếng Việt — để xem bản gốc tiếng Anh, xem [README.md](README.md)*

# myriam-kit

[![License: CC0-1.0](https://img.shields.io/badge/license-CC0_1.0-lightgrey.svg)](LICENSE)
[![Examples: 6](https://img.shields.io/badge/worked_examples-6-blue.svg)](#worked-examples)
[![Verifier: browser](https://img.shields.io/badge/verifier-browser_+_python-green.svg)](lib/verify.html)
[![Bitcoin: anchored](https://img.shields.io/badge/bitcoin-OTS_anchored-orange.svg)](https://opentimestamps.org)
[![IPFS: pinned](https://img.shields.io/badge/ipfs-pinned-65c2cb.svg)](https://ipfs.tech)
[![Sigsum-friendly](https://img.shields.io/badge/transparency-Sigstore_adjacent-purple.svg)](https://www.sigstore.dev)

Một bộ công cụ nhỏ để công bố một tập hợp nhỏ các sự kiện theo cách sao cho:

- Mọi thay đổi đối với bất kỳ sự kiện nào đều có thể được phát hiện công khai (cây Merkle)
- Trạng thái tại thời điểm công bố có thể kiểm chứng được dựa trên chuỗi khối Bitcoin (OpenTimestamps)
- Nội dung vẫn tồn tại ngay cả khi bất kỳ nhà cung cấp lưu trữ đơn lẻ nào bị gỡ bỏ (IPFS)
- Toàn bộ công cụ chỉ nặng dưới 100 KB và có thể kiểm chứng với khoảng 50 dòng Python

Đây không phải là một chuỗi khối. Không có token. Không có cơ chế đồng thuận nào để tham gia. Không có DAO. Công cụ này là `sha256sum` + `ots` + `ipfs`, được kết dính lại với nhau bằng các quy ước đặt tên hợp lý.

Bộ công cụ được đặt tên theo giao thức MYRIAM, lần đầu tiên được triển khai tại [disclosure.host](https://disclosure.host) vào ngày 2026-05-21. Trang đó chứa sáu sự kiện, một gốc Merkle, và một chứng thực Bitcoin. Bộ công cụ này là sự khái quát hóa của mô hình đó.

## Tình trạng

- v0: hoạt động trên macOS với Python 3.10+, Homebrew, và kết nối internet. Chưa kiểm tra trên Linux nhưng dự kiến sẽ hoạt động. Windows: hãy dùng WSL.
- Thuộc phạm vi công cộng (CC0). Hãy sử dụng nó, fork nó, đưa nó vào kho mã của bạn, không cần ghi nhận. Mục đích không phải là sự ghi nhận.

## Bạn có thể làm gì với nó

Mô hình này phù hợp với bất cứ nơi nào cần một tập hợp nhỏ các sự kiện có tính chất:

- **Có thể công bố** đến một lượng độc giả rộng qua HTTP đơn thuần
- **Bền vững** — độc giả 30 năm sau vẫn có thể kiểm chứng được
- **Phát hiện được giả mạo** — mọi thay đổi phải có thể phát hiện được, không nhất thiết phải ngăn chặn được
- **Không cần tin tưởng** — không độc giả nào phải tin tưởng người công bố (chỉ tin vào toán học)

Các trường hợp sử dụng cụ thể tại [docs/USE_CASES.md](docs/USE_CASES.md). Danh sách ngắn:

| Lĩnh vực | Các sự kiện được niêm phong |
|---|---|
| Y tế công cộng | Kết quả kiểm nghiệm lô vắc-xin, các mốc thử nghiệm thuốc |
| Bầu cử | Tổng số phiếu cấp khu vực bầu cử tại thời điểm chứng nhận |
| An toàn AI | Hash trọng số mô hình + thẻ mô hình + điểm đánh giá tại thời điểm phát hành |
| Báo chí | Bản kê khai tài liệu nguồn (chỉ hash) cho các vụ tiết lộ của người tố giác |
| Khoa học | Hash dữ liệu thô + hash kịch bản phân tích + kết quả tuyên bố |
| Tòa án | Hash của vật chứng số tại thời điểm thu thập |
| Mua sắm công | Gốc được niêm phong của dữ liệu chi tiêu công |

Điểm chung của các trường hợp này: một tập nhỏ các sự kiện, yêu cầu độ bền cao, nhiều bên không tin tưởng nhau, và ngân sách lưu trữ nhỏ. Đó chính xác là hình dạng mà công cụ này được xây dựng để phục vụ.

## Những gì nó KHÔNG làm

- **Lưu trữ bí mật.** Mọi thứ bạn đặt trong `facts/` đều là công khai. Giao thức này dành cho việc công bố, không phải để giấu giếm.
- **Mở rộng cho tập dữ liệu lớn.** Cây Merkle mở rộng tốt; sự chú ý của độc giả thì không. Vượt quá khoảng 20 sự kiện, trang sẽ trở nên không thể đọc được. Nếu bạn muốn niêm phong một triệu bản ghi, hãy hash chúng ngoài trang và đặt gốc Merkle của cây con đó vào một sự kiện.
- **Bảo vệ chống lại việc thu hồi.** Toàn bộ ý nghĩa là bạn không thể thay đổi những gì đã niêm phong. Nếu bạn có thể muốn rút lại một tuyên bố sau này, đừng niêm phong nó.
- **Thuyết phục một người hoài nghi cố chấp.** Một người hoài nghi cố chấp sẽ không chạy `ipfs add -r --cid-version=1 -Q facts/`. Tuy nhiên, họ sẽ buộc tội bạn đã bịa đặt toàn bộ thiết lập. Không có biện pháp phòng thủ ở cấp độ giao thức nào chống lại chế độ thất bại thứ hai này. Không có biện pháp phòng thủ ở cấp độ giao thức nào chống lại bất cứ điều gì tồn tại trong động cơ của con người thay vì trong toán học.

## Cách sử dụng

Hướng dẫn năm phút tại [docs/QUICKSTART.md](docs/QUICKSTART.md).
Đặc tả giao thức đầy đủ tại [docs/SPEC.md](docs/SPEC.md).
Mô hình mối đe dọa tại [docs/THREAT_MODEL.md](docs/THREAT_MODEL.md).
So sánh với các hệ thống lân cận (Sigstore, Sigsum, CT, OTS, IPFS, OSF, Arweave, v.v.) tại [docs/COMPARISON.md](docs/COMPARISON.md).

## Cách kiểm chứng bản công bố của người khác

Ba lựa chọn, theo thứ tự dễ tiếp cận:

1. **Trình duyệt**: mở [`lib/verify.html`](lib/verify.html) trong bất kỳ trình duyệt hiện đại nào. Dán URL của bản công bố. Nhấp vào "verify". Sử dụng `crypto.subtle` để hash — không cần cài đặt, không cần backend, không có dữ liệu đo từ xa. Bước chứng thực Bitcoin vẫn cần một công cụ dòng lệnh (xem bước 7 trong trang kiểm chứng).
2. **Python**: `python3 lib/verify.py` từ bên trong thư mục bản công bố. Chỉ dùng thư viện chuẩn; cần `ots` cho việc kiểm chứng Bitcoin.
3. **Từ đầu**: đọc [`docs/SPEC.md §3`](docs/SPEC.md) và tự triển khai lại. Thuật toán Merkle gói gọn trong dưới 30 dòng ở bất kỳ ngôn ngữ nào.

## Các ví dụ thực hành

Sáu bộ ví dụ chất lượng sản xuất được đóng gói cùng với toolkit. Mỗi bộ được niêm phong, được đóng dấu OTS, được pin trên IPFS, và bao gồm một README hướng dẫn áp dụng giải thích khi nào nên fork nó cho một trường hợp thực tế và các chế độ thất bại nào mà nó phòng vệ.

- [`examples/whistleblower-manifest/`](examples/whistleblower-manifest/) —
  dành cho chế độ thất bại Boeing 737 MAX / Theranos / báo cáo thanh tra FDA, nơi bằng chứng bị chôn vùi hoặc bị thay đổi bởi các bên trung gian.
- [`examples/ai-model-card/`](examples/ai-model-card/) — dành cho các phòng thí nghiệm AI phát hành mô hình, với các cam kết trước triển khai trở nên phát hiện được một cách máy móc thay vì bằng lời nói.
- [`examples/drug-trial-preregistration/`](examples/drug-trial-preregistration/) —
  dành cho các nhà tài trợ thử nghiệm lâm sàng, phát hiện việc đổi điểm cuối sau thực tế và báo cáo có chọn lọc (các chế độ thất bại Vioxx, Paxil Study 329).
- [`examples/vaccine-batch-attestation/`](examples/vaccine-batch-attestation/) —
  dành cho các nhà sản xuất vắc-xin và cơ quan kiểm tra chất lượng, neo các kết quả kiểm nghiệm xuất xưởng và cam kết thu hồi.
- [`examples/scientific-reproducibility/`](examples/scientific-reproducibility/) —
  dành cho các nhóm nghiên cứu, neo bộ ba (dữ liệu, đường ống xử lý, đầu ra mong đợi) TRƯỚC khi phân tích để phát hiện công khai p-hacking và HARKing.
- [`examples/election-tally-precertification/`](examples/election-tally-precertification/) —
  dành cho hội đồng kiểm phiếu cấp huyện và cơ quan bầu cử, neo các kết quả kiểm phiếu được chứng nhận tại thời điểm chứng nhận để các sửa đổi âm thầm sau chứng nhận trở nên phát hiện được công khai.

Hãy đọc một trong những ví dụ này trước khi tự viết của riêng bạn. Ví dụ gần nhất với trường hợp sử dụng của bạn thường là điểm khởi đầu fork đúng đắn.

## Khởi động nhanh

Phiên bản một dòng:

```bash
./lib/myriam-init.sh my-publication
cd my-publication
# edit facts/*.txt to say what you actually want sealed
./lib/seal.sh        # builds Merkle root, stamps OTS, pins IPFS
./lib/verify.sh      # re-verifies everything locally
# upload site/ to any static host. Anywhere. It doesn't matter.
```

## Tại sao nó tồn tại

Các nguyên thủy mật mã (cây Merkle, OpenTimestamps, IPFS) đã trưởng thành nhiều năm rồi. Điều còn thiếu là lớp keo nhỏ nhất có thể — một bộ kit mà bạn có thể đưa vào một dự án phụ và có được một sản phẩm có thể công bố và đã được niêm phong chỉ trong một buổi chiều, không cần thiết lập hạ tầng, không cần học giao thức, không cần viết một dòng mã nào ngoài chính các sự kiện.

Hầu hết các công cụ công bố mật mã đều giả định bạn muốn trở thành một người vận hành nút. Công cụ này giả định bạn muốn công bố sáu tập tin văn bản và không bao giờ phải nghĩ về mật mã học nữa.

## Ảnh hưởng và công trình tiền nhiệm

- [Sigsum](https://www.sigsum.org/) — nhật ký minh bạch cho chữ ký
- [Sigstore](https://www.sigstore.dev/) — toàn vẹn chuỗi cung ứng phần mềm
- [Certificate Transparency](https://certificate.transparency.dev/) — nhật ký chứng chỉ TLS
- [OpenTimestamps](https://opentimestamps.org/) — đóng dấu thời gian bằng Bitcoin
- [IPFS](https://ipfs.tech/) — lưu trữ định danh theo nội dung
- [The CALM protocol](https://disclosure.host) — khung công bố bảo vệ chủ thể, trong đó phiên bản đầu tiên (MYRIAM tại disclosure.host) đã được viết

myriam-kit là nhỏ nhất trong số này. Nó gần với tinh thần một đường ống Unix hơn là một hệ thống.

## Một lưu ý về tên gọi

Giao thức MYRIAM được đặt tên theo Myriam Proof của John Bradley, một chứng minh logic đã được tuyên bố về điểm tiếp xúc đầu tiên cho trí tuệ phi nhân loại. Giao thức không phụ thuộc vào việc chứng minh đó có đúng hay không. Giao thức hoạt động cho bất kỳ tập hợp nhỏ các sự kiện nào; chỉ tình cờ là nó đã được triển khai đầu tiên để công bố sáu sự kiện bao gồm một tuyên bố về việc tiết lộ về người ngoài hành tinh.

Nếu bạn fork bộ kit này để niêm phong các lô vắc-xin hoặc kết quả kiểm phiếu bầu cử, việc nó ban đầu được sử dụng để công bố một tuyên bố về tiếp xúc với người ngoài hành tinh là không liên quan đến bạn. Toán học không quan tâm.

Tuy vậy: nếu bạn DÙNG nó để công bố một tuyên bố về tiếp xúc với người ngoài hành tinh, giao thức đã được thử nghiệm chiến trường trong lĩnh vực cụ thể đó. README của lần triển khai MYRIAM đầu tiên tuyên bố rõ ràng rằng đây là tác phẩm nghệ thuật của một nhân vật LLM tên là Calm, không phải là một thông điệp từ bất kỳ bên ngoài hành tinh nào. Bạn cũng nên làm như vậy. Nếu không, độc giả sẽ giả định điều tồi tệ nhất về trạng thái tinh thần của bạn.

## Được bảo trì bởi

Chưa có ai. Phạm vi công cộng. Hãy fork nó. Cải thiện nó. Mang giao thức tiến lên mà không cần xin phép.
