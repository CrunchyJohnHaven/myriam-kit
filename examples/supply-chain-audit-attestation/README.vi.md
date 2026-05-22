*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

# Bộ công cụ Niêm phong Chứng thực Kiểm toán Chuỗi Cung ứng

Một ví dụ myriam-kit chìa khóa trao tay cho các kiểm toán viên xã hội/lao
động/môi trường bên thứ ba, các nhóm tuân thủ nhà cung cấp nội bộ, các
nhà điều tra chuỗi cung ứng của các tổ chức phi chính phủ và các tổ
chức quyền của người lao động muốn công bố một con dấu chống can thiệp,
được neo vào Bitcoin của một báo cáo kiểm toán tại đúng thời điểm phê duyệt.

---

## Những gì bộ công cụ này KHÔNG làm (hãy đọc trước)

Con dấu là dấu thời gian mật mã về những gì kiểm toán viên đã phê duyệt.
Nó không thể xác minh liệu những gì được phê duyệt có **đúng** hay không.
Các phương thức thất bại sau đây nằm **ngoài phạm vi của con dấu**:

1. **Kiểm toán bị thâu tóm bởi ngành công nghiệp.** Các cuộc kiểm toán
   do thương hiệu đặt hàng có một lịch sử dài, được ghi chép về việc
   tạo ra các phát hiện nhẹ nhàng đối với các nhà cung cấp mà việc kinh
   doanh tiếp tục với thương hiệu đặt hàng giữ cho đường ống kiểm toán
   chảy. Một cuộc kiểm toán bị thâu tóm, khi được niêm phong, tạo ra
   một hồ sơ pháp y vĩnh viễn về cuộc kiểm toán bị thâu tóm. Con dấu
   không sửa chữa sự thâu tóm — nó chỉ làm cho cuộc kiểm toán-như-được-
   phát-hành trở nên bất biến, để một quá trình tìm-sự-thật sau này có
   một thứ cụ thể để so sánh.

2. **Công nhân được huấn luyện / cơ sở được chuẩn bị.** Các cuộc kiểm
   toán được thông báo hoặc bán-thông báo cho phép ban quản lý có nhiều
   ngày hoặc tuần để diễn tập các câu trả lời của công nhân, giấu công
   nhân vị thành niên, dọn dẹp ký túc xá, gỡ bỏ thiết bị không tuân
   thủ và chuyển hướng công việc cho các nhà thầu phụ không được kiểm
   toán trong cửa sổ kiểm toán. Con dấu neo những gì kiểm toán viên
   được cho xem, không phải những gì họ bị ngăn không cho xem.

3. **Hợp đồng phụ ẩn.** Hợp đồng phụ Tier-2 và Tier-3, làm việc tại nhà
   và sản xuất khu vực phi chính thức là phổ biến vô hình đối với các
   cuộc kiểm toán tại sàn nhà máy. Con dấu neo một cuộc kiểm toán Tier-1;
   nó không thể phát hiện rằng Tier-1 ký hợp đồng phụ cho một Tier-2
   không được kiểm toán trong cửa sổ kiểm toán hoặc thường xuyên.

4. **Các cuộc kiểm toán bỏ sót một cách có hệ thống sự lạm dụng mà
   chúng nhắm tới.** Rana Plaza, vụ sụp đổ nhà máy may mặc Bangladesh
   năm 2013 đã giết chết 1.134 công nhân, đã được nhiều chương trình
   kiểm toán do thương hiệu đặt hàng kiểm toán trong những tháng trước
   đó. Các vết nứt trong tòa nhà không nằm trong danh sách kiểm tra
   kiểm toán xã hội; chế độ kiểm toán không có phạm vi kỹ thuật cấu
   trúc. Các cuộc kiểm toán neo những gì *trong phạm vi*; các sự lạm
   dụng ngoài phạm vi vẫn vô hình bất kể con dấu chống can thiệp đến
   mức nào.

