*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

# Bộ công cụ khóa hành vi mô hình AI

Một ví dụ myriam-kit dùng-ngay-được dành cho các phòng thí nghiệm AI
(thương mại hoặc mã nguồn mở) đang phát hành một mô hình và muốn các
tuyên bố của bản phát hành — danh tính của trọng số, các năng lực, điểm
đánh giá, quá trình duyệt xét an toàn, các cam kết trước triển khai —
được **neo bằng mật mã và có thể xác minh công khai**.

Bộ công cụ này phòng vệ trước chế độ thất bại cụ thể trong đó các mô
hình đã triển khai âm thầm bị trôi dạt, các điểm đánh giá bị viết lại
sau khi đã công bố, hoặc các tuyên bố trước triển khai bị tranh chấp
nhiều năm sau với câu "chúng tôi chưa từng nói điều đó."

## Bộ công cụ này tạo ra điều gì

Một bản kê khai được niêm phong bằng mật mã, chứa đựng, cho một bản
phát hành mô hình:

1. Định danh mô hình (tên, kiến trúc, số lượng tham số, giấy phép)
2. **SHA-256 của tệp trọng số** — hash chính thức của artifact
3. Văn bản thẻ mô hình (năng lực, mục đích sử dụng, trường hợp ngoài
   phạm vi sử dụng, các chế độ thất bại đã biết)
4. Kết quả đánh giá tại thời điểm phát hành (đánh giá năng lực, đánh
   giá an toàn, hiệu chuẩn)
5. Các cam kết trước triển khai (những điều bạn cam kết sẽ không âm
   thầm thay đổi sau khi phát hành)
6. Bên đứng tên ký (con người + tổ chức chịu trách nhiệm)

Niêm phong làm cho mỗi mục này ổn định theo byte, được neo theo thời
gian vào Bitcoin thông qua OpenTimestamps, và có thể truy xuất qua IPFS
độc lập với bất kỳ bên lưu trữ đơn lẻ nào.

Xem ví dụ giả định đã được làm sẵn: [facts/](facts/) và
[site/index.html](site/index.html) đã được hiển thị. Ví dụ sử dụng một
mô hình giả định ("Calm-mini-v0"); một bản phát hành thực sẽ thay thế
nội dung ví dụ.

## Bộ công cụ này phòng vệ trước điều gì

**Các chế độ thất bại mà niêm phong trực tiếp bắt được:**

- **Can thiệp trọng số** — SHA-256 của tệp trọng số đã phát hành nằm
  trong FACT 03. Bất kỳ thay đổi nào sau khi phát hành đối với các byte
  mà người dùng tải xuống đều có thể được phát hiện bằng cách hash lại.
- **Viết lại đánh giá âm thầm** — điểm đánh giá tại thời điểm phát
  hành nằm trong FACT 05. Các tranh chấp trong tương lai dạng "điểm
  đánh giá vẫn luôn là X" có một điểm neo công khai.
- **Trôi dạt tuyên bố năng lực** — văn bản thẻ mô hình trong FACT 04
  ổn định theo byte. Các tranh chấp trong tương lai dạng "chúng tôi
  chưa từng tuyên bố năng lực X" có thể được kiểm tra công khai dựa
  trên văn bản đã được niêm phong.
- **Phân phối lại fine-tune âm thầm** — cam kết trước triển khai số 1
  trong FACT 06 (trong ví dụ đã được làm sẵn) là "không có fine-tuning
  âm thầm dưới cùng một tên." Phát hiện: bất kỳ hash trọng số mới nào
  cũng đồng nghĩa với một tên mô hình mới và một bản công bố được niêm
  phong mới, hoặc cam kết đã bị vi phạm.
- **Chế độ thất bại bị che giấu** — FACT 04 cam kết một danh sách các
  chế độ thất bại đã biết. Danh sách là đơn điệu (có thể tăng, không
  thể giảm đối với một checkpoint đã được đóng băng). Các phát hiện
  trong tương lai về các chế độ thất bại mà phòng thí nghiệm biết nội
  bộ nhưng không công bố sẽ trở thành bằng chứng có thể tranh chấp.

