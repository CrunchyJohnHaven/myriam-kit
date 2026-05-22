*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

# Bộ niêm phong gứng nhận chi tiêu công

Một ví dụ myriam-kit sẵn sàng dùng dành cho các chính phủ thành phố,
tiểu bang, tỉnh và quốc gia muốn neo bằng mật mã các bản ghi thực
hiện ngân sách (trao hợp đồng, giải ngân, chấp nhận hạng mục bàn
giao) tại thời điểm phát hành, để việc chỉnh sửa hồi tố trong im
lặng các bản ghi chi tiêu công có thể bị phát hiện công khai.

Con dấu là một **mỏ neo pháp y**, không phải chứng nhận tính toàn
vẹn. Nó ghi lại những gì cơ quan tài chính đã báo cáo vào ngày nó
được báo cáo, dưới dạng không thể được sửa đổi âm thầm sau đó mà
không tạo ra một sự khác biệt mật mã hiển thị công khai.

---

## Bộ này **không** làm gì (đọc trước)

Con dấu là một dấu thời gian mật mã của những gì đã được chứng nhận.
Nó không thể xác minh liệu những gì được chứng nhận có **hợp pháp,
công bằng, hoặc trung thực** hay không. Các chế độ thất bại sau đây
**nằm ngoài phạm vi của con dấu**:

1. **Tham nhũng và hối lộ ở thượng nguồn.** Nếu một quy trình mua
   sắm bị thao túng, một nhà cung cấp được chọn vì hối lộ, một lý
   do biện minh nguồn duy nhất bị bịa đặt, hoặc một hợp đồng bị thổi
   phồng bởi một tỷ lệ hối lộ đã thỏa thuận — con dấu neo giao dịch
   đã ghi lại với giá bị thổi phồng và nhà cung cấp được ưu ái với
   tính toàn vẹn cao. Con dấu quan sát đầu ra của hệ thống tài
   chính; nó không có khả năng nhìn vào tham nhũng ở thượng nguồn
   của việc phát hành. *Operação Lava Jato* của Brazil đã ghi lại
   các khoản hối lộ ~3% được kiểm soát bởi cartel trên hàng ngàn
   hợp đồng Petrobras, mà sẽ được niêm phong tại thời điểm phát hành
   như thể hoàn toàn bình thường.

2. **Che giấu quyền sở hữu thụ hưởng qua các công ty bình phong.**
   Một hợp đồng được trao cho "Acme Construction Ltd." được niêm
   phong với tên thực thể trong sổ đăng ký công khai. Nếu "Acme"
   thực tế được kiểm soát bởi một người có liên quan chính trị chưa
   được tiết lộ, hoặc là một trong hàng chục công ty bình phong
   được kiểm soát bởi một cartel duy nhất, con dấu neo thực thể bề
   mặt. Minh bạch quyền sở hữu thụ hưởng là một chế độ RIÊNG BIỆT
   (Khuyến nghị 24 của FATF, 5AMLD/6AMLD của EU, Đạo luật Minh bạch
   Doanh nghiệp của Hoa Kỳ) có đầu ra cần giao thức niêm phong
   riêng.

3. **Gian lận kế toán ở thượng nguồn của việc phát hành.** Nếu chính
   cơ quan tài chính bịa đặt bản ghi trước khi nó được niêm phong
   — hợp đồng ma, nhân viên ma trong bảng lương, các chấp nhận giao
   hàng hư cấu — con dấu neo sự bịa đặt. Con dấu không thể phát hiện
   rằng bản ghi là sai tại thời điểm nó được ghi lại; nó chỉ có thể
   phát hiện rằng bản ghi đã bị thay đổi SAU khi niêm phong.

4. **Xuất bản có chọn lọc / chọn lọc cherry-picking.** Một cơ quan
   tài chính có thể xuất bản một *tập con* của các giao dịch — những
   cái sạch sẽ — và chỉ niêm phong những cái đó. Con dấu neo những
   gì có trong xuất bản; nó không neo vũ trụ của các giao dịch lẽ
   ra phải có trong xuất bản. FACT 07 của bộ này (các tiết lộ đồng
   hành và bản ghi từ chối) là phòng vệ cấu trúc, nhưng nó phụ
   thuộc vào việc cơ quan phát hành trung thực về những gì họ chọn
   không niêm phong.