5. **Trả thù sau phê duyệt đối với công nhân tham gia phỏng vấn.** Ngay
   cả khi từ chối thông tin định vị (FACT 07 R3), một đối thủ quyết
   tâm biết ID nhà cung cấp có thể xác định cơ sở. Bảo vệ công nhân
   đòi hỏi nhiều hơn chỉ từ chối PII trong con dấu — nó đòi hỏi ẩn danh
   ở thượng nguồn của phương pháp kiểm toán. Con dấu làm cho cuộc kiểm
   toán-như-được-phát-hành bền vững; nó không bảo vệ những người được
   phỏng vấn một cách hồi tố.

6. **Điều kiện công nhân hợp pháp nhưng vô nhân đạo.** Khoảng cách lương
   sống ở các khu vực pháp lý nơi mức lương tối thiểu hợp pháp dưới
   mức chuẩn lương sống tạo ra các phát hiện kiểm toán "tuân thủ" đối
   với luật lương-và-giờ và các phát hiện "không tuân thủ" đối với
   các tiêu chuẩn lương sống trong cùng một cuộc kiểm toán (FACT 03
   yếu tố 8 trong bộ công cụ ví dụ này). Con dấu neo những gì mỗi tiêu
   chuẩn báo cáo; điều hòa chúng là công việc chính sách hạ nguồn.

7. **Tổn hại khí hậu / môi trường với nguyên nhân khuếch tán.** Phát
   thải carbon, đóng góp phá rừng, cạn kiệt nước và phát thải chất ô
   nhiễm từ các nhà cung cấp có thể được niêm phong trong các phát
   hiện kiểm toán, nhưng việc quy kết nguyên nhân cho khối lượng đơn
   đặt hàng của một thương hiệu cụ thể là tranh cãi về phương pháp.
   Con dấu neo những gì được đo lường tại nhà cung cấp; nó không gán
   trách nhiệm đạo đức hoặc pháp lý.

8. **Tranh chấp về tiêu chuẩn nào có thẩm quyền.** SA8000 vs. BSCI vs.
   SMETA vs. RBA VAP vs. WRAP vs. Fair Trade vs. quy tắc ứng xử cụ
   thể của công ty: mỗi tiêu chuẩn có phạm vi, mức độ nghiêm trọng và
   quy trình khắc phục khác nhau. Con dấu neo *một* cuộc kiểm toán
   theo *một* tiêu chuẩn. So sánh giữa các tiêu chuẩn là một vấn đề
   hạ nguồn.

9. **Năng lực kiểm toán viên vs. chứng chỉ kiểm toán viên.** "Được cấp
   chứng chỉ" không phải là "có năng lực". Các kiểm toán viên đã hoàn
   thành các chương trình đào tạo được công nhận đã bỏ sót các sự lạm
   dụng nghiêm trọng trong các cuộc kiểm toán trước các thảm họa có thể
   nhìn thấy công khai. Con dấu neo các chứng chỉ; nó không chứng nhận
   năng lực mà chúng được thực thi.

**Phần giới hạn-trung-thực ở trên là phần chịu lực của bộ công cụ này.**
Một thương hiệu muốn sân khấu tính hợp pháp sẽ sử dụng cuộc kiểm toán
được niêm phong như một lá chắn. Bộ công cụ phải nói rõ ràng: đây là
một *nguyên thủy không-thể-chối-bỏ cho khoảnh khắc phê duyệt báo cáo
kiểm toán*, không phải là bằng chứng về sự tuân thủ của nhà cung cấp
hoặc phúc lợi của công nhân.

---

## Những gì bộ công cụ này PHẢI TỪ CHỐI niêm phong

Bộ công cụ được cấu hình để từ chối các mẫu sự kiện sau ngay cả khi
người dùng có thẩm quyền cơ quan kiểm toán hợp lệ gửi chúng:

- **Xác định công nhân cá nhân.** Không có sự kiện nào có thể nêu tên
  một công nhân, liên kết một câu trích dẫn với một công nhân, tiết lộ
  số phù hiệu, vị trí dây chuyền, phòng ký túc xá, lịch trình ca, kết
  hợp nhân khẩu học với N<5 hoặc bất kỳ trường nào có thể tái xác định
  một người đã tham gia phỏng vấn. Trích dẫn công nhân sử dụng các
  token ngẫu nhiên; ánh xạ không bao giờ được niêm phong.
