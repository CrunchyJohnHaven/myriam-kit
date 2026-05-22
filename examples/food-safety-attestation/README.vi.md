# Bộ công cụ chứng thực an toàn thực phẩm

*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

Một ví dụ myriam-kit chìa-khóa-trao-tay dành cho các nhà sản xuất
thực phẩm, thanh tra an toàn thực phẩm, các tổ chức chứng nhận
bên-thứ-ba và các cơ quan quản lý, những người muốn công bố một dấu
niêm phong neo vào Bitcoin, phát hiện được giả mạo, về *những gì các
xét nghiệm phát hành đã nói* và *quyết định phát hành nào đã được đưa
ra*, tại thời điểm phát hành lô hoặc ký duyệt báo cáo thanh tra — để
việc sửa đổi âm thầm sau khi phát hành đối với hồ sơ xét nghiệm,
quyết định phát hành, hoặc các cam kết thu hồi trở nên có thể phát
hiện được một cách công khai.

---

## Những gì bộ công cụ này KHÔNG làm (đọc trước)

Dấu niêm phong là một dấu thời gian mật mã về NHỮNG xét nghiệm phát
hành nào đã được thực hiện trên LÔ nào, bởi PHÒNG THÍ NGHIỆM được
công nhận nào, theo PHƯƠNG PHÁP nào, với KẾT QUẢ nào, và QUYẾT ĐỊNH
PHÁT HÀNH nào mà cơ quan QA đã đưa ra dựa trên những kết quả đó. Nó
không thể trả lời bất kỳ câu hỏi nào về an toàn thực phẩm ngoài điều
đó. Những điều sau đây **nằm ngoài lĩnh vực của dấu niêm phong**:

1. **Ngăn ngừa nhiễm bẩn.** Bộ công cụ neo những gì kết quả xét
   nghiệm ĐÃ NÓI tại thời điểm phát hành. Nhiễm bẩn có nhiều nguyên
   nhân — phân bố vi sinh không đồng đều trong một lô, lạm dụng
   nhiệt độ sau-khi-phát-hành trong phân phối, lỗi xử lý ở khâu bán
   lẻ, lỗi chuẩn bị của người tiêu dùng, các mối nguy mới hoặc chưa
   được sàng lọc (ví dụ tạp nhiễm melamine trước khi sàng lọc
   melamine là thông thường), gian lận chuỗi cung ứng phía trên
   phạm vi xét nghiệm của nhà sản xuất. Dấu niêm phong không ngăn
   ngừa bất kỳ điều nào trong số này và không tuyên bố là sẽ làm
   được.

2. **Bảo đảm rằng tất cả các đơn vị trong một lô đạt là an toàn.**
   Nhiễm bẩn vi sinh trong sản phẩm thực phẩm số lượng lớn là KHÔNG
   ĐỒNG NHẤT. Các tác nhân Listeria, Salmonella và STEC xuất hiện ở
   các điểm nóng cục bộ tỉ lệ thấp, không phân bố đều. Các kế hoạch
   lấy mẫu của ICMSF và Codex có xác suất phát hiện nhiễm bẩn ở tỉ
   lệ thấp đã được ghi nhận, bị giới hạn — xác suất KHÔNG phải là 1.
   Một lô vượt qua lấy mẫu phát hành vẫn có thể chứa các đơn vị
   nhiễm bẩn không được lấy mẫu. Dấu niêm phong neo các MẪU, không
   phải khối lượng lớn. Hạn chế này được nêu lại rõ ràng trong FACT
   03 và là giới hạn trung thực quan trọng nhất duy nhất của bộ công
   cụ này.

3. **Chứng nhận rằng các xét nghiệm phát hành được thực hiện trung
   thực.** Dấu niêm phong neo những gì các xét nghiệm đã báo cáo tại
   thời điểm phát hành. Một phòng thí nghiệm báo cáo một kết quả ĐẠT
   gian lận tại thời điểm phát hành tạo ra một dấu niêm phong hợp lệ
   về mặt mật mã của một kết quả ĐẠT gian lận. Bộ công cụ làm cho
   việc sửa đổi âm thầm sau đó có thể phát hiện được, nhưng không
   phát hiện được gian lận đương thời. Phát hiện gian lận đương thời
   yêu cầu kiểm toán, giám sát công nhận phòng thí nghiệm (giám sát
   ISO 17025), các chương trình kiểm tra năng lực, và thanh tra của
   cơ quan quản lý — tất cả đều nằm phía trên dấu niêm phong.

4. **Thay thế cho các đệ trình quy định của FSMA, FSIS hoặc cơ quan
   thẩm quyền của EU.** Các hồ sơ phát hành theo FSMA, FSIS, Quy
   định (EC) 178/2002 của EU, và Codex Alimentarius được duy trì
   theo luật và được cung cấp theo yêu cầu của cơ quan quản lý. Dấu
   niêm phong bổ sung một lớp phát-hiện-giả-mạo công khai LÊN TRÊN
   các đệ trình đó; nó KHÔNG thay thế chúng. Một ấn phẩm được niêm
   phong không phải là một đệ trình quy định.

