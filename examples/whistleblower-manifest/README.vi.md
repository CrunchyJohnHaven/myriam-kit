*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

# Bộ niêm phong bản kê khai cho người tố giác

Một ví dụ myriam-kit sẵn sàng dùng dành cho người tố giác đang đối mặt
với chế độ thất bại cụ thể, trong đó **bằng chứng bị chôn vùi, sửa đổi,
hoặc bị tranh cãi bởi các bên trung gian đứng giữa người tố giác và
công chúng**. Những trường hợp lịch sử kinh điển mà bộ này phòng vệ:

- Boeing 737 MAX (báo cáo an toàn nội bộ bị giảm tầm quan trọng/chôn vùi)
- Theranos (lo ngại về xét nghiệm phòng thí nghiệm bị che giấu nhiều năm)
- Báo cáo của thanh tra FDA bị chỉnh sửa sau khi nộp
- Frances Haugen / Facebook (một bản kê khai được niêm phong sẽ chứng
  minh được rằng các tài liệu là xác thực và đã tồn tại tại thời điểm
  được tuyên bố)

Bộ này phòng vệ chống lại điều gì (theo thuật ngữ của giao thức):

- T1–T3 trong [FACT 05](facts/05_threat_model.txt): tranh cãi công khai
  về nội dung tài liệu, các tuyên bố rằng tài liệu chưa được niêm phong
  tại thời điểm được tuyên bố, các tuyên bố về việc bịa đặt hồi tố.
- T9: bên thứ ba trao cho nhà báo các bản sao đã bị thay đổi.

Bộ này **không** phòng vệ chống lại điều gì:

- Trả thù cá nhân đối với người tố giác (T7).
- Áp lực buộc người tố giác rút lại lời tố cáo (T4, được giảm nhẹ một
  phần bởi FACT 07, làm cho việc rút lại trong im lặng có thể phát hiện
  công khai).
- Hành động pháp lý chống lại người tố giác vì chính việc tiết lộ (T5).
- Bôi nhọ nhân cách của người tố giác (T8).
- Các bên trung gian âm thầm bỏ rơi câu chuyện (T10).

Nếu bạn là một người tố giác đang cân nhắc sử dụng bộ này, **hãy đọc
toàn bộ README này trước**. Giao thức là một công cụ. Giao thức không
thay thế cho tư vấn pháp lý, một nhà báo, một cơ quan quản lý, hoặc kỷ
luật cẩn trọng về an ninh vận hành.

## Bộ này tạo ra cái gì

Một *bản kê khai* bằng chứng được niêm phong bằng mật mã (chứ không
phải chính bằng chứng), chứng minh rằng:

1. Các byte cụ thể của mỗi tập tin bằng chứng đã tồn tại tại thời điểm
   niêm phong.
2. Việc niêm phong đã xảy ra tại hoặc trước một thời điểm cụ thể (thông
   qua chứng thực OTS trên Bitcoin).
3. Nguồn gốc, lời tố cáo, mô hình mối đe dọa, giao thức người nhận, và
   cam kết không-rút-lại-trong-im-lặng đều được tuyên bố cùng nhau.

Các tài liệu nền tảng vẫn ở trong tay bạn cho đến khi bạn gửi chúng cho
người nhận. Người nhận xác minh rằng họ đã nhận được chính các byte mà
bạn đã niêm phong.

## Khi nào nên dùng bộ này

Bạn nên cân nhắc niêm phong một bản kê khai **trước khi** truyền bằng
chứng cho một nhà báo, cơ quan quản lý, hoặc luật sư, nếu tất cả các
điều sau đây đều đúng:

- Bạn có bằng chứng ở dạng số (PDF, email, hình ảnh, v.v.) mà bạn muốn
  bảo tồn ở dạng xác thực từng byte.
- Bạn dự kiến rằng các bên trung gian có thể sẽ thay đổi, tranh cãi,
  hoặc chôn vùi bằng chứng.
- Bạn có thể giữ các tài liệu nền tảng trong tay bạn cho đến lúc truyền
  đi.
- Bạn có thể công bố bản kê khai một cách công khai **mà không** tiết
  lộ nội dung của tài liệu (chỉ các hash là công khai).
- Bạn đã cân nhắc các rủi ro về việc bị nhận diện công khai là người tố
  giác (trường principal ký). Nếu ẩn danh, hãy dùng một bút danh một
  cách nhất quán trên mọi công bố liên quan.
- Bạn đã tham vấn luật sư về luật bảo vệ người tố giác trong khu vực
  tài phán của bạn.

## Khi nào KHÔNG nên dùng bộ này