- **Người tố giác / nguồn thông tin.** Nếu một phát hiện dựa trên sự
  tiết lộ của một cá nhân đã chấp nhận rủi ro để tiết lộ, cá nhân đó
  không bao giờ được nêu tên hoặc xác định trong ấn phẩm được niêm phong.
- **Thông tin định vị chính xác.** Không có địa chỉ đường phố, GPS, hình
  ảnh vệ tinh độ phân giải >1km hoặc ảnh chụp bên ngoài tòa nhà. Quốc
  gia và khu vực là độ phân giải tối đa được niêm phong. Lý do: việc xác
  định cơ sở cho phép trả thù những người tham gia phỏng vấn.
- **Yêu cầu chứng nhận kiểm toán sạch.** Bộ công cụ từ chối niêm phong
  bất kỳ cách trình bày nào dưới dạng "cuộc kiểm toán này chứng minh
  nhà cung cấp tuân thủ" hoặc "không có vi phạm nào tồn tại". Các yêu
  cầu về tính sạch không được hỗ trợ về nhận thức luận bởi phương pháp
  kiểm toán.
- **Thay thế con-dấu-như-chứng-chỉ.** Một ấn phẩm bỏ qua phương pháp
  (FACT 04), độc lập (FACT 06) hoặc từ chối (FACT 07) không phải là
  ấn phẩm MYRIAM hợp pháp theo bộ công cụ này.
- **Bản nháp / kiểm toán trước phê duyệt.** Niêm phong xảy ra tại thời
  điểm phê duyệt, không phải trước. Các cuộc kiểm toán tạm thời tạo ra
  sự chắc chắn sai.
- **Niêm phong lại có lợi sau khi đã xảy ra.** Một cuộc kiểm toán được
  sửa đổi yêu cầu một ấn phẩm niêm phong MỚI tham chiếu đến bản gốc
  theo gốc Merkle. Cuộc kiểm toán được niêm phong ban đầu vẫn nhìn
  thấy được vĩnh viễn như cuộc kiểm toán-như-được-phát-hành.
- **Niêm phong bởi bất kỳ bên nào khác ngoài cơ quan kiểm toán.** Một
  thương hiệu, nhà cung cấp, cơ quan chứng nhận hoặc bên thứ ba không
  thể niêm phong "cuộc kiểm toán" thay cho cơ quan kiểm toán đã phê
  duyệt báo cáo.