5. **Giải quyết các tranh chấp về phạm vi thu hồi.** Bộ công cụ có
   thể niêm phong các cam kết thu hồi được đưa ra tại thời điểm phát
   hành (FACT 06) và một phạm vi thu hồi sau đó như một ấn phẩm mới;
   nhưng ranh giới về việc các lô nào bị ảnh hưởng, các đơn vị nào
   đã được vận chuyển, những nhà bán lẻ nào đã nhận được chúng, và
   những người tiêu dùng nào đã tiếp xúc vẫn là một cuộc điều tra
   truy-vết-ngược-và-xuôi. Dấu niêm phong neo những gì nhà sản xuất
   đã CAM KẾT và những gì họ đã LÀM sau đó. Nó không giải quyết
   câu hỏi dịch tễ học cơ bản.

6. **Phát hiện gian lận chuỗi cung ứng có chủ ý phía trên xét
   nghiệm.** Vụ tạp nhiễm melamine năm 2008 trong sữa và sữa công
   thức cho trẻ sơ sinh ở Trung Quốc thành công vì melamine không
   nằm trong bảng phân tích — đo đạc tương đương-protein theo
   hàm-lượng-nitrogen có, và melamine đã giả mạo điều đó. Một FACT
   03 được niêm phong với bảng phân tích đang được sử dụng vào thời
   điểm đó sẽ cam kết công khai với bảng đó — nhưng sẽ không làm gì
   để phát hiện chất tạp nhiễm bên ngoài bảng. Giá trị của dấu niêm
   phong trong trường hợp đó sẽ là neo pháp y "đây là những gì nhà
   sản xuất tuyên bố là đã xét nghiệm," KHÔNG phải ngăn ngừa. Một
   chế độ an toàn thực phẩm thực sự giải quyết điều này thông qua
   việc cơ quan quản lý lấy mẫu không báo trước với sàng lọc phạm
   vi rộng (các phương pháp không-mục-tiêu LC-MS chẳng hạn), nằm
   phía trên dấu niêm phong của nhà sản xuất.

7. **Neo phân phối sau-phát-hành và xử lý của người tiêu dùng.** Một
   khi lô rời khỏi cơ sở, lạm dụng nhiệt độ trong quá trình phân
   phối, xử lý sai ở khâu bán lẻ, lỗi lưu trữ của người tiêu dùng,
   và lỗi chuẩn bị của người tiêu dùng đều nằm ngoài phạm vi. Dấu
   niêm phong được giới hạn ở sự kiện phát hành của nhà sản xuất.
   Phát-hiện-giả-mạo phía sau yêu cầu các bộ công cụ riêng biệt ở
   các cấp nhà phân phối, nhà bán lẻ, và (đối với người tiêu dùng
   thể chế như trường học và bệnh viện) điểm-sử-dụng.

8. **Bảo lãnh cho an toàn của thực phẩm trong bất kỳ dân số cụ thể
   nào.** Kết quả ĐẠT của FACT 03 không bao hàm an toàn cho người
   tiêu dùng mang thai, trẻ sơ sinh, người tiêu dùng bị suy giảm
   miễn dịch, hoặc người cao tuổi, đối với họ Listeria monocytogenes
   và Salmonella đã được ghi nhận có nguy cơ tăng cao ngay cả ở
   nồng độ dưới giới hạn phát hiện thông thường. Dấu niêm phong
   không thể đưa ra tuyên bố an toàn theo dân số cụ thể và từ chối
   làm điều đó (quy tắc từ chối R6).

**Phần giới hạn trung thực ở trên là phần chịu lực của bộ công cụ
này.** Các nhà sản xuất coi "chúng tôi đã niêm phong hồ sơ phát hành
của mình" tương đương với "chúng tôi đã chứng minh thực phẩm của
chúng tôi là an toàn" đang lạm dụng nguyên thủy. Bộ công cụ phải nói
thẳng: *đây là một nguyên thủy không-thể-phủ-nhận cho các tuyên bố
đương thời của nhà sản xuất tại thời điểm phát hành, không phải bằng
chứng về an toàn, không thay thế cho giám sát của cơ quan quản lý, và
không phải là một biện pháp phòng thủ chống lại các chế độ thất bại
nhiễm-bẩn-không-đồng-nhất, gian-lận-chuỗi-cung-ứng, hoặc
xử-lý-sai-sau-phát-hành đã giết người trong các đợt bùng phát trong
quá khứ.*

---

## Những gì bộ công cụ này PHẢI TỪ CHỐI niêm phong

Bộ công cụ được cấu hình để từ chối các mẫu sự kiện sau đây ngay cả
khi một người dùng có quyền ký hợp lệ của nhà sản xuất gửi chúng:

- **Định danh cá nhân của bất kỳ công nhân, giám sát viên, nhân viên
  QA, thanh tra viên đến thăm, hoặc kiểm toán viên bên-thứ-ba nào.**
  Tên, ID nhân viên, số huy hiệu, số an sinh xã hội, địa chỉ nhà,
  số điện thoại cá nhân — không có những điều này xuất hiện trong
  dấu niêm phong công khai. Các vai trò là công khai; các ràng buộc
  người-vai-trò được niêm phong riêng biệt và có thể khám phá được
  theo quy trình của cơ quan quản lý. An toàn của công nhân chống
  lại sự trả thù và quấy rối là ràng buộc chịu lực; chứng thực an
  toàn thực phẩm có thể được thực hiện ở cấp vai-trò. (R1)