5. **Chi tiêu ngoài sổ sách hoặc ngoài ngân sách.** Chi tiêu công
   được chuyển qua các doanh nghiệp nhà nước, quỹ tài sản chủ
   quyền, phương tiện mục đích đặc biệt, hoặc các tài khoản tín
   thác ngoài ngân sách có thể không xuất hiện trong ngân sách mà
   con dấu neo. Con dấu ghi lại những gì được báo cáo bên trong hệ
   thống ngân sách; chi tiêu bên ngoài hệ thống nằm ngoài phạm vi
   của con dấu. Các tranh chấp về Cơ quan Liên minh Lâm thời Iraq
   (CPA) 2003–2004 liên quan đến khoảng 9 tỷ USD giải ngân tiền
   mặt mà bản ghi bị mất một phần; việc niêm phong những gì còn
   lại của bản ghi tại thời điểm giải ngân sẽ neo chúng, nhưng
   không tạo ra các bản ghi mà CPA đã không duy trì.

6. **Áp lực "giải thích" sau khi phát hành.** Một khoản vượt chi
   được niêm phong, một nguồn duy nhất được niêm phong, hoặc một
   lệnh thay đổi được niêm phong có thể được thuật lại sau đó với
   bất kỳ khuôn khổ nào mà quyền lực chính trị mong muốn. Con dấu
   neo các SỰ KIỆN tại ngày phát hành, nhưng không phán xét trước
   câu chuyện mà những sự kiện đó sẽ ủng hộ sau này.

7. **Chứng thực bị cưỡng ép.** Nếu hiệu trưởng tài chính chịu trách
   nhiệm bị cưỡng ép ký một chứng thực đại diện sai cho các giao
   dịch, con dấu neo chứng thực bị cưỡng ép với chữ ký bị cưỡng ép.
   Con dấu xác minh AI đã ký (FACT 08), không phải TẠI SAO họ ký.
   Việc niêm phong một chứng thực bị cưỡng ép tạo ra một bản ghi
   công khai vĩnh viễn về đầu ra bị cưỡng ép — hữu ích cho việc
   chịu trách nhiệm sau này, nhưng không phải là phòng thủ chống
   lại sự cưỡng ép trong khoảnh khắc.

8. **So sánh giữa các khu vực pháp lý.** Một chi tiêu được niêm
   phong chỉ có thể đọc được trong khuôn khổ chế độ pháp lý của khu
   vực pháp lý phát hành. "Tại sao Thành phố X trả Y cho dịch vụ Z
   trong khi Thành phố W chỉ trả V?" là một câu hỏi phân tích so
   sánh xuống dòng của việc niêm phong. Đánh giá so sánh giữa các
   khu vực pháp lý là một nhiệm vụ phân tích trên dữ liệu được niêm
   phong, không phải là một thuộc tính của con dấu.

**Phần giới hạn-trung thực ở trên là phần chịu lực của bộ này.** Các
quan chức tài chính và chính trị gia tin rằng niêm phong bằng tính
toàn vẹn sẽ sử dụng bộ này như một lá chắn. Bộ phải nói thẳng: đây
là một *bộ nguyên thủy không-thể-chối-bỏ cho thời điểm phát hành*,
không phải bằng chứng về tính toàn vẹn của chi tiêu.

---

## Bộ này phải **từ chối** niêm phong những gì

Bộ được cấu hình để từ chối các mẫu sự kiện sau ngay cả khi người
dùng có quyền ký hợp lệ gửi chúng:

- **Tên cá nhân nhân viên chính phủ dưới cấp ký chính.** Không có
  sự kiện nào được nêu tên cá nhân nhân viên phòng mua sắm, thư ký
  ngân khố cá nhân, thành viên hội đồng chấm điểm cá nhân, hoặc bất
  kỳ cá nhân tự nhiên nào không ở vai trò trách nhiệm công khai.
  Rủi ro phơi bày đến trả thù đối với nhân viên tuyến đầu vượt quá
  lợi ích minh bạch; danh tính của họ được niêm phong trong kiểm
  soát nội bộ (hash của nhật ký phê duyệt FACT 05), không phải
  trong nội dung của chứng thực.

- **PII của nhà cung cấp.** Không có sự kiện nào được bao gồm số tài
  khoản ngân hàng của nhà cung cấp, tên nhân viên cá nhân của nhà
  cung cấp, địa chỉ nhà của nhà cung cấp, số ID thuế của nhà cung
  cấp của cá nhân tự nhiên, phân tích định giá nội bộ chứa cấu trúc
  chi phí của nhà cung cấp, hoặc bất kỳ trường PII thương mại nào
  khác mà việc xuất bản gây tổn hại đến lợi ích nhà cung cấp mà
  không phục vụ chống tham nhũng. Những thông tin đó có thể được
  HASHED (FACT 05) nhưng không được xuất bản.