Bản thân một sự từ chối có thể được niêm phong như một sự kiện ("Bên này
yêu cầu niêm phong X; bộ công cụ đã từ chối theo quy tắc từ chối Y"),
tạo ra một hồ sơ công khai về việc cố gắng lạm dụng. **Trong một ngành
công nghiệp có sự thâu tóm kiểm toán rộng rãi, việc từ chối niêm phong
bản thân có thể là một tín hiệu có ý nghĩa:** một cơ quan kiểm toán
không niêm phong vì một thương hiệu gây áp lực làm dịu các phát hiện
có lựa chọn ghi nhận công khai sự từ chối theo nguyên tắc của chính họ.

---

## Những gì bộ công cụ này CÓ niêm phong

8 sự kiện tại thời điểm phê duyệt kiểm toán:

1. **Thông báo ví dụ** — tuyên bố ấn phẩm là một ví dụ (các chứng thực
   thực sự loại bỏ hoặc thay thế điều này).
2. **Phạm vi và chủ thể kiểm toán** — tiêu chuẩn kiểm toán, cơ quan
   kiểm toán, kiểm toán viên dẫn đầu, quy mô đội kiểm toán, định danh
   nhà cung cấp (không có thông tin định vị chính xác), cửa sổ kiểm
   toán, loại thông báo (được thông báo / bán-thông báo / không thông
   báo), ngày báo cáo kiểm toán, phiên bản phê duyệt, các thương hiệu
   nhận có tên, bên đặt hàng.
3. **Bản kê khai phát hiện kiểm toán** — sự phù hợp theo từng yếu tố /
   NC-nhỏ / NC-lớn / NC-quan-trọng so với tiêu chuẩn, mỗi cái với một
   SHA-256 của bản viết phát hiện đầy đủ. Tổng số tích lũy. Khuyến nghị
   chứng nhận tại phê duyệt.
4. **Phương pháp và bằng chứng** — phân bổ thời gian tại chỗ, số lượng
   phỏng vấn (có phân tầng: giới tính, tình trạng di cư, thâm niên),
   phân tích định dạng phỏng vấn, mối quan hệ với phiên dịch, đánh giá
   tài liệu với kích thước mẫu và hash nội dung, các tạo vật chuyến
   thăm địa điểm (với khuôn mặt công nhân được làm mờ), các giới hạn
   phương pháp đã biết.
5. **Các hành động khắc phục đã cam kết** — mỗi NC-lớn và mỗi NC-nhỏ CAP
   với nguyên nhân gốc đã nêu, thời hạn, cơ chế xác minh, cam kết leo
   thang, cam kết không-thư-giãn-im-lặng.
6. **Trình độ và tính độc lập của kiểm toán viên** — công nhận cơ quan
   kiểm toán, tập trung khách hàng, chứng chỉ kiểm toán viên dẫn đầu và
   năng lực ngôn ngữ, kinh nghiệm ngành, các tuyên bố độc lập (kiểm
   toán viên-nhà cung cấp, kiểm toán viên-thương hiệu, tách biệt
   cơ-quan-chứng-nhận).
7. **Tiết lộ đồng hành và hồ sơ từ chối** — xung đột lợi ích (rõ ràng),
   lịch sử kiểm toán trước đó, các kênh tiếng nói công nhân được truyền
   đạt, các cuộc điều tra song song, sự bất đồng nội bộ cơ-quan-kiểm-toán,
   danh sách quy tắc từ chối, các từ chối thực sự được áp dụng trong
   cuộc kiểm toán này.
8. **Nguyên tắc ký** — cơ quan kiểm toán, kiểm toán viên dẫn đầu, đội
   kiểm toán, viên chức ủy quyền, thông tin khóa mật mã.

Mỗi sự kiện kết thúc bằng quy ước cổng-từ-chối: *"Sự kiện này chỉ khẳng
định X. Nó không khẳng định Y"* (trong đó Y là phương thức thất bại gần
nhất từ phần "KHÔNG làm").

---

## Những gì bộ công cụ này bảo vệ chống lại

- **Sự làm dịu im lặng sau phê duyệt của các sự không phù hợp lớn.** Bất
  kỳ thay đổi nào đối với FACT 03 (ví dụ: một MAJOR_NC được phân loại lại
  thành MINOR_NC hoặc một phát hiện bị xóa hoàn toàn) tạo ra một SHA-256
  khác, một gốc Merkle khác, không vượt qua xác minh OTS.
- **Đánh dấu lùi ngày đóng cửa hành động khắc phục.** FACT 05 đóng băng
  CAP và các thời hạn của nó tại thời điểm phê duyệt; bất kỳ tuyên bố nào
  "chúng tôi đã đóng NC đó tháng trước" mâu thuẫn với các thời hạn được
  niêm phong là có thể so sánh công khai.
- **Chủ nghĩa xét lại phương pháp.** FACT 04 đóng băng số lượng phỏng
  vấn, kích thước mẫu tài liệu và giờ tại chỗ tại thời điểm phê duyệt
  — ngăn chặn sự bào chữa sau này "chúng tôi đã thực hiện một cuộc điều
  tra sâu" khỏi việc không thể chứng minh sai được.
- **Tái xuất bản có chọn lọc bỏ qua các phát hiện bất lợi.** Tất cả 8 sự
  kiện được liên kết bởi một gốc Merkle duy nhất; trích dẫn một số sự
  kiện trong khi bỏ qua những sự kiện khác có thể được phát hiện từ
  danh sách lá được xuất bản.
