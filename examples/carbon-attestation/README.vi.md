# Bộ công cụ niêm phong chứng thực carbon

*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

Một ví dụ myriam-kit chìa-khóa-trao-tay dành cho nhà phát triển dự án
carbon, các bên xác minh độc lập và các tổ chức đăng ký, những người
muốn công bố một dấu niêm phong neo vào Bitcoin, phát hiện được giả
mạo, cho một sự kiện phát hành tín chỉ carbon, xác minh loại bỏ, hoặc
chứng thực phát thải tại chính thời điểm chứng nhận — để các sửa đổi
âm thầm sau khi phát hành trở nên có thể phát hiện được một cách công
khai.

---

## Những gì bộ công cụ này KHÔNG làm (đọc trước)

Tín chỉ carbon là chủ đề gây tranh cãi cả về chính trị và khoa học.
Dấu niêm phong là một dấu thời gian mật mã của những gì đã được chứng
thực. Nó không thể xác minh liệu những gì được chứng thực có phản ánh
lợi ích khí hậu thực sự hay không. Các chế độ thất bại sau đây nằm
**ngoài lĩnh vực của dấu niêm phong**, và chúng chiếm phần lớn các câu
hỏi có ý nghĩa về tính toàn vẹn của tín chỉ carbon:

1. **Tính bổ sung (Additionality).** Dấu niêm phong không thể xác minh
   rằng hoạt động được tính tín chỉ sẽ không xảy ra nếu không có tài
   chính carbon. Kịch bản giả định ngược về nguyên tắc là không thể
   quan sát được. Dấu niêm phong ghi lại lập luận về tính bổ sung của
   phương pháp luận; nó không phán xét lập luận đó.

2. **Tính lâu dài (Permanence).** Dấu niêm phong không thể xác minh
   rằng carbon được hấp thụ sẽ vẫn được hấp thụ trong khung thời gian
   liên quan (hàng thập kỷ đến hàng thế kỷ đối với carbon rừng, thang
   thời gian địa chất đối với một số loại loại bỏ). Văn liệu gần đây
   (Badgley et al. 2022, Patterson et al. 2022) cho thấy các bể đệm
   đã bị cạn kiệt đáng kể do các sự kiện đảo ngược thực tế. Một tín
   chỉ được niêm phong là một *tuyên bố* được niêm phong về tính lâu
   dài dưới các giả định cụ thể về bể đệm, không phải bằng chứng về
   tính lâu dài.

3. **Rò rỉ (Leakage).** Dấu niêm phong không thể xác minh rằng lượng
   phát thải tránh được trong khu vực dự án không đơn giản bị chuyển
   sang một khu vực ngoài dự án. Các khoản khấu trừ rò rỉ mặc định
   theo phương pháp luận là các giá trị thay thế quy định, không phải
   là phép đo. Dấu niêm phong neo khoản khấu trừ đã áp dụng; nó không
   chứng nhận rằng khoản khấu trừ đó là chính xác.

4. **Lợi ích đi kèm (Co-benefits).** Dấu niêm phong không thể xác
   minh các tuyên bố về phát triển cộng đồng hoặc đa dạng sinh học.
   Các lợi ích đi kèm thường được tự tuyên bố và được bên xác minh
   xem xét, không được kiểm toán ở độ sâu như định lượng carbon. Dấu
   niêm phong neo các hash tài liệu; không gì hơn.

5. **Tính đầy đủ của Sự đồng thuận Tự do, Có Thông tin trước (FPIC).**
   Sự đồng thuận của người bản địa và cộng đồng trong các dự án
   carbon có lịch sử thất bại được ghi chép (đồng thuận bị ép buộc,
   đồng thuận từ các cơ quan không đại diện, "đồng thuận" hậu kỳ
   thông qua đền bù). Dấu niêm phong neo tài liệu FPIC và các hash
   nhật ký khiếu nại; nó không thể chứng nhận rằng quá trình đồng
   thuận là chân thực.