- **Chi tiêu được phân loại bí mật an ninh.** Chi tiêu được phân
  loại theo các đạo luật an ninh quốc gia KHÔNG đủ điều kiện để
  niêm phong dưới bộ này. Xử lý phân loại là một vấn đề khác với
  các yêu cầu mật mã và pháp lý khác. Bản thân việc loại trừ được
  tiết lộ trong FACT 07 R3 để người đọc biết rằng việc xuất bản
  có chủ ý là một phần.

- **Thực thi dân sự nghĩa vụ thuế đối với các cá nhân tự nhiên đã
  xác định.** Mặc dù chi phí thực thi là chi tiêu công, việc nêu
  tên người nộp thuế cá nhân dưới thực thi bị từ chối: tổn hại
  riêng tư vượt quá lợi ích minh bạch, và sự minh bạch song song
  tồn tại theo báo cáo tòa án thuế.

- **Giao dịch trước khi phát hành.** Không có hợp đồng trước khi
  trao chính thức; không có giải ngân trước khi phát hành chính
  thức. Niêm phong một hợp đồng dự thảo hoặc một khoản thanh toán
  đang chờ xử lý như thể nó đã được thực hiện tạo ra sự chắc chắn
  giả.

- **Niêm phong bởi bất kỳ ai khác ngoài hiệu trưởng tài chính chịu
  trách nhiệm.** Một nhà thầu, nhà cung cấp, thành viên hội đồng,
  nhà báo, hoặc người quan sát không thể niêm phong "bản ghi chi
  tiêu công" thay cho cơ quan tài chính đã phát hành nó. (Họ có
  thể niêm phong quan sát của riêng họ dưới hiệu trưởng riêng của
  họ, trong một xuất bản riêng biệt.)

- **Các khuôn khổ "không có tham nhũng".** Bộ từ chối niêm phong
  bất kỳ khuôn khổ nào dưới dạng "chi tiêu này hợp pháp và không có
  tham nhũng" hoặc "việc mua sắm rõ ràng công bằng". Các tuyên bố
  như vậy về mặt nhận thức học vượt ra ngoài phạm vi của bộ.

- **Các xuất bản bỏ qua tiết lộ đồng hành FACT 07.** Một xuất bản
  các giao dịch mà không có hồ sơ tiết lộ và từ chối đi kèm không
  phải là một xuất bản MYRIAM hợp pháp dưới bộ này.

Một sự từ chối bản thân nó có thể được niêm phong như một sự kiện
("Bên này yêu cầu niêm phong X; bộ đã từ chối theo quy tắc từ chối
Y"), tạo ra một bản ghi công khai về việc cố gắng lạm dụng. Trong
một lĩnh vực mà áp lực chính trị lên các quan chức tài chính được
ghi lại, một bản ghi về các yêu cầu *bị từ chối* tự nó là một tín
hiệu về tính toàn vẹn.

---

## Bộ này **niêm phong** những gì

8 sự kiện tại thời điểm chứng thực thực hiện ngân sách:

1. **Thông báo ví dụ** — tuyên bố xuất bản là một ví dụ (chứng thực
   thực sự loại bỏ hoặc thay thế cái này).
2. **Khu vực pháp lý và cơ sở pháp lý** — thực thể chính phủ nào
   đang phát hành, theo quyền hạn theo luật định nào, trong kỳ tài
   chính nào.
3. **Tham chiếu phân bổ hoặc ngân sách** — các dòng cụ thể trong
   ngân sách đã được thông qua đang được thực hiện, với các hash
   của công cụ ngân sách và bất kỳ sửa đổi / chuyển khoản / lập
   trình lại nào được áp dụng.
4. **Bản kê hợp đồng hoặc giải ngân** — bản ghi cho mỗi giao dịch:
   số tiền, tên thực thể pháp lý của nhà cung cấp (không có PII cá
   nhân), mục đích, ngày, loại mua sắm, cơ sở trao thưởng, hash tài
   liệu hợp đồng.
5. **Hash tài liệu hỗ trợ** — SHA-256 của các thư mời thầu, đánh
   giá, hợp đồng đã thực hiện, lệnh thay đổi, đơn xin thanh toán,
   biểu mẫu chấp nhận hạng mục bàn giao, các mục nhập sổ cái ngân
   khố, nhật ký phê duyệt kiểm soát. Chỉ hash, không phải nội dung
   — để bảo vệ PII thương mại và cá nhân trong khi cho phép xác
   minh hash-lại.
6. **Trạng thái kiểm toán và giám sát** — cơ quan tổng thanh tra
   nào có thẩm quyền, cơ quan kiểm toán tối cao nào, cơ quan công
   tố nào có thẩm quyền tội phạm tham nhũng, hạn chót kiểm toán,
   trạng thái hiện tại của bất kỳ đánh giá đang diễn ra nào.
7. **Tiết lộ đồng hành và bản ghi từ chối** — các phản đối mua sắm
   đang chờ xử lý, các cuộc điều tra nội bộ đang chờ xử lý, các
   yêu cầu FOI còn tồn đọng, các đánh giá bất đồng, các khoản vượt
   chi đường-ngân sách đã biết; danh sách rõ ràng các mẫu mà bộ đã
   từ chối niêm phong.
8. **Hiệu trưởng ký** — quan chức tài chính chịu trách nhiệm + vai
   trò + trách nhiệm theo luật định + những người đồng ký dưới kiểm
   soát kép; mỗi người ký đang và không đang chứng thực cá nhân
   những gì.

Mỗi sự kiện kết thúc với quy ước cửa-từ chối: *"Sự kiện này chỉ
khẳng định X. Nó không khẳng định Y"* (trong đó Y là chế độ thất
bại gần nhất từ phần "KHÔNG làm").