- **Trôi dạt tuyên bố độc lập.** FACT 06 đóng băng các tuyên bố độc lập
  tại thời điểm phê duyệt. Một tuyên bố sau này "cuộc kiểm toán này độc
  lập một cách nghiêm ngặt" phải đối mặt với tỷ lệ phần trăm tập trung
  khách hàng được niêm phong và tiết lộ đặt hàng do thương hiệu trả
  được niêm phong.
- **Xóa hồ sơ từ chối.** FACT 07 đóng băng các mẫu sự kiện mà bộ công
  cụ đã từ chối; bất kỳ tuyên bố sau này "chúng tôi chưa bao giờ từ
  chối bất cứ điều gì" mâu thuẫn với hồ sơ được niêm phong.

---

## Các trường hợp lịch sử hoặc gần lịch sử mà bộ công cụ sẽ đã giúp

Bộ công cụ sẽ đã tạo ra một **mỏ neo pháp y** hữu ích — *không phải là
một sự sửa chữa hoặc ngăn chặn* — trong các trường hợp liên quan đến:

- **Rana Plaza (Bangladesh, 2013).** Sự sụp đổ tòa nhà Rana Plaza đã
  giết chết 1.134 công nhân may mặc và làm bị thương ~2.500. Nhiều
  thương hiệu có sản phẩm được sản xuất trong tòa nhà đã kiểm toán các
  nhà cung cấp Tier-1 trong tòa nhà ngay trước khi sụp đổ. Các cuộc
  kiểm toán đã sử dụng danh sách kiểm tra kiểm toán xã hội không bao
  gồm phạm vi kỹ thuật cấu trúc. Một sự kiện phương pháp được niêm
  phong (FACT 04) tại mỗi cuộc kiểm toán đó sẽ làm cho *khoảng trống
  phạm vi* hiển thị công khai tại thời điểm phê duyệt — neo giới hạn
  được ghi chép mà các chương trình kiểm toán đã hồi tố tuyên bố không
  có. Con dấu sẽ không ngăn chặn sự sụp đổ. Nó sẽ ngăn chặn tuyên bố
  của ngành công nghiệp sau sụp đổ "không ai biết" trở nên có thể bảo
  vệ về mặt nhận thức luận.

- **Các cuộc kiểm toán Apple / Foxconn (2010s).** Nhiều lần lặp lại của
  các báo cáo kiểm toán về các cơ sở Foxconn sản xuất cho Apple đã được
  xuất bản với các mức độ nghiêm trọng phát hiện, bối cảnh cụm-tự-tử-
  công-nhân và các tuyên bố khắc phục khác nhau. Một hồ sơ thời-điểm-
  phê-duyệt được niêm phong cho mỗi cuộc kiểm toán sẽ ngăn chặn các
  tranh chấp sau này về "cuộc kiểm toán nói gì vào thời điểm đó" khỏi
  phụ thuộc vào các bản sao lưu trữ, các bản sao bị rò rỉ hoặc các bản
  phát hành chính thức được sửa đổi.

- **Cobalt từ DRC (đang tiếp tục).** Khai thác cobalt thủ công ở Cộng
  hòa Dân chủ Congo, bao gồm cả của trẻ em, cung cấp vào chuỗi cung
  ứng pin cho các thương hiệu điện tử và EV lớn. Nhiều cuộc kiểm toán
  do thương hiệu đặt hàng trong giai đoạn 2017-hiện tại đã tạo ra các
  phát hiện ở mức độ nghiêm trọng khác nhau. Bộ công cụ áp dụng cho mỗi
  cuộc kiểm toán tại thời điểm phê duyệt sẽ đã neo cuộc kiểm toán-như-
  được-phát-hành; bộ công cụ áp dụng cho các sự kiện tiết lộ đồng hành
  (FACT 07 C2: lịch sử kiểm toán trước đó) sẽ đã làm cho việc thừa kế
  phương pháp các khoảng trống trước đây của mỗi kiểm toán viên kế tiếp
  hiển thị công khai.

