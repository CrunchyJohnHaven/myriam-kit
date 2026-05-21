*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

# Bộ Công Cụ Khả Năng Tái Lập Khoa Học

Một ví dụ myriam-kit chìa-khóa-trao-tay dành cho các nhóm nghiên cứu, tạp chí, và các tổ chức tập trung vào khả năng tái lập muốn công bố một bản kê khai khả năng tái lập được neo vào Bitcoin, có tính minh chứng can thiệp, song song với một bài báo hoặc bản tiền-in.

## Bộ công cụ này tạo ra những gì

Một ấn phẩm được niêm phong chứa, cho một nghiên cứu:

1. Định danh nghiên cứu (tiêu đề bài báo, các tác giả, tổ chức, các nhà tài trợ, COI)
2. **SHA-256 của kho dữ liệu thô** — tập dữ liệu chính thức
3. **Hash của đường ống phân tích** — script + Docker image digest + các phụ thuộc đã được ghim
4. **Hash của gói đầu ra kỳ vọng** — những gì một người tái lập trung thực sẽ tạo ra
5. Giao thức tái lập + các cam kết công bố hậu-kết-quả
6. (Các) bên chủ thể ký

Con dấu được dự định cho giai đoạn **tiền-phân-tích**: dữ liệu đã đóng băng, đường ống đã được hoàn thiện, đầu ra kỳ vọng đã được tính toán, TẤT CẢ trước khi bất kỳ kết quả nào được nhìn thấy với mục đích viết bài báo.

## Bộ công cụ này phòng vệ chống lại những gì

**Các kiểu thất bại mà con dấu bắt được:**

- **p-hacking**: các thay đổi hậu-hoc đối với phân tích sau khi nhìn thấy kết quả có thể được phát hiện qua sự khác biệt giữa FACT 04 đã được niêm phong và đường ống đã được công bố.
- **HARKing** (Đặt giả thuyết sau khi đã biết kết quả): giả thuyết được tiền-đăng-ký trong FACT 02 ổn định theo byte.
- **Thao túng dữ liệu hậu-bài-báo**: việc băm lại kho dữ liệu so với FACT 03 sẽ tiết lộ bất kỳ sửa đổi nào.
- **Trôi dạt đường ống**: việc băm lại đường ống phân tích so với FACT 04 bắt được các thay đổi âm thầm.
- **Trò chơi quyền tác giả**: việc âm thầm thêm hoặc gỡ bỏ các tác giả sau khi công bố trở nên có thể phát hiện được so với FACT 02 đã được niêm phong.

**Các kiểu thất bại KHÔNG được bao phủ:**

- Gian lận trong việc thu thập dữ liệu thô (con dấu neo dữ liệu tại thời điểm niêm phong, không phải tại thời điểm thu thập)
- Tính không-thể-tái-lập sinh học / thực nghiệm (con dấu chỉ neo khả năng tái lập tính toán)
- Các vấn đề về kích cỡ mẫu hoặc tính giá trị của tổng thể (đây là các câu hỏi thiết kế nghiên cứu)
- Sự thật của tuyên bố căn bản (con dấu neo những gì đã được tuyên bố, không phải liệu thế giới có khớp với tuyên bố hay không)

## Khi nào nên sử dụng bộ công cụ này

Hãy xem xét việc niêm phong nếu:

- Bạn là một nhóm nghiên cứu đang thực hiện một phân tích có rủi ro cao (thử nghiệm lâm sàng, đánh giá hệ thống AI, nghiên cứu tái lập) và muốn có tính liêm chính pháp y vượt ra ngoài các dấu thời gian OSF / GitHub
- Bạn là một nhà nghiên cứu sự-nghiệp-đầu-tiên muốn có sự bảo vệ uy tín bất đối xứng: tiền-phân-tích được niêm phong có nghĩa là các chỉ trích tương lai "họ đã p-hacked" có một bằng chứng-phản-bác công khai
- Bạn là biên tập viên tạp chí hoặc người dẫn đầu dự án tái lập muốn khuyến khích tiền-đăng-ký cấp-mã-hóa cho một tập con các bài báo
- Bạn đang làm việc trên một phân tích nơi các điều chỉnh hậu-hoc có hậu quả đáng kể đối với lĩnh vực (tâm lý học, kinh tế hành vi, nghiên cứu y tế)