---

## Bộ này phòng vệ chống lại điều gì

- **Sửa đổi âm thầm sau khi phát hành số tiền hợp đồng.** Bất kỳ
  thay đổi nào đối với bất kỳ số tiền nào trong FACT 04 đều tạo ra
  SHA-256 khác, Merkle root khác, không vượt qua xác minh OTS.
- **Thay thế nhà cung cấp âm thầm.** Việc thay thế "Nhà cung cấp A"
  bằng "Nhà cung cấp B" trên một hợp đồng đã phát hành có thể được
  phát hiện từ các byte đã niêm phong.
- **Lùi ngày lệnh thay đổi.** FACT 04 đóng băng ngày và lý do lệnh
  thay đổi tại thời điểm phát hành; bất kỳ tuyên bố sau này nào
  rằng "đây luôn là phạm vi đã thỏa thuận" phải đối phó với bản
  ghi lệnh thay đổi đã niêm phong.
- **Sự biến mất âm thầm của các giao dịch bất lợi.** Tất cả các
  giao dịch được phát hành trong kỳ đều ở trong FACT 04 dưới một
  Merkle root. Việc xuất bản một tập con có thể được phát hiện từ
  danh sách hash lá.
- **Đàn áp tiết lộ đồng hành.** FACT 07 đóng băng trạng thái phản
  đối đang chờ xử lý, điều tra đang chờ xử lý và FOI còn tồn đọng
  tại thời điểm chứng thực. Bất kỳ tuyên bố sau này nào "chúng tôi
  chưa bao giờ nghe về phản đối đó" đều có thể diff công khai.
- **Lệch lạc thẩm quyền kiểm toán.** FACT 06 đóng băng các cơ quan
  nào có thẩm quyền giám sát đối với các giao dịch đã niêm phong.
  Một tuyên bố sau này rằng một IG cụ thể "không có thẩm quyền"
  phải đối phó với bản ghi thẩm quyền đã niêm phong.
- **Xóa bản ghi từ chối.** FACT 07 ghi lại những gì bộ đã từ chối
  niêm phong; bất kỳ tuyên bố sau này nào "chúng tôi chưa bao giờ
  từ chối bất cứ điều gì" đều mâu thuẫn với bản ghi đã niêm phong.

---

## Các trường hợp lịch sử mà bộ này sẽ giúp được

Bộ này sẽ tạo ra một **mỏ neo pháp y** hữu ích — *không phải sự sửa
chữa, không phải sự phòng ngừa, không phải sự thay thế cho việc
truy tố hình sự* — trong các trường hợp được ghi lại công khai liên
quan đến việc chỉnh sửa hồi tố trong im lặng các bản ghi chi tiêu
công:

- **Brazil — dòng dõi *Operação Lava Jato* / Petrobras (2014–2021).**
  Các công tố viên liên bang Brazil đã ghi lại một cartel các công
  ty xây dựng lớn trong hơn một thập kỷ đã trả các khoản hối lộ
  trung bình ~3% trên các hợp đồng cơ sở hạ tầng Petrobras và liên
  bang khác, với khoản hối lộ được chuyển cho các chính trị gia và
  cho việc phối hợp giá riêng của cartel. Các hợp đồng khi được phát
  hành trông có vẻ bình thường; tham nhũng ở thượng nguồn của việc
  phát hành. Một bộ niêm phong KHÔNG ngăn chặn được Lava Jato (các
  khoản hối lộ đã được nhúng vào giá TRƯỚC khi hợp đồng đến với con
  dấu), nhưng sẽ neo các điều khoản hợp đồng tại thời điểm phát
  hành — làm cho việc tái dựng pháp y sau này về "những gì mỗi hợp
  đồng thực sự nói khi nó được ký" rẻ hơn rất nhiều. Chi phí điều
  tra của Lava Jato phần lớn là chi phí tập hợp lại các dòng thời
  gian từ các bản ghi lưu trữ không nhất quán.

- **Liên minh châu Âu — các tranh chấp quỹ phát triển khu vực (nhiều
  quốc gia thành viên, các năm 2010–2020).** Các báo cáo hàng năm
  của Tòa án Kiểm toán châu Âu liên tục xác định các tỷ lệ lỗi vật
  chất trong các chi tiêu Quỹ Cấu trúc và Đầu tư châu Âu (ESIF) và
  Quỹ Đoàn kết, trong một số năm vượt quá ngưỡng vật chất. Các
  tranh chấp về "những gì thực sự được tuyên bố" so với "những gì
  thực sự được giao" lặp lại vì tài liệu yêu cầu có thể được sửa
  đổi giữa nộp và kiểm toán. Việc niêm phong MYRIAM theo từng phát
  hành của yêu cầu-khi-nộp sẽ neo nội dung của mỗi yêu cầu khi nộp,
  tách biệt "những gì người thụ hưởng đã tuyên bố vào thời điểm
  đó" khỏi "những gì việc tái dựng sau kiểm toán kết luận".

- **Iraq — các khoản giải ngân của Cơ quan Liên minh Lâm thời (CPA),
  2003–2004.** CPA đã giải ngân khoảng 9 tỷ USD tiền mặt từ Quỹ
  Phát triển Iraq với tài liệu mà Tổng Thanh tra Đặc biệt về Tái
  thiết Iraq (SIGIR) và các báo cáo kiểm toán sau này đặc trưng là
  không đầy đủ đáng kể. Các tranh chấp về bản ghi giải ngân vẫn
  tiếp tục hai thập kỷ sau đó. Việc niêm phong tại thời điểm giải
  ngân sẽ không tạo ra các bản ghi mà CPA không duy trì — nhưng
  ở bất cứ nơi nào có bất kỳ bản ghi nào tồn tại (sổ cái viết tay,
  ủy quyền chuyển khoản có ghi ngày), một con dấu đương thời sẽ
  neo trạng thái byte-bộ của bản ghi đó tại thời điểm phát hành,
  tách biệt "bản ghi vào thời điểm đó" khỏi "bản ghi như được tái
  dựng sau này".

- **Hy Lạp — các sửa đổi báo cáo nợ chủ quyền và chi tiêu công
  (2009–2010).** Các cuộc kiểm toán Eurostat năm 2009–2010 đã ghi
  lại các sửa đổi đáng kể đối với dữ liệu tài chính Hy Lạp được báo
  cáo trước đó, với phương pháp luận sửa đổi tự nó bị tranh chấp.
  Việc niêm phong các báo cáo chi tiêu hàng quý tại thời điểm xuất
  bản ban đầu sẽ làm cho *delta* giữa các báo cáo ban đầu và sửa
  đổi có thể diff công khai thay vì chỉ có thể tái dựng thông qua
  so sánh kho lưu trữ. Con dấu sẽ không ngăn chặn được tranh chấp
  phương pháp luận cơ bản, nhưng sẽ neo mỗi quý được báo cáo tại
  thời điểm báo cáo ban đầu.