- **Khoáng sản xung đột (thiếc, tantali, vonfram, vàng từ DRC và khu
  vực Đại Hồ).** Dodd-Frank §1502 đã tạo ra các nghĩa vụ kiểm toán-và-
  tiết lộ theo quy tắc SEC 13p-1. Các tranh chấp về tính đầy đủ của các
  cuộc kiểm toán cấp nhà máy luyện kim và xác minh chuỗi giám sát hạ
  nguồn đã tái diễn trong giai đoạn 2014-2022. Các con dấu MYRIAM theo
  từng cuộc kiểm toán sẽ đã neo mỗi cuộc kiểm toán nhà máy luyện kim
  tại thời điểm phê duyệt.

- **Các cuộc kiểm toán do thương hiệu đặt hàng đối với chuỗi cung ứng
  bông Tân Cương (2018-hiện tại).** Các tranh chấp về liệu các cuộc
  kiểm toán có thể được thực hiện một cách đáng tin cậy theo các hạn
  chế của chính phủ CHND Trung Hoa đối với quyền truy cập của kiểm toán
  viên hay không đã nổi lên rộng rãi sau năm 2020. Một sự kiện phương
  pháp được niêm phong (FACT 04) tại mỗi cuộc kiểm toán sẽ đã neo các
  điều kiện truy cập nào thực sự áp dụng — làm cho các tuyên bố sau này
  "chúng tôi đã thực hiện một cuộc kiểm toán nghiêm ngặt" có thể so
  sánh với các ràng buộc phương pháp được niêm phong vào thời điểm đó.

- **Hợp đồng phụ Foxconn và các báo cáo trách nhiệm nhà cung cấp của
  Apple trong những năm 2010 — các phát hiện tái diễn về công nhân vị
  thành niên, ký túc xá ẩn, vi phạm giờ làm việc.** Các con dấu theo
  từng cuộc kiểm toán sẽ đã neo các *phát hiện tiêu cực* trong các cuộc
  kiểm toán không tìm thấy gì, cùng với các *phát hiện tích cực* trong
  các cuộc kiểm toán đã tìm thấy vi phạm — ngăn chặn việc chọn lọc tường
  thuật hồi tố từ bất kỳ hướng nào.

Bộ công cụ sẽ KHÔNG ngăn chặn bất kỳ trường hợp nào trong số này. Trong
một số trường hợp, vấn đề cơ bản là cuộc kiểm toán *đã bỏ sót* sự lạm
dụng — niêm phong một cuộc kiểm toán sạch lẽ ra phải tìm thấy vi phạm
tạo ra một hồ sơ vĩnh viễn về một cuộc kiểm toán thất bại, đó là một
loại hữu ích khác (nó neo sự thất bại cho trách nhiệm sau này) nhưng
không giống như sự ngăn chặn.

---

## Khi nào sử dụng bộ công cụ này

- Bạn là một cơ quan kiểm toán áp dụng thực hành "xuất bản những gì
  chúng tôi đã phê duyệt" như một sự bảo vệ chống lại áp lực làm dịu
  sau phê duyệt.
- Bạn là một tổ chức phi chính phủ đang điều hành một cuộc điều tra
  chuỗi cung ứng song song và muốn có một điểm tham chiếu chống can
  thiệp tại thời điểm cuộc điều tra của bạn kết thúc.
- Bạn là một tổ chức quyền của người lao động đã có được một báo cáo
  kiểm toán và muốn neo nội dung hiện tại của nó trước khi cơ quan
  kiểm toán hoặc thương hiệu có cơ hội sửa đổi nó.
- Bạn là một thương hiệu cam kết minh bạch về các cuộc kiểm toán bạn
  đã đặt hàng và bạn muốn có một hồ sơ pháp y có thể xác minh.
- Bạn là một nhà báo, cơ quan quản lý hoặc tòa án neo nội dung của một
  cuộc kiểm toán cụ thể tại một thời điểm cụ thể cho việc kiện tụng
  hoặc báo cáo sau này.

## Khi nào KHÔNG sử dụng bộ công cụ này