6. **Tính độc lập của bên xác minh.** Bên xác minh được trả tiền bởi
   nhà phát triển dự án. Đây là một xung đột lợi ích mang tính cấu
   trúc mà chưa có hệ thống công nhận nào giải quyết. Dấu niêm phong
   neo tuyên bố độc lập của bên xác minh; nó không chứng nhận rằng
   tuyên bố đó là đúng.

7. **Tính trùng lặp giữa các tổ chức đăng ký hoặc với các kiểm kê
   quốc gia.** Dấu niêm phong neo bản chụp tình trạng đăng ký tại
   thời điểm chứng thực. Nếu cùng một hoạt động cũng đang được nước
   chủ nhà tính vào NDC của họ, hoặc cũng được tuyên bố trên một tổ
   chức đăng ký khác, dấu niêm phong làm cho tình trạng đăng ký có
   thể so sánh được nhưng không ngăn chặn tính trùng lặp.

8. **Tính đúng đắn của tuyên bố người mua.** Người mua hoàn lại một
   tín chỉ được niêm phong để hỗ trợ tuyên bố "phát thải ròng bằng
   không" hoặc "trung hòa carbon" đang đưa ra một tuyên bố tiếp theo
   mà dấu niêm phong không bao phủ. Dấu niêm phong ghi lại việc hoàn
   lại; tính hợp lệ của tuyên bố tiếp thị của người mua là một câu
   hỏi tiếp theo riêng biệt.

9. **Tính đúng đắn của phương pháp luận.** Dấu niêm phong ghi lại
   trích dẫn phương pháp luận + hash tài liệu có hiệu lực tại thời
   điểm chứng thực. Nó không khẳng định rằng phương pháp luận có giá
   trị khoa học. Cải cách phương pháp luận xảy ra; việc niêm phong
   theo một phương pháp luận sau đó được sửa đổi không làm cho các
   tín chỉ trở nên "sai" hoặc "đúng" hồi tố — nó neo các quy tắc nào
   đã áp dụng tại thời điểm phát hành.

**Phần giới hạn trung thực ở trên là phần chịu lực của bộ công cụ
này.** Hầu hết mọi câu hỏi có ý nghĩa về tính toàn vẹn của tín chỉ
carbon nằm trong một trong chín nhóm đó. Dấu niêm phong khép lại
khoảng trống còn lại hẹp: sửa đổi âm thầm hồi tố các byte trong hồ sơ.
Khoảng trống đó là có thực và đáng để khép lại, nhưng nó nhỏ so với
địa hạt còn tranh cãi.

---

## Những gì bộ công cụ này PHẢI TỪ CHỐI niêm phong

Bộ công cụ được cấu hình để từ chối các mẫu sự kiện sau đây ngay cả
khi một người dùng có quyền ký hợp lệ gửi chúng:

- **"Tính bổ sung" được nêu như một sự kiện.** Niêm phong tính bổ
  sung như một sự kiện tạo ra một hồ sơ gây hiểu lầm. Bộ công cụ
  chấp nhận *lập luận* về tính bổ sung tuân theo phương pháp luận,
  không phải *tuyên bố* về tính bổ sung.
- **"Tính lâu dài" mà không có công bố rõ ràng về khung thời gian
  và bể đệm.** Niêm phong tính lâu dài mà không có các tham số này
  che giấu những gì dự án thực sự đang cam kết.
- **"Không rò rỉ" mà không có đo lường cụ thể cho dự án.** Các khoản
  khấu trừ rò rỉ mặc định theo phương pháp luận không phải là đo
  lường và dấu niêm phong sẽ không xem chúng như vậy.
- **Định lượng được tạo ra trước khi xác minh độc lập hoàn tất.**
  Một dấu niêm phong trước-xác-minh tạo ra một hồ sơ "đã xác minh"
  dương tính giả.