- **Vị trí cơ sở chính xác.** Khu vực cơ sở (tiểu bang hoặc khu vực
  đa-tiểu-bang) là chấp nhận được; địa chỉ đường phố chính xác, tọa
  độ GPS, hoặc bất kỳ định danh nào có độ chi tiết đủ để xác định
  vật lý nhà máy trên bản đồ là KHÔNG chấp nhận được. Số cơ sở quy
  định là phần xử lý của cơ quan quản lý đối với cơ sở; các cân
  nhắc về an ninh vật lý và an toàn công nhân phản đối việc công bố
  địa chỉ công khai trên Bitcoin. (R2)

- **Các mẫu nhân sự ca sản xuất riêng lẻ.** Lịch trình ca, vòng quay
  công nhân riêng lẻ, ID cá nhân của vận hành viên dây chuyền —
  không có những điều này xuất hiện trong dấu niêm phong. Mẫu cuộc
  sống của các công nhân riêng lẻ không được phép suy ra từ chứng
  thực công khai. (R3)

- **Danh tính nhà cung cấp làm tổn hại các hợp đồng.** Tên nhà cung
  cấp, vị trí cơ sở nhà cung cấp, mã lô nhà cung cấp (ngoại trừ
  trong trường hợp nhiễm bẩn chuỗi cung ứng nơi việc nêu tên lô
  nhiễm bẩn của nhà cung cấp là cần thiết cho sức khỏe cộng đồng,
  và được xử lý thông qua một ấn phẩm được niêm phong riêng biệt)
  KHÔNG được công bố trong dấu niêm phong phát hành. Nhiều hợp đồng
  cung cấp chứa các điều khoản bảo mật; dấu niêm phong không vi phạm
  những điều đó theo mặc định. (R4)

- **Danh sách khách hàng và điểm đến phân phối vượt quá cấp
  cao.** Tóm tắt khu vực ở cấp cao là chấp nhận được; danh sách
  khách hàng cụ thể (nhà bán lẻ, trung tâm phân phối, tài khoản
  dịch vụ thực phẩm) là KHÔNG chấp nhận được. Danh tính khách hàng
  là bí mật theo hợp đồng và nhạy cảm về cạnh tranh; cơ quan quản
  lý có được danh sách khách hàng thông qua các kênh
  phối-hợp-thu-hồi đã thiết lập. (R5)

- **Tuyên bố an toàn hoặc kết luận pháp lý.** Bộ công cụ sẽ không
  niêm phong "sản phẩm này an toàn," "lô này đáp ứng tất cả các tiêu
  chuẩn an toàn thực phẩm áp dụng," "đây là GRAS cho việc sử dụng
  này," hoặc bất kỳ kết luận an toàn hay pháp lý nào khác. Bộ công
  cụ neo hồ sơ xét nghiệm và quyết định phát hành, KHÔNG phải một
  kết luận an toàn. (R6)

- **Các mẫu khiếu nại công nhân hoặc tái-định-danh người tố giác.**
  Bộ công cụ từ chối công bố bất kỳ mẫu nào có thể tái-định-danh
  một công nhân đã nộp đơn khiếu nại OSHA, USDA hoặc nội bộ công ty
  về các thực hành an toàn thực phẩm hoặc an toàn nơi làm việc. Các
  người khiếu nại như vậy được bảo vệ theo FSMA Mục 402 và các quy
  chế song song; dấu niêm phong không được trở thành vectơ
  tái-định-danh. Các chứng thực của người tố giác có bộ công cụ
  riêng của họ (`examples/whistleblower-manifest`) với các quy tắc
  từ chối được điều chỉnh cho trường hợp sử dụng đó. (R7)

- **Niêm phong bởi bất kỳ ai khác ngoài principal được ủy quyền của
  nhà sản xuất phát hành.** Một tổ chức chứng nhận bên-thứ-ba, đội
  QA của khách hàng, hoặc kiểm toán viên độc lập có thể sử dụng cùng
  bộ công cụ để niêm phong CÁC phát hiện kiểm toán CỦA HỌ; họ KHÔNG
  thể niêm phong quyết định phát hành ban đầu dưới tên nhà sản xuất.
  Principal ký trong FACT 08 là người ký hợp lệ duy nhất cho điều
  đó. (R8)