- **Vương quốc Anh — mua sắm đại dịch (2020–2022).** Các báo cáo
  của Văn phòng Kiểm toán Quốc gia Vương quốc Anh và ủy ban quốc
  hội đã xác định các quy trình mua sắm trong năm 2020–2021 trong
  đó các hợp đồng được trao theo các quy định khẩn cấp với sự cạnh
  tranh giảm và tài liệu giảm; một số trao thưởng sau đó đã được
  sửa đổi, hủy bỏ, hoặc giải quyết. Việc niêm phong theo từng phát
  hành cho mỗi trao thưởng mua sắm khẩn cấp sẽ neo lý do và điều
  khoản trao thưởng tại thời điểm trao thưởng, làm cho các sửa
  đổi sau này là một delta hiển thị công khai thay vì một bản ghi
  bị sửa đổi âm thầm.

- **Nam Phi — các hợp đồng doanh nghiệp công của thời kỳ chiếm
  đoạt nhà nước (~2010–2018).** Ủy ban Zondo đã ghi lại các hợp
  đồng tại một số doanh nghiệp nhà nước (Eskom, Transnet, Denel)
  có tài liệu khác nhau là không đầy đủ, được sửa đổi, hoặc bị
  tranh chấp. Việc niêm phong mỗi trao thưởng hợp đồng tại thời
  điểm phát hành sẽ neo trạng thái như-được-trao của bản ghi, tách
  biệt các đầu ra tái dựng pháp y sau này khỏi bản ghi đương thời.

Bộ sẽ KHÔNG ngăn chặn được tham nhũng cơ bản trong bất kỳ trường
hợp nào ở trên. Trong một số trường hợp, vấn đề cơ bản là tham
nhũng nằm *ở thượng nguồn của việc phát hành* — con dấu neo hợp
đồng tham nhũng với tính toàn vẹn cao, đó là một loại hữu ích khác
(mỏ neo pháp y cho trách nhiệm sau này) nhưng không giống như sự
phòng ngừa. Trong các trường hợp khác (tiền mặt CPA, chi tiêu ngoài
ngân sách), vấn đề cơ bản là các bản ghi đang được niêm phong không
tồn tại hoặc không được duy trì — bộ không thể tạo ra các bản ghi
mà cơ quan không sản xuất.

Các trường hợp lịch sử này chỉ được nêu tên với tham chiếu đến các
phát hiện được ghi lại công khai (hồ sơ tòa án, báo cáo ủy ban quốc
hội, ấn phẩm cơ quan kiểm toán). Không có tuyên bố nào về bất kỳ
cá nhân nào; các phát hiện thể chế được ghi lại đứng trên hồ sơ
công khai.

---

## Khi nào sử dụng bộ này

- Khu vực pháp lý của bạn có quy trình báo cáo thực hiện ngân sách
  đã được thiết lập và muốn thêm một mỏ neo công khai bất biến.
- Bạn mong đợi sự xem xét sau khi phát hành (yêu cầu FOI, kiểm toán,
  giám sát xã hội dân sự, điều tra báo chí) và muốn một điểm tham
  chiếu có thể phát hiện dấu hiệu giả mạo.
- Bạn có thẩm quyền pháp lý theo luật minh bạch / hồ sơ công khai
  để xuất bản tập sự kiện đã liệt kê, với các loại trừ về quyền
  riêng tư/an ninh được tôn trọng.
- Bạn hoạt động dưới một chế độ kiểm toán theo luật định (tổng
  thanh tra, cơ quan kiểm toán tối cao) và muốn neo từng đợt đóng
  hàng quý trước khi chu kỳ kiểm toán đến nó.
- Bạn xuất bản theo Tiêu chuẩn Dữ liệu Hợp đồng Mở hoặc IATI và
  muốn một bổ sung mật mã cho việc xuất bản dựa trên cổng thông
  tin.

## Khi nào **không** sử dụng bộ này

- **Không sử dụng như một sự thay thế cho kiểm toán theo luật định,
  đánh giá tổng thanh tra, điều tra công tố, hoặc giám sát xã hội
  dân sự.** Bộ là *bổ sung*, không phải thay thế.
- **Không sử dụng như một chứng nhận tính hợp pháp.** Một bản ghi
  chi tiêu được niêm phong không phải là chứng nhận không có tham
  nhũng. Đối xử với nó như một chứng nhận là chính chế độ thất bại
  mà cấu trúc ràng buộc-trước của bộ tồn tại để ngăn chặn.
- **Không sử dụng giữa kỳ.** Bộ là cho thời điểm phát hành chính
  thức (đóng hàng quý, trao hợp đồng, giải ngân cột mốc). Con dấu
  giữa kỳ tạo ra các điểm tham chiếu gây hiểu lầm.