- **Hồ sơ phát hành cho các tín chỉ cũng được phát hành trên một tổ
  chức đăng ký khác mà không có công bố chéo-đăng-ký rõ ràng** trong
  FACT 06.
- **Hồ sơ hoàn lại không nêu tên người hưởng lợi của việc hoàn lại.**
  Hoàn lại ẩn danh làm suy yếu chức năng lợi ích công của việc hoàn
  lại; bộ công cụ từ chối tạo điều kiện cho nó.
- **Tuyên bố FPIC không được hỗ trợ bởi các hash tài liệu có thể
  chứng thực.**
- **Phát hành theo Điều 6.2 / 6.4 mà không có hash thư ủy quyền
  (LoA) của nước chủ nhà** được niêm phong trong FACT 06.
- **Niêm phong theo yêu cầu của bất kỳ bên nào khác ngoài nhà phát
  triển dự án + bên xác minh cùng nhau** cho dự án đó.
- **Tuyên bố lợi ích đi kèm được niêm phong là "đã chứng nhận"** khi
  chúng chỉ là "tự tuyên bố và được bên xác minh xem xét".

Bản thân việc từ chối có thể được niêm phong như một sự kiện ("Bên
này yêu cầu niêm phong X; bộ công cụ đã từ chối theo quy tắc từ chối
Y"), tạo ra một hồ sơ công khai về nỗ lực lạm dụng.

---

## Những gì bộ công cụ này CÓ niêm phong

8 sự kiện tại thời điểm chứng thực:

1. **Thông báo ví dụ** — tuyên bố ấn phẩm là một ví dụ (các chứng
   thực thực sự sẽ loại bỏ hoặc thay thế phần này).
2. **Định danh dự án** — tên dự án, tổ chức đăng ký, ID dự án đăng
   ký, trích dẫn phương pháp luận + hash, hash ranh giới địa lý, vụ
   mùa (vintage), nhà phát triển dự án, tuyên bố lợi ích đi kèm, tình
   trạng FPIC.
3. **Định lượng phát thải hoặc loại bỏ** — tổng tấn CO2e, kịch bản
   giả định ngược cơ sở, khoản khấu trừ rò rỉ, đóng góp vào bể đệm,
   khoản khấu trừ không chắc chắn, tuyên bố ròng có thể tính tín chỉ,
   các hash của mọi đầu vào số.
4. **Phương pháp luận đo lường** — nguồn dữ liệu viễn thám, mạng lưới
   ô đất chuẩn mặt đất, hash nhật ký hiệu chỉnh thiết bị, hash mô
   hình phân loại + thống kê độ chính xác, mô hình mật độ carbon,
   bản kê nguồn gốc mã + tái lập kết quả.
5. **Xác minh độc lập** — tổ chức xác minh, công nhận, hash tuyên bố
   độc lập, các cam kết trước với nhà phát triển, hash kho ảnh chuyến
   thăm thực địa, các phát hiện được nêu + giải quyết, hash tài liệu
   ý kiến xác minh.
6. **Hồ sơ phát hành hoặc hoàn lại** — yêu cầu phát hành + phê duyệt,
   tổng số tín chỉ được phát hành, dải số sê-ri, tuyên bố chéo-đăng-ký,
   hash LoA nước chủ nhà nếu áp dụng, dải số sê-ri hoàn lại + người
   hưởng lợi (đối với chứng thực hoàn lại), hash bản chụp tình trạng
   đăng ký.
7. **Công bố đi kèm và hồ sơ từ chối** — các tranh chấp phương pháp
   luận đang chờ xử lý, rủi ro không-lâu-dài, lưu ý về rò rỉ, lưu ý
   về tính bổ sung, hash FPIC + nhật ký khiếu nại, lưu ý về lợi ích
   đi kèm, cam kết trước của bên xác minh; danh sách rõ ràng các mẫu
   mà bộ công cụ đã từ chối niêm phong.
8. **Principal ký** — nhà phát triển dự án + bên xác minh + tổ chức
   đăng ký, mỗi bên có vai trò + phạm vi chứng thực + thông tin khóa
   mật mã.

Mỗi sự kiện kết thúc bằng quy ước cổng-từ-chối: *"Sự kiện này chỉ
khẳng định X. Nó không khẳng định Y"* (trong đó Y là chế độ thất bại
gần nhất từ phần "KHÔNG làm" ở trên).