Bản thân việc từ chối có thể được niêm phong như một sự kiện ("Nhà
sản xuất này đã yêu cầu niêm phong X; bộ công cụ đã từ chối theo
quy tắc từ chối Y"), tạo ra một hồ sơ công khai về nỗ lực lạm dụng.

---

## Những gì bộ công cụ này CÓ niêm phong

8 sự kiện tại thời điểm phát hành:

1. **Thông báo ví dụ** — tuyên bố ấn phẩm là một ví dụ (các chứng
   thực thực sự sẽ loại bỏ hoặc thay thế phần này).
2. **Định danh sản phẩm và lô** — tên sản phẩm, danh mục, nhà sản
   xuất, khu vực cơ sở (KHÔNG phải vị trí chính xác), phiên bản
   HACCP-plan + hash, ID lô, ngày sản xuất / đóng gói / hạn sử dụng,
   số đơn vị tiêu dùng, yêu cầu lưu trữ, ba điểm kiểm soát tới hạn
   với hash hồ sơ đã ghi nhận (tính tử vong khi nấu, ổn định khi làm
   nguội, môi trường RTE sau-tử-vong).
3. **Kết quả xét nghiệm phát hành** — xét nghiệm vi sinh sản
   phẩm-hoàn-thiện (Listeria, Salmonella, STEC, APC,
   Enterobacteriaceae), xét nghiệm hóa học / dư lượng (nitrit, dư
   lượng thú y, kim loại nặng), xác minh tiếp xúc chéo chất gây dị
   ứng, tóm tắt giám sát môi trường, mỗi xét nghiệm có SHA-256 của
   PDF báo cáo đầy đủ và ràng buộc diễn giải mẫu-so-với-số-lượng-lớn
   rõ ràng.
4. **Phương pháp luận và năng lực phòng thí nghiệm** — phương pháp
   nào (và phiên bản tài liệu-phương-pháp nào) được sử dụng cho mỗi
   hàng, phòng thí nghiệm nào chạy xét nghiệm nào, trạng thái công
   nhận ISO/IEC 17025:2017 và hash chứng chỉ của mỗi phòng thí
   nghiệm, kết quả kiểm tra năng lực gần đây, tuyên bố độc lập, hồ
   sơ sai lệch / xét nghiệm lại / OOS cho lô này.
5. **Quyết định phát hành** — ngày phát hành, thẩm quyền phát hành
   cấp-vai-trò + chữ ký đối chiếu, tóm tắt hồ sơ hỗ trợ quyết định,
   các điểm đến phân phối cấp cao, các nghĩa vụ sau-phát-hành được
   thừa nhận tại thời điểm phát hành, cam kết
   thời-gian-và-không-thể-đảo-ngược.
6. **Cam kết thu hồi và giám sát sau-thị-trường** — tương tự
   pharmacovigilance về an toàn thực phẩm: tính minh bạch tín hiệu
   bệnh tật, các cam kết thực hiện thu hồi (ngưỡng 24h / 72h / 98%),
   phản ứng nhiễm bẩn chuỗi cung ứng, cam kết
   không-xét-nghiệm-lại-âm-thầm, cam kết
   không-thay-đổi-thông-số-kỹ-thuật-hậu-kỳ, chia sẻ tín hiệu an toàn
   tổng hợp.
7. **Công bố đi kèm và hồ sơ từ chối** — hash nhật ký điều tra
   hành-động-khắc-phục, lịch sử thanh tra gần đây, lịch sử thu hồi,
   các vấn đề mở đã biết trong các phương pháp xét nghiệm được sử
   dụng, ràng buộc vai-trò-đến-cá-nhân (được niêm phong riêng biệt,
   hash ở đây), sự sẵn sàng truy-vết-ngược nhà cung cấp, danh sách
   rõ ràng các quy tắc từ chối R1-R8 với bất kỳ từ chối nào đã thực
   hiện trong quá trình phát hành này.
8. **Principal ký** — nhà sản xuất + người ký cấp-vai-trò (Giám đốc
   QA) + chữ ký đối chiếu cấp-vai-trò (Giám đốc Nhà máy) + thông tin
   khóa mật mã; lý do biện minh cho công bố cấp-vai-trò.

Mỗi sự kiện kết thúc bằng quy ước cổng-từ-chối: *"Sự kiện này chỉ
khẳng định X. Nó không khẳng định Y"* (trong đó Y là chế độ thất bại
gần nhất từ phần "KHÔNG làm" ở trên).

---

## Những gì bộ công cụ này phòng thủ chống lại

- **Sửa đổi âm thầm hồi tố kết quả xét nghiệm phát hành.** Tất cả
  PDF báo cáo xét nghiệm đều được hash. Việc hash lại sau khi phát
  hành cho thấy bất kỳ sửa đổi nào.
- **Tranh chấp về phương pháp nào, phiên bản tài liệu-phương-pháp
  nào, và phòng thí nghiệm nào đã được sử dụng.** FACT 04 đóng băng
  phương pháp luận và trạng thái công nhận phòng thí nghiệm tại thời
  điểm phát hành. Các tuyên bố sau đó "thực ra chúng tôi đã dùng
  MLG 4.13, không phải 4.12" có thể bác bỏ công khai.
- **Xác định lại đặc tả hồi tố cho một lô không-đạt-đặc-tả.** Nếu
  một kết quả xét nghiệm phát hành thực sự là một kết quả ĐẠT ranh
  giới được phân loại lại là FAIL sau khi phát hành, các hash báo
  cáo được niêm phong chứng minh những gì PDF kết quả ban đầu đã
  nói. Đối xứng, một OOS ranh giới được lặng lẽ xét nghiệm lại thành
  một ĐẠT mà không có công bố có thể phát hiện được nếu cam kết
  không-xét-nghiệm-lại-âm-thầm của FACT 06 sau đó được so sánh với
  một sửa đổi không-được-niêm-phong.