**Các chế độ thất bại KHÔNG được bảo vệ:**

- Mô hình bị người dùng hạ nguồn sử dụng sai mục đích (niêm phong
  chứng minh điều gì đã được phát hành, không phải điều người dùng làm
  với nó).
- Fine-tuning đối kháng bởi bên thứ ba (fine-tune từ bên thứ ba tạo ra
  một hash trọng số khác, do đó niêm phong gốc không bị ảnh hưởng,
  nhưng mô hình của bên thứ ba nằm ngoài phạm vi bảo vệ của niêm
  phong).
- Thay đổi hành vi do thay đổi môi trường triển khai (lời nhắc hệ
  thống khác, cấu hình RAG khác, v.v.).
- Các thất bại mà phòng thí nghiệm thực sự không biết tại thời điểm
  phát hành. Niêm phong cam kết phòng thí nghiệm về *những gì họ biết*;
  nó không thể neo những gì họ không biết.

## Khi nào sử dụng bộ công cụ này

Bạn nên cân nhắc niêm phong một thẻ mô hình nếu:

- Bạn đang phát hành trọng số mô hình công khai HOẶC triển khai một
  mô hình trong bối cảnh mà người dùng hạ nguồn quan tâm đến sự ổn
  định của hành vi.
- Bản phát hành đủ quan trọng để các tranh chấp tương lai "chúng tôi
  chưa từng nói điều đó" là hợp lý (bất kỳ mô hình nào được triển khai
  ở quy mô lớn; bất kỳ mô hình quan trọng về an toàn nào; bất kỳ bản
  phát hành nào đi kèm với các tuyên bố về năng lực).
- Tổ chức của bạn sẵn sàng đưa ra các cam kết trước triển khai để giới
  hạn các hành động trong tương lai (đây là phần chịu trọng lực — xem
  phần tiếp theo).
- Bạn có thể tính SHA-256 của tệp trọng số tại thời điểm phát hành.

## Khi nào KHÔNG sử dụng bộ công cụ này

KHÔNG sử dụng bộ công cụ này nếu:

- Bạn không sẵn lòng bị ràng buộc bởi các cam kết trước triển khai
  trong FACT 06 của ví dụ. Niêm phong làm cho các cam kết có thể được
  phát hiện một cách máy móc; nếu bạn không sẵn sàng cho trách nhiệm
  đó, đừng niêm phong.
- Tệp trọng số sẽ thay đổi thường xuyên (ví dụ, các pipeline
  fine-tuning liên tục). Mỗi thay đổi trọng số đòi hỏi một bản phát
  hành được niêm phong mới. Niêm phong cho từng bản phát hành là nặng;
  bộ công cụ này dành cho các checkpoint *đã đóng băng*.
- Bạn chưa thực hiện duyệt xét an toàn. Niêm phong cam kết các phát
  hiện của duyệt xét an toàn. Nếu bạn niêm phong một bản duyệt xét
  chưa hoàn chỉnh, bạn có một bản ghi công khai vĩnh viễn về một bản
  duyệt xét chưa hoàn chỉnh.
- Bạn có thể muốn rút lại một điểm đánh giá cụ thể nào đó sau này.
  Niêm phong là vĩnh viễn. Các bản công bố được niêm phong mới có thể
  thay thế, nhưng bản gốc không thể bị xóa bỏ.

## Các cam kết trước triển khai chịu trọng lực

FACT 06 của ví dụ cam kết bên phát hành sẽ:

1. **Không fine-tuning âm thầm dưới cùng một tên.** Bất kỳ fine-tune
   nào cũng tạo ra một tên mô hình mới, một bản công bố được niêm
   phong mới, một hash trọng số mới. Phiên bản tiền nhiệm vẫn giữ
   nguyên là phiên bản mang tên đó một cách chính thức.

2. **Không cập nhật đánh giá âm thầm.** Các đánh giá lại có các bản
   công bố được niêm phong mới tham chiếu đến bản gốc qua gốc Merkle.
   Các phiên bản được theo dõi, không ghi đè.