---

## Những gì bộ công cụ này phòng thủ chống lại

- **Sửa đổi âm thầm việc định lượng sau khi phát hành.** Bất kỳ thay
  đổi số nguyên nào trong FACT 03 đều tạo ra một SHA-256 khác, một
  gốc Merkle khác, và không qua được xác minh OTS.
- **Thay thế âm thầm phương pháp luận.** FACT 02 đóng băng trích dẫn
  phương pháp luận + hash tài liệu tại thời điểm phát hành. Việc tổ
  chức đăng ký tráo đổi một phiên bản phương pháp luận khác sau khi
  phát hành có thể so sánh công khai.
- **Sửa đổi âm thầm kịch bản cơ sở.** Hash đầu ra mô hình kịch bản cơ
  sở của FACT 03 được niêm phong. Việc điều chỉnh lại kịch bản cơ sở
  hậu kỳ để tạo ra nhiều tín chỉ hơn có thể phát hiện được.
- **Thay thế âm thầm ý kiến của bên xác minh.** Hash tài liệu ý kiến
  của FACT 05 được niêm phong. Việc viết lại "bên xác minh luôn nói
  X" sau khi phát hành có thể phát hiện được.
- **Biến mất âm thầm hồ sơ hoàn lại.** Bản chụp tình trạng đăng ký
  của FACT 06 được niêm phong. Các tín chỉ bí ẩn trở lại "có sẵn" sau
  khi được đánh dấu là đã hoàn lại có thể phát hiện được so với dấu
  niêm phong.
- **Thay thế âm thầm tài liệu FPIC.** Các hash FPIC + nhật ký khiếu
  nại của FACT 07 được niêm phong. Các tài liệu đồng thuận thay thế
  có thể phát hiện được.
- **Loại bỏ âm thầm các công bố bất tiện.** Tình trạng công bố đi kèm
  của FACT 07 được niêm phong. Việc lặng lẽ xóa một lưu ý không-lâu-dài
  khỏi một trang mô tả dự án có thể phát hiện được so với các byte
  được niêm phong.

Bộ công cụ KHÔNG phòng thủ chống lại các câu hỏi cơ bản về tính toàn
vẹn (tính bổ sung, tính lâu dài, rò rỉ, tính đầy đủ của FPIC, tính
độc lập của bên xác minh, tính hợp lệ của phương pháp luận). Đó là
những vấn đề khó hơn và dấu niêm phong không thể giải quyết chúng.

---

## Các trường hợp lịch sử hoặc gần-lịch sử mà bộ công cụ sẽ giúp được

Bộ công cụ sẽ tạo ra một mỏ neo hữu ích — *không phải là một giải
pháp* — trong các trường hợp liên quan đến việc sửa đổi âm thầm hồi
tố các hồ sơ chứng thực carbon. Nó sẽ KHÔNG giải quyết các câu hỏi
gây tranh cãi cơ bản trong bất kỳ trường hợp nào trong số này.

- **Cuộc điều tra năm 2023 của Guardian / Die Zeit / SourceMaterial
  về tín chỉ rừng nhiệt đới của Verra.** Các nhà điều tra phát hiện
  rằng hầu hết các dự án REDD+ được nghiên cứu đã tạo ra các tín chỉ
  mà lượng phát thải tránh được tuyên bố không khớp với phân tích lại
  từ dữ liệu viễn thám sau đó. Cuộc điều tra đòi hỏi việc tái dựng
  tài liệu dự án dựa vào các hồ sơ đăng ký đã bị sửa đổi hồi tố. Một
  ấn phẩm được niêm phong tại mỗi chu kỳ phát hành sẽ cung cấp các
  byte tham chiếu rõ ràng cho những gì đã được chứng thực tại mỗi chu
  kỳ — không phải là một giải pháp cho vấn đề cơ sở cơ bản, nhưng là
  một dòng thời gian pháp y rõ ràng.