- **Không sử dụng để tuyên bố chi tiêu là hợp pháp, công bằng, hoặc
  không tham nhũng** — bộ không thể làm điều đó.
- **Không sử dụng để niêm phong chi tiêu được phân loại, PII nhân
  viên cá nhân, hoặc PII thương mại nhà cung cấp.** Bộ từ chối các
  mẫu này; cố gắng làm chúng tạo ra một bản ghi từ chối (FACT 07).
- **Không sử dụng để niêm phong các bản thảo trước khi phát hành.**
  Bản thảo có thể được niêm phong dưới một loại chứng thực khác
  ("bản thảo để bình luận, không phát hành"), nhưng không phải dưới
  loại phát hành của bộ này.
- **Không sử dụng dưới áp lực để bỏ qua tiết lộ FACT 07.** Từ chối,
  và niêm phong sự từ chối.
- **Không sử dụng nếu cơ quan tài chính của bạn bị chiếm đoạt.**
  Một chi tiêu gian lận được niêm phong là một bản ghi công khai
  vĩnh viễn về sự gian lận, không phải là phòng thủ cho nó. Bộ
  nguyên thủy cắt theo cả hai cách; đó là sự trung thực của nó.

---

## Cách fork bộ này cho một chứng thực thực sự

```bash
cp -r ~/Genesis/myriam-kit/examples/public-spending-attestation ~/my-jurisdiction-Q2-2026
cd ~/my-jurisdiction-Q2-2026
$EDITOR facts/*.txt        # thay thế nội dung hư cấu bằng nội dung thực
bash build/seal.sh         # niêm phong tại thời điểm phát hành chính thức
python3 build/verify.py    # xác nhận
```

**Thời gian then chốt:** niêm phong VÀO thời điểm phát hành chính
thức — tức là, thời điểm hiệu trưởng tài chính chịu trách nhiệm ký
đóng hàng quý, thời điểm một hợp đồng được trao chính thức, hoặc
thời điểm một khoản giải ngân được phát hành chính thức. Một con
dấu trước khi phát hành chính thức tạo ra một tham chiếu sai-tích
cực "đây là bản ghi chính thức". Một con dấu rất lâu sau khi phát
hành chính thức yếu hơn về mặt pháp y chống lại các sửa đổi can
thiệp.

**Tần suất:** bộ được thiết kế cho chứng thực hàng quý là mặc định.
Tần suất dưới hàng quý (đóng hàng tháng, niêm phong theo từng giao
dịch) được hỗ trợ bằng cách chạy lại với phạm vi thích hợp; con dấu
của một giao dịch có giá trị cao duy nhất là một cách sử dụng hợp
pháp.

---

## Tích hợp với hạ tầng tài chính công hiện có

Bộ được thiết kế để kết hợp với, không phải thay thế:

- **Tiêu chuẩn Dữ liệu Hợp đồng Mở (OCDS) v1.1.5.** Năm điểm xuất
  bản (lập kế hoạch, đấu thầu, trao thưởng, hợp đồng, thực hiện)
  ánh xạ tự nhiên vào FACT 03 (lập kế hoạch → phân bổ), FACT 04
  (đấu thầu, trao thưởng, hợp đồng, thực hiện → bản kê giao dịch),
  và FACT 05 (hash tài liệu hỗ trợ). Bản xuất JSON OCDS được niêm
  phong trong FACT 05 (tài liệu kiểm soát). Một khu vực pháp lý
  chạy xuất bản OCDS có thể thêm niêm phong MYRIAM như một lớp mật
  mã trên cổng thông tin hiện có của nó.

- **Tiêu chuẩn Sáng kiến Minh bạch Viện trợ Quốc tế (IATI) v2.03.**
  Đối với chi tiêu được tài trợ toàn bộ hoặc một phần bởi viện trợ
  bên ngoài, XML IATI có thể được niêm phong như một tài liệu kiểm
  soát; con dấu cung cấp một bổ sung mật mã cho mô hình xuất bản
  dựa trên HTTP của Sổ đăng ký IATI.

- **Các cam kết của Đối tác Chính phủ Mở (OGP).** Kế hoạch Hành động
  Quốc gia của OGP thường bao gồm các cam kết minh bạch tài chính;
  niêm phong MYRIAM vận hành hóa một cam kết "xuất bản có thể phát
  hiện dấu hiệu giả mạo" theo cách có thể được xác minh độc lập bởi
  xã hội dân sự mà không cần tin tưởng vào cổng thông tin của
  chính phủ.