3. **Các chế độ thất bại đã biết có thể tăng, không bao giờ giảm.**
   Một checkpoint đã đóng băng không thể có các chế độ thất bại được
   sửa. Vì vậy danh sách công bố thực tế là đơn điệu.

4. **Xử lý yêu cầu gỡ bỏ.** Nếu bị buộc phải gỡ bỏ mô hình khỏi phân
   phối, phòng thí nghiệm cam kết công bố một tuyên bố được niêm phong
   cuối cùng về việc gỡ bỏ.

Một phòng thí nghiệm áp dụng bộ công cụ này cần quyết định cam kết nào
trong số đó thực sự có thể tuân thủ. Nếu bạn không thể tuân thủ cả
bốn, hãy sửa đổi FACT 06 *trước khi* niêm phong để phản ánh những gì
bạn có thể tuân thủ, và chấp nhận sự bảo vệ bị suy yếu kết quả. Niêm
phong các cam kết mà bạn không có ý định tuân thủ còn tệ hơn là không
niêm phong gì cả.

## Cách fork bộ công cụ này cho một bản phát hành thực tế

```bash
# 1. Sao chép ví dụ này vào pipeline phát hành của bạn
cp -r ~/Genesis/myriam-kit/examples/ai-model-card ~/my-model-release
cd ~/my-model-release

# 2. Chỉnh sửa từng fact cho bản phát hành thực tế của bạn
$EDITOR facts/01_example_notice.txt   # XÓA — bản phát hành của bạn không phải ví dụ
                                       # Thay bằng thông báo phát hành cho mô hình của bạn
$EDITOR facts/02_model_identification.txt
$EDITOR facts/03_weights_hash.txt     # shasum -a 256 your_weights.safetensors
$EDITOR facts/04_model_card.txt       # thẻ mô hình chính thức
$EDITOR facts/05_eval_results.txt     # kết quả đánh giá thực tế
$EDITOR facts/06_release_commitments.txt # các cam kết bạn có thể tuân thủ

# 3. Cập nhật site/index.html để phản ánh bản phát hành thực tế.

# 4. Niêm phong.
bash build/seal.sh

# 5. Xác minh tại chỗ.
python3 build/verify.py

# 6. Triển khai đến:
#    - Trang phát hành của bạn (cạnh thẻ mô hình và trọng số)
#    - Mạng IPFS (script seal.sh đã làm điều này)
#    - Tùy chọn: liên kết đến bản công bố được niêm phong từ
#      ghi chú phát hành Hugging Face / GitHub của bạn
```

## Tích hợp với các pipeline phát hành hiện có

Bộ công cụ này được thiết kế để kết hợp với các công cụ hiện có, không
thay thế chúng:

- **Hugging Face**: đưa URL hoặc IPFS CID của bản công bố được niêm
  phong vào README.md của thẻ mô hình. Hướng dẫn người đọc đến niêm
  phong để có các tuyên bố phát hành ổn định theo byte.
- **GitHub releases**: đưa biên nhận OpenTimestamps
  (`merkle_root.txt.ots`) làm tài sản phát hành. Các tranh chấp tương
  lai dạng "bản phát hành đã bị thay đổi" khi đó được neo vào Bitcoin.
- **Tiêu chuẩn thẻ mô hình (Mitchell et al. 2019)**: bộ công cụ tương
  thích. Các trường thẻ mô hình tiêu chuẩn ánh xạ vào FACTS 02–05 của
  niêm phong. Bạn tạo thẻ mô hình một cách thông thường, và thêm vào
  đó niêm phong nó.
- **Khung đánh giá (lm-evaluation-harness, BIG-bench, v.v.)**: hash
  chính xác commit của khung đánh giá và JSON đầu ra thô; tham chiếu
  những hash đó trong FACT 05. Các lần chạy lại trong tương lai khi đó
  có thể tái tạo độc lập.

## Tính hash trọng số

Đối với một tệp safetensors duy nhất:

```bash
shasum -a 256 model.safetensors
```

Đối với các checkpoint nhiều tệp (các shard GGUF, các safetensors được
shard):

```bash
# Nối các hash theo thứ tự đã sắp xếp, sau đó hash lại
for f in $(ls model-*.safetensors | sort); do
  shasum -a 256 "$f"
done > weights_manifest.txt
shasum -a 256 weights_manifest.txt
```