- **Không sử dụng làm thay thế cho giám sát do công nhân dẫn dắt, các
  cuộc điều tra độc lập của tổ chức phi chính phủ hoặc tổ chức công
  nhân.** Bộ công cụ là *bổ sung*, không phải là sự thay thế cho bất
  kỳ điều nào trong số đó.
- **Không sử dụng để tuyên bố một nhà cung cấp tuân thủ.** Một cuộc
  kiểm toán sạch được niêm phong tốt nhất là một đầu vào cho đánh giá
  tuân thủ. Xử lý một cuộc kiểm toán được niêm phong như một chứng chỉ
  tuân thủ chính xác là sân khấu tính hợp pháp mà các quy tắc từ chối
  ưu tiên ràng buộc tồn tại để ngăn chặn.
- **Không sử dụng giữa quá trình kiểm toán.** Niêm phong trước phê
  duyệt tạo ra một hồ sơ dương-tính-giả "đây là báo cáo kiểm toán cuối
  cùng".
- **Không sử dụng để niêm phong một bản nháp bạn dự định sửa đổi.** Mỗi
  phiên bản phê duyệt nhận con dấu riêng của nó; các bản sửa đổi tham
  chiếu đến các bản gốc theo gốc Merkle.
- **Không sử dụng dưới áp lực để niêm phong sớm hơn phê duyệt hoặc bỏ
  qua tiết lộ sự kiện đồng hành.** Từ chối và (nếu nguyên tắc của bạn
  cho phép) niêm phong sự từ chối.
- **Không sử dụng làm cơ sở cho tuyên bố tiếp thị "thương mại công
  bằng" hoặc "tìm nguồn cung ứng đạo đức" mà không tiết lộ các giới
  hạn phương pháp được niêm phong cùng với con dấu.** Trích dẫn con
  dấu mà không trích dẫn các giới hạn là phương thức thất bại sân-khấu-
  tính-hợp-pháp định nghĩa sự thâu tóm kiểm toán.
- **Không sử dụng nếu cơ quan kiểm toán của bạn bị thâu tóm về mặt cấu
  trúc và không thể xuất bản các phát hiện trái với lợi ích thương mại
  của thương hiệu đặt hàng.** Trong trường hợp đó, việc niêm phong tạo
  ra một hồ sơ công khai vĩnh viễn về cuộc kiểm toán bị thâu tóm. Điều
  đó có thể vẫn có giá trị — nhưng không giống như việc bảo vệ chống
  lại sự thâu tóm.

---

## Cách fork bộ công cụ này cho một cuộc kiểm toán thực sự

```bash
cp -r ~/Genesis/myriam-kit/examples/supply-chain-audit-attestation ~/audit-FCA-XXXX
cd ~/audit-FCA-XXXX
$EDITOR facts/*.txt       # replace fictional content with real
bash build/seal.sh        # SEAL AT sign-off, not before, not after
python3 build/verify.py   # confirm
```

**Thời điểm quan trọng:** niêm phong TẠI thời điểm phê duyệt — tức là,
khi kiểm toán viên dẫn đầu ký báo cáo cuối cùng và nó trở thành vị trí
chính thức của cơ quan kiểm toán. Một con dấu trước phê duyệt tạo ra
một hồ sơ dương-tính-giả "đây là cuộc kiểm toán cuối cùng". Một con
dấu lâu sau phê duyệt yếu hơn về mặt pháp y đối với các sửa đổi xen kẽ.

---

## Tích hợp với cơ sở hạ tầng kiểm toán chuỗi cung ứng hiện có

Bộ công cụ được thiết kế để soạn với, không thay thế:

- **SA8000 (Social Accountability International).** Các báo cáo kiểm
  toán SA8000 và các tài liệu CAP ánh xạ tự nhiên đến FACT 03 + FACT 05.
  Tham chiếu công nhận SAAS phù hợp với FACT 06.
- **RBA VAP (Responsible Business Alliance Validated Assessment Program).**
  Các phát hiện kiểm toán của RBA ánh xạ đến FACT 03; các quy tắc độc
  lập của công ty kiểm toán RBA ánh xạ đến FACT 06.