- **Giảm thiểu phạm vi thu hồi âm thầm.** Các cam kết thu hồi trong
  FACT 06 (thông báo 24h, khởi xướng 72h, khả năng thu hồi 98%) được
  niêm phong; việc không tôn trọng chúng có thể quan sát được công
  khai.
- **Tái-tường-thuật hậu-kỳ lịch sử hành-động-khắc-phục.** Hash nhật
  ký hành-động-khắc-phục của FACT 07 đóng băng những gì công ty ĐÃ
  NÓI là đã làm sau khi giả định EMP; các tuyên bố sau đó "chúng tôi
  đã làm nhiều hơn / ít hơn điều đó" có thể bác bỏ công khai.
- **Loại bỏ chọn lọc các công bố đi kèm.** FACT 07 liệt kê các danh
  mục công bố dự kiến (lịch sử thanh tra, lịch sử thu hồi, đánh giá
  phương-pháp-tư-vấn, sự sẵn sàng truy-vết-ngược); một danh mục
  trống phải được chứng thực rõ ràng ("không có vào thời điểm phát
  hành"), vì vậy một tuyên bố sau đó "chúng tôi không nhận ra điều
  đó là có liên quan" có thể bác bỏ công khai.
- **Thay thế trạng thái công nhận của một phòng thí nghiệm khác.**
  FACT 04 đóng băng phạm vi ISO 17025 và hash chứng chỉ của mỗi
  phòng thí nghiệm tại thời điểm phát hành; việc thay thế sau đó
  bằng một phòng thí nghiệm không-được-công-nhận có thể phát hiện
  được công khai.

Bộ công cụ **không** phòng thủ chống lại tham nhũng đương thời —
một đội cố ý niêm phong các kết quả xét nghiệm sai tại thời điểm phát
hành tạo ra một dấu niêm phong hợp lệ về mặt mật mã của các kết quả
xét nghiệm sai. Nguyên thủy trung thực về điều này: nó là một nguyên
thủy không-thể-phủ-nhận cho các tuyên bố đương thời của nhà sản xuất,
không phải bằng chứng rằng các tuyên bố đó là chính xác.

---

## Tiền lệ tử vong trong lịch sử

Bộ công cụ sẽ tạo ra một mỏ neo hữu ích — *không phải là một giải
pháp* — trong các thất bại an toàn thực phẩm trong quá khứ. Để tránh
phỉ báng các cá nhân (hầu hết các thất bại an toàn thực phẩm là doanh
nghiệp, không phải cá nhân; một số bị truy tố hình sự và một số
không), những tham chiếu này mô tả đợt bùng phát theo năm và tác nhân
gây bệnh và chỉ nêu tên thực thể liên quan khi nhiễm bẩn được quy
trách công khai bằng thông báo thu hồi hoặc hồ sơ tòa án.

- **Vụ tạp nhiễm melamine năm 2008 trong sữa công thức cho trẻ sơ
  sinh và sữa ở Trung Quốc (Tập đoàn Sanlu + các đơn vị khác).** Ít
  nhất sáu cái chết trẻ sơ sinh và ~300.000 ca bệnh có thể quy trách
  cho các sản phẩm sữa pha melamine được thiết kế để gian lận thổi
  phồng hàm lượng protein biểu kiến trên các xét nghiệm dựa-trên-
  nitrogen Kjeldahl. Các bản án theo sau ở các tòa án PRC, bao gồm
  các bản án tử hình. *Dấu niêm phong sẽ không ngăn được điều này*
  — melamine nằm ngoài bảng phân tích tiêu chuẩn. Dấu niêm phong sẽ
  cam kết công khai với bảng đó LÀ gì, làm cho phạm vi mở rộng sàng
  lọc thường xuyên sau sự cố trở nên rõ ràng về mặt pháp y.

- **Đợt bùng phát STEC O104:H4 ở châu Âu năm 2011 (mầm hồ lô được
  truy đến một trang trại Đức).** 53 ca tử vong, ~3.950 ca bệnh trên
  nhiều quốc gia châu Âu; cuối cùng được truy đến hạt hồ lô nhập
  khẩu từ Ai Cập và nảy mầm tại một nhà sản xuất Đức. Việc truy
  ngược bị cản trở bởi tài liệu cấp-lô không nhất quán trên chuỗi
  cung ứng đa-quốc-gia. *Dấu niêm phong sẽ không ngăn được nhiễm bẩn
  của lô hạt giống* (nhiễm bẩn nằm phía trên xét nghiệm của nhà
  nảy-mầm); nó sẽ neo những gì các xét nghiệm phát hành của nhà
  nảy-mầm đã tuyên bố, và nếu được sử dụng ở cấp nhập khẩu hạt giống,
  những gì xử lý hạt-giống-nhập-khẩu đã tuyên bố, làm cho việc truy
  ngược nhanh hơn.

- **Đợt bùng phát Listeria monocytogenes ở Blue Bell Creameries
  năm 2015 (Hoa Kỳ).** 3 ca tử vong, 10 ca bệnh trên nhiều bang;
  dẫn đến một cuộc thu hồi toàn quốc và một bản án hình sự liên bang
  năm 2020 đối với Blue Bell về các tội danh khinh tội về an toàn
  thực phẩm, với công ty tham gia một thỏa thuận hoãn-truy-tố và
  trả 19,35 triệu đô la. Tranh tụng dân sự tiếp theo. *Dấu niêm
  phong sẽ không ngăn được* nhiễm bẩn Listeria môi trường trong-nhà-máy;
  nó sẽ neo về mặt pháp y các hồ sơ chương trình giám sát môi trường,
  làm cho bất kỳ câu hỏi sau sự cố nào "EMP đã cho thấy gì trong
  những tháng trước đợt bùng phát" có thể trả lời được dựa vào một
  hồ sơ có dấu thời gian phát-hiện-giả-mạo, thay vì dựa vào các tài
  liệu được sản xuất sau đó.

- **Đợt bùng phát STEC O157:H7 đa-bang năm 2018 liên quan đến rau
  diếp romaine (vùng trồng Yuma, sau đó vùng trồng Salinas).** Ít
  nhất 5 ca tử vong và ~210 ca bệnh trên nhiều đợt bùng phát trong
  năm đó. Việc truy ngược bị phức tạp bởi sản phẩm đóng túi đa-nguồn.
  *Dấu niêm phong sẽ không ngăn được* nhiễm bẩn ở cấp đồng ruộng /
  nước-tưới (phía trên nhà sản xuất); nó sẽ neo về mặt pháp y hồ sơ
  xét-nghiệm-tiếp-nhận và xét-nghiệm-phát-hành của mỗi nhà chế biến,
  làm cho việc truy ngược nhanh hơn và hồ sơ công khai có thể bảo vệ
  bằng mật mã hơn chống lại các tranh chấp sau này.

- **Đợt bùng phát Salmonella Typhimurium ở Peanut Corporation of
  America (2008-2009, Hoa Kỳ).** 9 ca tử vong, ~714 ca bệnh; dẫn
  đến các bản án hình sự liên bang năm 2014-2015 đối với các giám
  đốc PCA, bao gồm án tù 28 năm cho CEO về các tội danh âm mưu và
  cản trở. *Dấu niêm phong sẽ không ngăn được* nhiễm bẩn, việc
  điều-tra-thiếu các xét nghiệm Salmonella dương tính trong-nhà-máy,
  hoặc quyết định cấp giám đốc vận chuyển sản phẩm bất chấp những
  phát hiện dương tính đó. Nó SẼ làm rõ về mặt pháp y, tại phiên
  tòa, NHỮNG gì kết quả xét nghiệm ĐÃ NÓI vào thời điểm chúng được
  tạo ra — làm cho lập luận của bên truy tố chống lại các email
  tường-thuật-sai đương thời được neo đáng kể hơn so với sự sửa đổi
  tài liệu.

Trong mỗi trường hợp này, bộ công cụ sẽ cung cấp một dòng thời gian
pháp y rõ ràng hơn. Trong không trường hợp nào trong số này bộ công
cụ tự nó sẽ ngăn được các cái chết. Dấu niêm phong là hạ tầng pháp y,
không phải hạ tầng phòng ngừa. Sự phân biệt đó là tính trung thực của
bộ công cụ.

---

## Khi nào nên sử dụng bộ công cụ này

- Hoạt động sản xuất của bạn có một chương trình HACCP / Preventive
  Controls ổn định và muốn thêm một chứng thực công khai neo vào
  Bitcoin như một lớp phát-hiện-giả-mạo lên trên quy trình
  tài-liệu-phát-hành hiện có.
- Bạn là một nhà sản xuất nhỏ-đến-vừa hoặc một nhà sản xuất ở một
  khu vực pháp lý với hạ tầng quản lý yếu hơn, muốn neo các hồ sơ
  lô đối với một dòng thời gian có thể xác minh toàn cầu — cho sự
  tin cậy ở thị-trường-xuất-khẩu, cho phản ứng kiểm-toán-khách-hàng,
  hoặc cho việc tham gia các sáng kiến minh bạch tự nguyện.
- Bạn là một thanh tra an toàn thực phẩm hoặc một tổ chức chứng
  nhận bên-thứ-ba và muốn công bố một dấu niêm phong phát-hiện-cản
  trở các phát hiện kiểm toán tại thời điểm ký duyệt, để các phát
  hiện kiểm toán không thể được sửa đổi âm thầm sau này bằng thỏa
  thuận giữa nhà sản xuất và tổ chức chứng nhận.
- Bạn dự kiến lô này sẽ đối mặt với sự xem xét kỹ lưỡng đáng kể ở
  phía sau (thị trường xuất khẩu, danh mục rủi-ro-cao như thịt RTE
  hoặc sữa công thức cho trẻ sơ sinh, thành phần mới, lịch sử thu
  hồi gần đây).
- Bạn có thể công bố bộ sự kiện được liệt kê mà không phá vỡ các
  quy tắc từ chối R1-R8. Nếu các sự kiện của bạn yêu cầu một sự phá
  vỡ R1-R8, đừng sử dụng bộ công cụ; hãy sửa các đầu vào dữ liệu
  trước.
- Cố vấn pháp lý của nhà sản xuất đã xem xét kế hoạch công bố. Việc
  công bố công khai một tạo phẩm mang định danh lô có những hàm ý
  đối với mức độ phơi nhiễm về trách-nhiệm-sản-phẩm; việc xem xét
  của cố vấn pháp lý không phải là tùy chọn.

## Khi nào KHÔNG nên sử dụng bộ công cụ này

- **Không sử dụng thay thế cho các hồ sơ quản lý FSMA / FSIS / EU.**
  Dấu niêm phong là *bổ sung*, không phải thay thế. Các hồ sơ phát
  hành theo luật, kế hoạch HACCP, nhật ký CCP, và kế hoạch thu hồi
  của bạn không thay đổi.
- **Không sử dụng như một tuyên bố an toàn.** Niêm phong một hồ sơ
  phát hành đạt không thiết lập rằng sản phẩm là an toàn; nó thiết
  lập rằng hồ sơ có nội dung byte này tại thời điểm này. Quy tắc từ
  chối R6 sẽ bác bỏ bất kỳ kết luận an toàn nào.
- **Không sử dụng để công bố danh tính nhà cung cấp, danh sách
  khách hàng, tên công nhân, hoặc địa chỉ cơ sở.** Các quy tắc từ
  chối R1-R5 tồn tại vì lý do an-toàn-con-người và hợp đồng; đừng
  sửa đổi bộ công cụ để đánh bại chúng mà không tham vấn cố vấn pháp
  lý.
- **Không sử dụng dưới áp lực để niêm phong trước khi xét nghiệm
  phát hành hoàn tất.** Một dấu niêm phong dữ-liệu-một-phần biểu
  thị sai trạng thái của quyết định phát hành.
- **Không sử dụng như sân khấu hợp pháp hóa.** Một dấu niêm phong
  của một kế hoạch lấy mẫu thiết kế kém hoặc một bảng phân tích
  chọn kém là một hồ sơ công khai vĩnh viễn về sự không-đầy-đủ,
  không phải là một sự bảo vệ chống lại nó. Nguyên thủy cắt theo cả
  hai hướng; đó là tính trung thực của nó.
- **Không sử dụng trong một tình huống thu hồi đang diễn ra như một
  sự thay thế cho sự phối hợp thu hồi của cơ quan quản lý.** Một ấn
  phẩm MYRIAM mới neo phạm vi thu hồi là phù hợp SAU KHI cuộc thu
  hồi do cơ quan quản lý phối hợp được khởi xướng; nó không phải là
  một sự thay thế cho kênh thu hồi của cơ quan quản lý.

## Cách fork bộ công cụ này cho một lần phát hành thực sự

```bash
cp -r ~/Genesis/myriam-kit/examples/food-safety-attestation ~/release-FFM-XXXX
cd ~/release-FFM-XXXX
$EDITOR facts/*.txt        # thay thế nội dung hư cấu bằng lô thực
                           # áp dụng các quy tắc từ chối R1-R8 xuyên suốt
bash build/seal.sh         # NIÊM PHONG TRƯỚC chuyển động phân phối đầu tiên
python3 build/verify.py    # xác nhận
```

**THỜI ĐIỂM QUAN TRỌNG:** niêm phong tại thời điểm phát hành QA,
TRƯỚC khi lô được phân phối (trước khi chiếc xe tải đầu tiên rời
khỏi cơ sở). Một dấu niêm phong sau khi phân phối bắt đầu vẫn có giá
trị nhưng không neo trạng thái trước-phân-phối một cách sạch sẽ. Cửa
sổ phù hợp nằm giữa chữ ký phát hành QA và chuyển động phân phối đầu
tiên.

**XEM XÉT QUAN TRỌNG:** trước khi niêm phong, hãy chạy ấn phẩm qua
một người xem xét QA thứ hai (không phải người dẫn đầu) và qua cố
vấn pháp lý công ty. Một khi đã niêm phong, ấn phẩm là vĩnh viễn.

## Tích hợp với cơ sở hạ tầng an-toàn-thực-phẩm hiện có

- **FDA FSMA Preventive Controls for Human Food (21 CFR 117).** URL
  của ấn phẩm được niêm phong hoặc IPFS CID có thể được tham chiếu
  trong tài liệu Kế hoạch An toàn Thực phẩm như tạo phẩm chứng-thực-công-khai
  cho lô này.
- **USDA FSIS các kế hoạch HACCP và hồ sơ phát hành.** Hồ sơ phát
  hành được niêm phong nằm cạnh các hồ sơ HACCP do FSIS yêu cầu;
  dấu niêm phong tham chiếu hash phiên bản kế-hoạch-HACCP (FACT 02)
  để các tranh chấp sau này về phiên bản kế hoạch nào đã có hiệu lực
  có thể bác bỏ công khai.
- **Codex Alimentarius / các nguyên tắc HACCP** (Codex CAC/RCP
  1-1969 Rev. 4-2003). Dấu niêm phong cam kết với các đầu ra HACCP
  bảy-nguyên-tắc (phân tích mối nguy, CCPs, các giới hạn tới hạn,
  giám sát, hành động khắc phục, xác minh, lưu trữ hồ sơ) cho lô
  này.
- **ISO 22000:2018 (Hệ thống Quản lý An toàn Thực phẩm).** Dấu niêm
  phong có thể được tham chiếu như một phần của vết bằng chứng
  xem-xét-quản-lý; nó không thay thế chứng nhận ISO 22000.
- **Sơ đồ chứng nhận FSSC 22000 v6.** Tương thích như một lớp minh
  bạch bổ sung; kiểm toán viên của FSSC có thể xác minh dấu niêm
  phong trong quá trình giám sát.
- **Quy định (EC) 178/2002 của EU (Luật Thực phẩm Chung) Điều 18
  (truy xuất nguồn gốc) và Điều 19 (thông báo thu hồi).** Dấu niêm
  phong cam kết sự sẵn sàng truy-vết-ngược một-tầng-lùi của nhà sản
  xuất (FACT 07) và các cam kết thu hồi (FACT 06); nó không thay
  thế nghĩa vụ thông báo theo luật Điều 19.
- **Gói Vệ sinh EU (Quy định 852/2004, 853/2004, 854/2004,
  882/2004).** Tương thích; dấu niêm phong tham chiếu tương đương
  của các hồ sơ HACCP và tự-kiểm-tra của Gói Vệ sinh.
- **Các sơ đồ tiêu-chuẩn-tư-nhân BRCGS / SQF.** Tương thích như một
  lớp minh bạch bổ sung.
- **Các hệ thống giám sát sức-khỏe-cộng-đồng (CDC PulseNet,
  FoodNet, IFSAC; EU EFSA / ECDC).** Ngoài phạm vi của dấu niêm
  phong trực tiếp, nhưng FACT 06 cam kết nhà sản xuất tham gia và
  niêm phong bất kỳ sự kiện tương-quan-tín-hiệu nào như các ấn phẩm
  MYRIAM mới.

## Những gì bộ công cụ này KHÔNG thay thế

- Đăng ký Cơ sở Thực phẩm FDA hoặc phê duyệt Cơ sở USDA FSIS.
- Kế hoạch An toàn Thực phẩm bằng văn bản / Kế hoạch HACCP của bạn
  theo FSMA / FSIS.
- Các nhật ký giám sát CCP và các hồ sơ hành-động-khắc-phục.
- Giám sát công nhận phòng thí nghiệm ISO 17025.
- Các chương trình kiểm tra năng lực.
- Thanh tra của cơ quan quản lý (thanh tra liên tục FSIS, thanh tra
  định kỳ FDA, thanh tra của cơ quan thẩm quyền EU).
- Giám sát sức khỏe cộng đồng (CDC, EFSA, ECDC, các tương đương
  quốc gia).
- Các kênh phối hợp thu hồi (FDA Reportable Food Registry, phối hợp
  thu hồi FSIS, EU RASFF, các tương đương quốc gia).
- An toàn của công nhân và các chương trình đào tạo
  công-nhân-thực-phẩm.

## Tại sao bộ công cụ này tồn tại trong v0.4.0+

Đây là một trong các ví dụ thực hành được vận chuyển cùng myriam-kit.
Nó tuân theo cấu trúc README ràng-buộc-trước được xác nhận bởi
autoresearch được ghi chép trong
`~/Genesis/calc/PROMPT_LIBRARY_v0.md` — biến thể prompt ràng-buộc-trước
đạt điểm cao nhất trên một thang đánh giá có-trọng-số trên nhiều miền
ví dụ, vì chứng thực an toàn thực phẩm chính xác là miền mà việc
phóng đại những gì dấu niêm phong chứng minh là nguy hiểm: người ta
đã chết, sẽ chết, trong các thất bại mà dấu niêm phong không thể
ngăn ngừa. Các phần mở đầu là các phần chịu lực của bộ công cụ; nội
dung manifest là phần dễ.

Các mặc định của bộ công cụ là thận trọng có chủ ý về việc công bố
tên công nhân, thận trọng về độ chính xác vị-trí-cơ-sở, thận trọng
về danh tính nhà cung cấp và khách hàng, và quyết liệt về tuyên
bố-miễn-trừ "điều này không thiết lập an toàn". Cộng đồng an toàn
thực phẩm có một lịch sử ngôn ngữ chứng nhận được phóng đại được ghi
chép; bộ công cụ mặc định ở vị trí ít có khả năng được đọc là một
sự bảo đảm an toàn nhất. Các nhà sản xuất ở các khu vực pháp lý có
các yêu cầu công bố công khai cụ thể khác nhau có thể sửa đổi fork
của họ tương ứng, nhưng các từ chối mặc định ưu tiên an toàn của
công nhân và phạm vi trung thực.

## Giấy phép

Phạm vi công cộng (CC0). Hãy fork nó. Không yêu cầu ghi nhận.