Hash cuối cùng là cái đi vào FACT 03. Bao gồm cả các hash từng shard và
hash tổng hợp cuối cùng để người dùng có thể xác minh các shard riêng
lẻ khi họ tải xuống.

## Điều người nhận (người dùng mô hình của bạn) cần biết

Một bản phát hành mô hình kèm bản công bố được niêm phong bởi MYRIAM
cho phép người dùng:

1. **Xác minh các trọng số họ đã tải xuống** bằng cách hash lại và so
   sánh với FACT 03.
2. **Xác minh thẻ mô hình chưa bị viết lại** bằng cách kiểm tra FACT
   04 đã được niêm phong dựa trên phiên bản hiện đang được phòng thí
   nghiệm công bố.
3. **Xác minh điểm đánh giá là điểm tại thời điểm phát hành** bằng
   cách so sánh các tuyên bố đánh giá hiện tại của phòng thí nghiệm
   với FACT 05 đã được niêm phong.
4. **Yêu cầu phòng thí nghiệm chịu trách nhiệm về các cam kết trước
   triển khai của họ** bằng cách kiểm tra hành vi thực tế dựa trên
   FACT 06 đã được niêm phong.

Người dùng phát hiện ra sai biệt có bằng chứng mật mã về sai biệt đó.
Họ có thể công bố bằng chứng đó; bản công bố được niêm phong gốc là
điểm neo.

## Bộ công cụ này KHÔNG phải là

- Không phải sự thay thế cho việc thực hiện duyệt xét an toàn. Niêm
  phong là *bản ghi* của duyệt xét an toàn, không phải bản thân duyệt
  xét.
- Không phải sự thay thế cho các đánh giá thực tế. Niêm phong neo các
  điểm bạn tạo ra; nó không xác nhận phương pháp luận.
- Không phải sự bảo đảm rằng mô hình an toàn. Niêm phong ghi lại điều
  phòng thí nghiệm tuyên bố về mô hình tại thời điểm phát hành; nó
  không chứng nhận các tuyên bố đó.
- Không phải sự bảo vệ chống lại việc sử dụng sai mô hình bởi người
  dùng hạ nguồn.

## Ghi chú về fine-tuning đối kháng

Một mối lo phổ biến về an toàn AI: ai đó fine-tune mô hình của bạn để
loại bỏ các hành vi an toàn và phân phối lại nó. Niêm phong KHÔNG THỂ
ngăn chặn điều này. Điều niêm phong có thể làm là:

- Neo điều mà mô hình *gốc* đáng lẽ phải làm (FACT 04).
- Neo điểm đánh giá gốc là gì (FACT 05).
- Cung cấp một điểm tham chiếu để có thể đo lường các fine-tune đối
  kháng.

Một người dùng gặp một bản phân phối lại của bên thứ ba có thể xác
minh xem các trọng số có khớp với hash gốc đã được niêm phong hay
không. Nếu không, người dùng biết rằng họ có một mô hình không phải
bản gốc và rằng bất kỳ tuyên bố an toàn nào quy cho phòng thí nghiệm
đều không áp dụng.

## Kết luận

Niêm phong một bản phát hành mô hình là công việc thêm nhỏ đối với
phòng thí nghiệm: ~10 phút để tính hash và chạy script niêm phong, sau
đó là quyết định 30 giây về việc đưa các cam kết trước triển khai nào
vào. Trách nhiệm mà nó thêm vào là bất đối xứng: chi phí nhỏ cho các
phòng thí nghiệm trung thực, ràng buộc lớn cho các phòng thí nghiệm
mà nếu không thì sẽ âm thầm trôi dạt các tuyên bố của họ.

Nếu bạn là một phòng thí nghiệm AI đang cân nhắc áp dụng, bộ công cụ
này thuộc phạm vi công cộng (CC0). Hãy fork nó. Sửa đổi nó. Toán học
là phần chịu trọng lực, không phải triển khai cụ thể.

## Giấy phép

Phạm vi công cộng (CC0). Không yêu cầu ghi nhận.