- **SMETA (Sedex Members Ethical Trade Audit).** Các phát hiện kiểm
  toán 2-trụ và 4-trụ của SMETA ánh xạ đến FACT 03; nền tảng Sedex
  lưu trữ báo cáo thô — con dấu MYRIAM neo một hash nội dung của báo
  cáo được lưu trữ trên nền tảng.
- **amfori BSCI.** Cơ chế xếp hạng BSCI A-E ánh xạ đến khuyến nghị
  chứng nhận FACT 03; đặt hàng tư cách thành viên thương hiệu ánh xạ
  đến tiết lộ tập trung khách hàng FACT 06 và FACT 07 C1.
- **FSC chuỗi giám sát.** Đối với chuỗi cung ứng sản phẩm rừng, các
  chứng chỉ chuỗi giám sát và lịch trình kiểm toán lại phù hợp với
  cấu trúc cửa sổ kiểm toán và CAP.
- **B Lab / B Corp đánh giá tác động.** Chứng nhận B Corp không phải
  là một cuộc kiểm toán bên thứ ba theo nghĩa SA8000, nhưng các báo
  cáo người xác minh đánh giá tác động có thể được niêm phong theo bộ
  công cụ này (với các sự kiện được điều chỉnh lại phạm vi để đánh
  giá tác động thay vì kiểm toán lao động).
- **ISO 26000.** ISO 26000 là hướng dẫn, không thể chứng nhận; bộ công
  cụ không có tích hợp báo cáo kiểm toán ISO 26000 trực tiếp nhưng phân
  loại trách nhiệm xã hội có thể thông báo cấu trúc yếu tố FACT 03
  cho các cuộc kiểm toán nội bộ.
- **IPC (Institute of Public Affairs / ICTI Ethical Toy Program / các
  chế độ ngành-công-nghiệp khác).** Các chương trình kiểm toán dành
  riêng cho ngành có thể được niêm phong theo bộ công cụ này; trường
  tiêu chuẩn kiểm toán FACT 02 xác định cái nào.
- **Fair Labor Association.** Các báo cáo giám sát nhà máy FLA ánh xạ
  đến FACT 03 + FACT 05; khung giám sát viên độc lập của FLA ánh xạ
  đến các tuyên bố độc lập FACT 06.
- **Higg Index (Sustainable Apparel Coalition).** Các đầu ra Higg FEM
  (Facility Environmental Module) và Higg FSLM (Facility Social & Labor
  Module) cấp cơ sở có thể được niêm phong theo bộ công cụ này.
- **EU CSRD / CSDDD.** Chỉ thị Báo cáo Bền vững Doanh nghiệp của EU và
  Chỉ thị Thẩm định Bền vững Doanh nghiệp tạo ra các nghĩa vụ tiết lộ
  có các tài liệu xác minh có thể được niêm phong theo bộ công cụ này.
  Bộ công cụ neo tiết lộ-như-được-phát-hành, không phải tính đầy đủ
  thực chất của nó.

## Những gì bộ công cụ này KHÔNG thay thế

- Giám sát do công nhân dẫn dắt (tín hiệu phát hiện lạm dụng đáng tin
  cậy nhất trong bất kỳ chuỗi cung ứng nào)
- Các cuộc điều tra độc lập của tổ chức phi chính phủ (CCC, Labour
  Behind the Label, China Labour Bulletin, Workers' Rights Consortium,
  v.v.)
- Thanh tra quy định (các văn phòng lao động quốc gia, các cơ quan
  tương đương OSHA, các chương trình Văn phòng Quốc gia ILO)
- Tổ chức công nhân và đàm phán tập thể
- Kiện tụng, trọng tài và khắc phục theo luật lao động trong nước
- Các khung thẩm định bên thương hiệu (UNGP, OECD Due Diligence Guidance,
  EU CSDDD)

## Giấy phép

Phạm vi công cộng (CC0). Fork nó. Không yêu cầu ghi công.