- **Khuyến nghị OECD về Liêm chính Công (2017).** Bộ hỗ trợ Khuyến
  nghị 4 (dữ liệu chính phủ mở về tài chính công dưới dạng máy
  đọc được, kịp thời) bằng cách làm cho dữ liệu được neo bằng mật
  mã cũng như máy đọc được.

- **Công ước Liên hợp quốc chống Tham nhũng (UNCAC), đặc biệt là
  các Điều 9 (mua sắm) và 13 (sự tham gia của xã hội).** Bộ cung
  cấp một bộ nguyên thủy pháp y hỗ trợ các nghĩa vụ minh bạch của
  Điều 9 và sự giám sát xã hội dân sự của Điều 13.

- **Các Cơ quan Kiểm toán Tối cao (SAI) — khuôn khổ INTOSAI.** Các
  SAI hoạt động theo các tiêu chuẩn INTOSAI (ISSAI) có thể tiêu thụ
  các xuất bản được niêm phong như bằng chứng với tính toàn vẹn
  cao; các hash SHA-256 trong FACT 05 là cùng các hash mà các công
  cụ kiểm toán điện tử của SAI có thể tính toán lại.

- **Văn phòng tổng thanh tra.** Các văn phòng IG nội địa có thẩm
  quyền đối với các chi tiêu đã niêm phong (FACT 06) có thể trát
  đòi cơ thể tài liệu mà các hash của chúng được niêm phong trong
  FACT 05; con dấu ràng buộc các cơ thể tài liệu nhận được theo
  trát đòi với các cơ thể tồn tại tại thời điểm phát hành.

- **Tự do thông tin và các đạo luật hồ sơ mở.** Con dấu không miễn
  cho cơ quan phát hành khỏi các nghĩa vụ FOI liên tục; trên thực
  tế, nó làm cho phản hồi FOI có chọn lọc có thể phát hiện như một
  sự sai lệch so với bản ghi đã niêm phong. FACT 07 C3 neo các yêu
  cầu FOI còn tồn đọng tại thời điểm chứng thực.

- **Sổ đăng ký quyền sở hữu thụ hưởng (Khuyến nghị 24 của FATF, các
  chỉ thị AML của EU, Đạo luật Minh bạch Doanh nghiệp của Hoa Kỳ).**
  Dữ liệu quyền sở hữu thụ hưởng KHÔNG được niêm phong dưới bộ này
  (FACT 04 nguồn danh tính nhà cung cấp từ chỉ tên thực thể pháp lý
  đã đăng ký). Tiết lộ quyền sở hữu thụ hưởng là một chế độ niêm
  phong riêng biệt có thể tạo ra một xuất bản song song được tham
  chiếu bởi Merkle root.

- **Minh bạch do tòa án quản lý (báo cáo chi tiêu tư pháp, thủ tục
  thu hồi tài sản).** Các đầu ra của các thủ tục tòa án liên quan
  đến tham nhũng không nằm trong phạm vi của bộ này nhưng có thể
  được niêm phong dưới các loại chứng thực song song.

## Bộ này **không** thay thế

- Kiểm toán thực hiện ngân sách theo luật định bởi các cơ quan
  tổng thanh tra
- Đánh giá cơ quan kiểm toán tối cao (GAO, NAO, TCU, CAG, AGN,
  BRH, Cour des comptes, tương đương)
- Điều tra công tố các tội phạm tham nhũng (các công tố viên chống
  tham nhũng quốc gia, các cơ quan Điều 36 của UNCAC)
- Báo cáo điều tra xã hội dân sự và báo chí
- Các kênh tố giác và các chế độ tiết lộ được bảo vệ
- Tiết lộ quyền sở hữu thụ hưởng
- Đánh giá đồng đẳng quốc tế (OECD, Đánh giá Minh bạch Tài chính
  của IMF, học kỳ EU, Sổ đăng ký IATI)
- Các thủ tục thu hồi tài sản do tòa án quản lý

Con dấu là một bộ nguyên thủy pháp y làm giảm chi phí và tăng độ
tin cậy của tất cả những điều trên. Nó không, và không thể, là một
sự thay thế cho bất kỳ điều nào trong số chúng.

---

## Giấy phép

Phạm vi công cộng (CC0). Fork nó. Không yêu cầu ghi công.