## Tiền lệ về tử vong / tổn hại trong lịch sử

Tính-liên-quan-đến-tử-vong của bộ công cụ này là gián tiếp:

- **Nghiên cứu tế bào gốc / ung thư không thể tái lập:** một số bài báo đã dẫn đến tổn hại bệnh nhân thông qua các thử nghiệm lâm sàng bị định hướng sai. Tiền-đăng-ký được niêm phong của đường ống gốc sẽ neo sự so sánh.
- **Tranh cãi về hiệu quả của Tamiflu:** đánh giá Cochrane mất nhiều năm một phần vì việc truy cập dữ liệu thô bị tranh chấp. Các hash của dữ liệu được niêm phong tại thời điểm công bố sẽ làm cho các tranh chấp về truy cập dữ liệu có thể giải quyết được ngay lập tức.
- **Khủng hoảng không-thể-tái-lập tổng quát:** chi phí tử vong cấp-lĩnh-vực của nghiên cứu y sinh không-thể-tái-lập là đáng kể (Begley & Ellis 2012 ước tính >50% các phát hiện tiền-lâm-sàng không thể tái lập). Việc neo mã hóa là một đòn bẩy cấu trúc.

## Cách fork bộ công cụ này

```bash
cp -r ~/Genesis/myriam-kit/examples/scientific-reproducibility ~/my-paper-seal
cd ~/my-paper-seal

# CRITICAL: do this BEFORE seeing any results
shasum -a 256 raw_data_v0.tar.gz       # compute the canonical data hash
shasum -a 256 analysis.py              # hash your pipeline
docker buildx imagetools inspect <image> --format '{{.Manifest.Digest}}'

$EDITOR facts/*.txt                    # populate with real values
bash build/seal.sh                     # seal BEFORE running the analysis
python3 build/verify.py                # confirm

# Now run the analysis. Hash the output and confirm matches FACT 05.
# If it doesn't match, the pipeline is non-deterministic; fix and re-seal.
```

## Tích hợp với cơ sở hạ tầng học thuật hiện có

- **arXiv / bioRxiv / medRxiv**: bao gồm URL hoặc IPFS CID của con dấu MYRIAM trong phần tóm tắt hoặc tài liệu bổ sung
- **OSF**: đính kèm tạo phẩm con dấu vào dự án OSF cùng với mẫu tiền-đăng-ký thông thường
- **AsPredicted**: bao gồm URL con dấu MYRIAM trong tài liệu tiền-đăng-ký
- **GitHub**: hash commit của đường ống phân tích là những gì FACT 04 neo; GitHub cung cấp nguồn, MYRIAM neo các byte
- **Zenodo / Figshare / OpenAIRE**: gửi dữ liệu thô, sau đó niêm phong hash của bản gửi; con dấu khó bị thay thế âm thầm hơn về mặt pháp y so với siêu dữ liệu của bản gửi
- **Tài liệu bổ sung của tạp chí**: bao gồm tạo phẩm con dấu MYRIAM như một tệp bổ sung tại thời điểm nộp

## Những gì bộ công cụ này KHÔNG thay thế

- Phê duyệt IRB / hội đồng đạo đức
- Đánh giá ngang hàng
- Các nghiên cứu tái lập (khả năng tái lập tính toán ≠ khả năng tái lập thực nghiệm)
- Các thỏa thuận truy cập dữ liệu đối với dữ liệu nhạy cảm

## Một ghi chú về thứ tự tác giả và công lao

Con dấu neo DANH SÁCH TÁC GIẢ tại thời điểm niêm phong. Các tranh chấp về quyền tác giả phát sinh hậu-công-bố có thể được đánh giá so với danh sách đã được niêm phong. Đây là một đòn bẩy trách nhiệm nhỏ — quan trọng đối với các ECR bị thêm vào hoặc bị gỡ bỏ một cách âm thầm.

## Giấy phép

Phạm vi công cộng (CC0). Hãy dùng nó, sửa đổi nó, bỏ qua nó, fork nó.