- **Các sự kiện đảo ngược offset rừng California năm 2020.** Nhiều dự
  án carbon rừng trong thị trường tuân thủ của California đã trải qua
  các đảo ngược do cháy rừng vượt quá dự trữ bể đệm dành cho chúng.
  Việc tái dựng những gì mỗi dự án đã chứng thực về rủi ro không-lâu-dài
  *tại thời điểm phát hành* (so với những gì dự án sau đó tuyên bố là
  đã chứng thực) hiện đang khó khăn. Các dấu niêm phong cho mỗi vụ
  mùa sẽ làm cho các chứng thực trước-cháy có thể được truy xuất một
  cách kinh điển.

- **Nhiều dự án REDD+ trong đó phương pháp luận cơ sở của khu vực
  tham chiếu bị chỉ trích hồi tố là bị thổi phồng.** Một hash tài liệu
  phương pháp luận được niêm phong tại thời điểm phát hành sẽ neo lại
  phiên bản phương pháp luận nào thực sự áp dụng cho vụ mùa nào, làm
  cho lập luận bảo vệ "phương pháp luận luôn là X" có thể so sánh
  được.

- **Một số tranh chấp dự án tái sinh do con người gây ra của Đơn vị
  Tín chỉ Carbon Úc (ACCU) (2022–2023).** Phê bình học thuật về việc
  liệu sự tái sinh có thực sự do dự án gây ra hay là tự nhiên đã trở
  thành tranh chấp về những gì dự án ban đầu đã tuyên bố. Các chứng
  thực được niêm phong sẽ cung cấp các hồ sơ rõ ràng cho mỗi vụ mùa.

- **Các hồ sơ hoàn lại offset carbon đã thay đổi trạng thái.** Một số
  trường hợp được ghi chép về các hồ sơ hoàn lại trên các tổ chức
  đăng ký thị trường tự nguyện dường như thay đổi trạng thái sau khi
  hoàn lại (trở thành "hoàn lại" vì một lý do khác, hoặc được quy cho
  một người hưởng lợi khác sau sự kiện). Các dấu niêm phong cho mỗi
  lần hoàn lại sẽ neo trạng thái tại thời điểm hoàn lại ban đầu.

Trong không trường hợp nào trong số này bộ công cụ sẽ giải quyết được
liệu tín chỉ cơ bản có đại diện cho lợi ích khí hậu thực sự hay không.
Bộ công cụ neo các hồ sơ; đó là tất cả những gì nó làm.

---

## Khi nào nên sử dụng bộ công cụ này

- Bạn là một nhà phát triển dự án muốn công bố một chứng thực phát
  hiện-được-giả-mạo bên cạnh hồ sơ đăng ký tiêu chuẩn của bạn.
- Bạn là một bên xác minh độc lập muốn ý kiến xác minh của mình có
  thể xác minh được công khai trước biểu thị sau này của tổ chức đăng
  ký về "những gì bên xác minh đã nói".
- Bạn là một tổ chức đăng ký muốn cung cấp một lớp toàn vẹn bổ sung
  cho các hồ sơ phát hành và hoàn lại — đặc biệt cho các dự án ở các
  khu vực pháp lý có cơ chế hỗ trợ tính toàn vẹn đăng ký theo luật
  pháp yếu hơn.
- Bạn là một nhà báo, học giả, hoặc NGO thực hiện phân tích dọc nhiều
  năm về các dự án carbon và cần một mỏ neo công khai để so sánh các
  biểu thị sau này của một dự án với các byte tại-thời-điểm-phát-hành
  của nó.