KHÔNG sử dụng bộ này nếu:

- Bản thân các tài liệu chứa thông tin cá nhân về bên thứ ba (bệnh
  nhân, khách hàng, nhân viên) không nên trở thành thứ có thể hash hóa
  công khai. Hãy hash phiên bản đã được biên tập che đậy, không phải
  bản gốc.
- Bản thân hành động công bố bản kê khai sẽ nhận diện người tố giác
  theo cách mà họ chưa đồng thuận.
- Bạn chưa tham vấn luật sư. Giao thức là một công cụ; luật bảo vệ
  người tố giác là đặc thù theo khu vực tài phán và nằm bên ngoài giao
  thức.
- Bạn có thể muốn rút lại bất kỳ lời tố cáo riêng lẻ nào về sau. Niêm
  phong là vĩnh viễn; các bản sửa đổi niêm phong mới là cách duy nhất
  trung thực để chỉnh sửa.
- Bạn đang làm việc này dưới sự ép buộc hoặc áp lực thời gian. Giao
  thức khuếch đại sự cưỡng ép; cổng từ chối (myriam-kit `SPEC §8`) áp
  dụng cho cả người tố giác lẫn người công bố.

## Cách fork bộ này cho một vụ tiết lộ thực tế

```bash
# 1. Sao chép ví dụ này vào một thư mục mới
cp -r ~/Genesis/myriam-kit/examples/whistleblower-manifest ~/my-disclosure
cd ~/my-disclosure

# 2. Xóa nội dung hư cấu; thay bằng các sự kiện thực của bạn.
# Mỗi tập tin trong facts/ là một sự kiện. Đọc từng tập tin và thay thế.
$EDITOR facts/01_example_notice.txt   # đổi thành tuyên bố mở đầu thực
$EDITOR facts/02_provenance.txt       # nguồn gốc thực của bằng chứng của bạn
$EDITOR facts/03_evidence_manifest.txt # hash các tài liệu thực và liệt kê chúng
$EDITOR facts/04_allegation_summary.txt # lời tố cáo thực của bạn
$EDITOR facts/05_threat_model.txt     # các phản ứng dự kiến thực của bạn
$EDITOR facts/06_recipient_protocol.txt # điều chỉnh cho người nhận của bạn
$EDITOR facts/07_no_retraction_commitment.txt # tuyên bố không-rút-lại của bạn
$EDITOR facts/08_signing_principal.txt # danh tính ký thực của bạn (hoặc bút danh)

# 3. Cập nhật site/index.html để phản ánh các sự kiện thực.
# Tập lệnh seal.sh KHÔNG tự động điền HTML; việc chỉnh sửa thủ công
# là bước rà soát của con người.
$EDITOR site/index.html

# 4. Niêm phong.
bash build/seal.sh
# Đầu ra: merkle_root.txt, merkle_root.txt.ots, IPFS CID

# 5. Xác minh tại chỗ.
python3 build/verify.py

# 6. Công bố bản kê khai (KHÔNG phải tài liệu) lên bất kỳ trong các nơi sau:
#    - Một máy chủ tĩnh mà bạn kiểm soát (Cloudflare Pages, GitHub Pages, v.v.)
#    - Mạng IPFS tại CID đã in ra
#    - Cả hai (được khuyến nghị)

# 7. Riêng biệt, truyền các tài liệu nền tảng cho người nhận
#    qua một kênh an toàn do bạn chọn (Signal, SecureDrop, v.v.).
#    Người nhận xác minh hash tập tin so với bản kê khai của bạn.
```

## Tính hash cho các tập tin bằng chứng thực tế

Để hash một tập tin tài liệu bằng SHA-256:

```bash
shasum -a 256 my_document.pdf
```

64 ký tự hex đầu tiên là SHA-256. Đặt nó vào bản kê khai.

Bạn có thể hash nhiều tập tin cùng lúc:

```bash
shasum -a 256 *.pdf *.eml *.jpg > MANIFEST.txt
```

Điều đó cho bạn dữ liệu cho `facts/03_evidence_manifest.txt`.

## Ghi chú về an ninh vận hành

Giao thức MYRIAM KHÔNG cung cấp an ninh vận hành. Nó cung cấp *độ bền
chứng cứ*. Bạn vẫn cần:

- Một kênh giao tiếp an toàn với luật sư của bạn
  ([Signal](https://signal.org/), gặp trực tiếp, hoặc kênh an toàn đã
  được thiết lập của luật sư)
- Một nơi lưu trữ an toàn cho các tài liệu nền tảng (được mã hóa khi
  lưu, không trên các dịch vụ đám mây mà nhà tuyển dụng có thể truy cập)
- Một thiết bị sạch dành cho việc niêm phong (một máy tính xách tay cá
  nhân không liên kết với tài khoản của nhà tuyển dụng; lý tưởng là một
  chiếc chỉ dùng cho mục đích này)
- Một mạng sạch dành cho việc công bố (không phải mạng của nhà tuyển
  dụng, không phải IP nhà của bạn nếu nhà tuyển dụng có thể yêu cầu nhà
  cung cấp dịch vụ Internet của bạn cung cấp thông tin)

Tài liệu khuyến nghị về an ninh vận hành cho người tố giác:

- [Tài liệu SecureDrop của The Intercept](https://securedrop.org/)
- [Tài nguyên của Freedom of the Press Foundation](https://freedom.press/)
- [Hướng dẫn tự vệ chống giám sát của EFF](https://ssd.eff.org/)

Hãy tham khảo các tài liệu này TRƯỚC khi bạn bắt đầu quy trình niêm
phong. Giao thức không bảo vệ chống lại các lựa chọn opsec tồi tệ được
đưa ra trước khi giao thức được kích hoạt.

## Điều người nhận nên biết

Gửi cho người nhận README này cùng với bản kê khai đã niêm phong. Bản
kê khai tự nó chứa giao thức người nhận (FACT 06), nhưng README mở rộng
vai trò của người nhận:

- **Nhà báo**: trước tiên hãy xác minh tính toàn vẹn của chính bản kê
  khai. Sau đó yêu cầu các tài liệu qua một kênh an toàn riêng biệt.
  Xác minh rằng SHA-256 của mỗi tài liệu khớp với bản kê khai trước
  khi công bố. KHÔNG công bố các tài liệu nếu không có sự đồng ý của
  người tố giác; nhưng hãy công bố sự tồn tại của bản kê khai đã được
  niêm phong và kết luận xác minh của bạn.
- **Cơ quan quản lý**: cùng quy trình xác minh. Bản kê khai đã niêm
  phong kèm theo các tài liệu khớp là hình thức chứng cứ mạnh nhất có
  được bên ngoài việc thu thập chính thức với chuỗi giám hộ.
- **Luật sư**: bản kê khai đã niêm phong cung cấp một mỏ neo pháp y
  cho sự tồn tại của các tài liệu tại thời điểm được tuyên bố. Việc nó
  có đáp ứng các quy tắc chứng cứ của một khu vực tài phán cụ thể hay
  không là điều bạn cần xác định.

## Bộ này KHÔNG phải là gì

- Không thay thế cho tư vấn pháp lý.
- Không bảo đảm rằng sẽ có ai đó hành động đối với việc tiết lộ của bạn.
- Không phải là sự bảo vệ chống lại trả thù.
- Không phải là xác thực nội dung của tài liệu (chỉ xác thực các byte
  của chúng tại thời điểm niêm phong).
- Không phải là cách giao tiếp ẩn danh với bất kỳ ai — niêm phong là
  công khai; nếu tên principal ký của bạn là thật, bạn đã bị nhận diện.
  Ngay cả với một bút danh, một bản kê khai đã niêm phong có thể được
  dùng để nhận diện người tố giác nếu siêu dữ liệu bị rò rỉ; giao thức
  không thể phòng vệ chống lại việc nhận diện principal thông qua các
  phương tiện khác.

## Lời kết

Một bản kê khai đã niêm phong là một thứ nhỏ bé. Nó là một dòng byte
duy nhất chứng minh rằng một tập hợp lớn hơn các dòng byte đã tồn tại ở
một hình thức cụ thể tại một thời điểm cụ thể. Sự nhỏ bé đó chính là
sức mạnh của nó: nó chỉ làm một việc, và nó làm việc đó trong suốt
vòng đời của chuỗi khối Bitcoin.

Nếu bạn đang đọc điều này vì bạn đang cân nhắc trở thành một người tố
giác, xin hãy: nói chuyện với một luật sư trước. Hãy sử dụng các hướng
dẫn an ninh vận hành ở trên. Sau đó, nếu và chỉ nếu tất cả các cân
nhắc thượng nguồn đó đều ổn, hãy xem bộ này như xương sống mật mã của
việc tiết lộ của bạn. Mật mã là phần dễ. Tất cả những gì nằm thượng
nguồn của mật mã mới là nơi rủi ro thực sự ngự trị.

## Giấy phép

Phạm vi công cộng (CC0). Hãy fork nó. Cải thiện nó. Sử dụng nó mà
không cần xin phép.