- Bạn là một người mua (net-zero doanh nghiệp, tuân thủ hàng không)
  muốn các tín chỉ bạn hoàn lại được hoàn lại đối với các hồ sơ được
  neo công khai, để tuyên bố tiếp thị tiếp theo của bạn có thể được
  kiểm toán đối với một dòng thời gian pháp y ổn định.

## Khi nào KHÔNG nên sử dụng bộ công cụ này

- **Không sử dụng thay cho xác minh độc lập được công nhận.** Dấu
  niêm phong không thay thế xác minh ISO 14064-3; nó kết hợp với
  xác minh đó.
- **Không sử dụng để tuyên bố rằng một dự án là "có tính bổ sung,"
  "lâu dài," hoặc "ít rò rỉ".** Dấu niêm phong không thể xác minh các
  thuộc tính đó. Sử dụng dấu niêm phong để khẳng định chúng là lạm
  dụng.
- **Không sử dụng như sân khấu hợp pháp hóa cho tín chỉ chất lượng
  thấp.** Một dấu niêm phong mật mã trên một tín chỉ chất lượng thấp
  là một hồ sơ pháp y vĩnh viễn về chất lượng kém, không phải là một
  sự bảo vệ chống lại nó. Nguyên thủy cắt theo cả hai hướng; đó là
  sự trung thực của nó.
- **Không sử dụng để niêm phong các tín chỉ cũng đang được nước chủ
  nhà tính vào NDC của họ** mà không có công bố điều chỉnh-tương-ứng
  rõ ràng trong FACT 06.
- **Không niêm phong trước-xác-minh.** Một dấu niêm phong trước khi
  ý kiến của bên xác minh hoàn tất tạo ra một hồ sơ "đã xác minh"
  dương tính giả.
- **Không sử dụng dưới áp lực bỏ qua một công bố sự kiện đi kèm trong
  FACT 07** (các tranh chấp phương pháp luận đang chờ xử lý, các vấn
  đề FPIC, cam kết trước của bên xác minh). Hãy từ chối, và niêm
  phong sự từ chối.
- **Không sử dụng như một huy hiệu tiếp thị.** "MYRIAM-được niêm
  phong" không phải là một tuyên bố chất lượng; đó là một thuộc tính
  pháp y. Đối xử với nó như một huy hiệu chất lượng chính là sự lạm
  dụng mà thiết kế ưu-tiên-ràng-buộc đang cố gắng ngăn chặn.

## Cách fork bộ công cụ này cho một chứng thực thực sự

```bash
cp -r ~/Genesis/myriam-kit/examples/carbon-attestation ~/project-FCS-0099-2025
cd ~/project-FCS-0099-2025
$EDITOR facts/*.txt        # thay thế nội dung hư cấu bằng nội dung thực
bash build/seal.sh         # NIÊM PHONG VÀO HOẶC SAU khi phát hành đăng ký, không trước
python3 build/verify.py    # xác nhận
```

**Thời điểm quan trọng:** niêm phong VÀO HOẶC SAU sự kiện phát hành
chính thức của tổ chức đăng ký, KHÔNG phải trước. Một dấu niêm phong
trước-phát-hành tạo ra một hồ sơ "đã phát hành" dương tính giả. Đối
với các chứng thực hoàn lại, niêm phong VÀO thời điểm hoàn lại. Đối
với các chứng thực giám sát liên tục giữa phát hành và hoàn lại, niêm
phong tại mỗi chu kỳ giám sát có chữ ký của bên xác minh — nhưng làm
rõ trong FACT 01 rằng chứng thực là một cập nhật giám sát, không phải
một phát hành.

## Tích hợp với cơ sở hạ tầng carbon hiện có

- **Verra (VCS).** URL của ấn phẩm được niêm phong hoặc IPFS CID có
  thể được gắn vào trang dự án VCS như tài liệu bổ sung. Dấu niêm
  phong không thay thế xác minh VCS; nó kết hợp với xác minh đó.
- **Gold Standard.** Cùng một mô hình tích hợp — chứng thực bổ sung
  bên cạnh tài liệu phát hành Gold Standard. Nhấn mạnh của Gold
  Standard về lợi ích đi kèm + tài liệu lợi ích cộng đồng ánh xạ tự
  nhiên vào FACT 02 + FACT 07.
- **American Carbon Registry (ACR), Climate Action Reserve (CAR).**
  Cùng một mô hình tích hợp.
- **Điều 6.4 (cơ chế Cơ quan Giám sát Thỏa thuận Paris).** Hash LoA
  nước chủ nhà trong FACT 06 được thiết kế cụ thể cho khả năng truy
  vết ITMO theo Điều 6.4 / 6.2. Công bố điều chỉnh-tương-ứng là một
  trường có cổng-từ-chối.
- **EU ETS MRV.** Đối với các bên phát hành thị trường tuân thủ, hash
  báo cáo MRV ánh xạ vào hash bảng tính định lượng của FACT 03. Dấu
  niêm phong kết hợp với — không thay thế — báo cáo phát thải được
  xác minh của bên điều hành.
- **CDP (Carbon Disclosure Project) công bố doanh nghiệp.** Đối với
  các doanh nghiệp trích dẫn các tín chỉ đã hoàn lại trong các bản
  đệ trình CDP, hồ sơ hoàn lại được niêm phong theo FACT 06 là hồ sơ
  truy xuất kinh điển. Ngôn ngữ đệ trình CDP có thể tham chiếu gốc
  Merkle hoặc IPFS CID của ấn phẩm được niêm phong.
- **ISO 14064-2 (dự án) / ISO 14064-3 (xác minh) / ISO 14065 (công
  nhận).** Dấu niêm phong ghi lại khẳng định tuân thủ + các hash; nó
  không thực hiện đánh giá tuân thủ.
- **TSVCM Core Carbon Principles (CCP) / nhãn ICVCM.** Khi một dự án
  đã được đánh giá theo ICVCM CCPs, hash kết quả đánh giá có thể
  được niêm phong trong FACT 07 như một công bố đi kèm.

## Những gì bộ công cụ này KHÔNG thay thế

- Xác minh độc lập được công nhận (ISO 14064-3)
- Quy trình phát hành và hoàn lại của tổ chức đăng ký
- Đánh giá tuân thủ phương pháp luận
- Quy trình ủy quyền nước chủ nhà cho các giao dịch Điều 6
- Quy trình MRV thị trường tuân thủ (EU ETS, California Cap-and-Trade,
  RGGI, v.v.)
- Các sáng kiến toàn vẹn thị trường tự nguyện (ICVCM, VCMI)
- Đánh giá tác động khí hậu độc lập

## Tại sao bộ công cụ này tồn tại trong v0.4.0+

Đây là ví dụ thực hành thứ 7 được vận chuyển cùng myriam-kit. Bộ
công cụ tồn tại vì các thị trường tín chỉ carbon có lịch sử được ghi
chép rõ ràng về việc sửa đổi âm thầm hồi tố — các phương pháp luận
được tái diễn giải hồi tố, các kịch bản cơ sở được sửa đổi hồi tố,
các hồ sơ hoàn lại thay đổi trạng thái, và các công bố dự án lặng lẽ
loại bỏ các lưu ý bất tiện theo thời gian.

Dấu niêm phong khép lại khoảng trống *hẹp* về byte-tại-thời-điểm-chứng-thực.
Nó không giải quyết — và không thể giải quyết — các câu hỏi gây tranh
cãi lớn hơn về tính bổ sung, tính lâu dài, rò rỉ, hoặc tính xác thực
của lợi ích đi kèm. Cách bộ công cụ định khung trung thực giới hạn đó
là đặc điểm quan trọng nhất của nó.

## Giấy phép

Phạm vi công cộng (CC0). Hãy fork nó. Không yêu cầu ghi nhận.
