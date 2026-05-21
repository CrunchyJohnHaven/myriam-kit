*Bản dịch tiếng Việt — để xem bản gốc tiếng Anh, xem [README.md](README.md)*

# Bộ Niêm phong Chuỗi Bảo quản Vật chứng Tòa án

Một ví dụ myriam-kit sẵn dùng dành cho các nhóm thu thập pháp y — các giám định viên pháp y máy tính, kỹ thuật viên trích xuất thiết bị di động, người bảo quản bằng chứng camera đeo người, các giám sát viên phòng thí nghiệm — những người muốn công bố một dấu niêm phong được neo bằng Bitcoin, phát hiện được giả mạo, về *những byte nào đã được thu thập* và *vào thời điểm nào*, tại thời điểm thu thập vật chứng số, để các tranh chấp về chuỗi bảo quản có một điểm neo công khai.

---

## Những gì bộ kit này KHÔNG làm (đọc trước)

Dấu niêm phong là một dấu thời gian mật mã của NHỮNG ẢNH PHÁP Y nào đã được thu thập, KHI nào chúng được thu thập, bởi CƠ QUAN nào, theo LỆNH KHÁM XÉT nào, và qua PHƯƠNG PHÁP LUẬN nào. Nó không thể trả lời bất kỳ câu hỏi nào về vụ án ngoài điều đó. Những điều sau đây nằm **ngoài phạm vi của dấu niêm phong**:

1. **Tính chấp nhận được theo Quy tắc Bằng chứng Liên bang (hoặc bất kỳ bộ luật bằng chứng nào khác).** Dấu niêm phong neo các byte và dấu thời gian. Việc bằng chứng có được chấp nhận hay không — theo xác thực FRE 901, lời khai chuyên gia FRE 702 / Daubert, cân nhắc tính định kiến FRE 403, hoặc bất kỳ tương đương tòa án cấp bang nào — là một câu hỏi về thủ tục pháp lý. Một thu thập được niêm phong hoàn hảo vẫn có thể bị tuyên là không chấp nhận được; một thu thập không được niêm phong vẫn có thể được chấp nhận. Dấu niêm phong là bằng chứng bổ sung về tính toàn vẹn, không phải là sự thay thế cho phán quyết về tính chấp nhận được của tòa án.

2. **Việc thu giữ có hợp pháp hay không.** Sự tuân thủ Tu chính án thứ Tư, hiệu lực của lệnh khám xét, sự tuân thủ phạm vi, khả năng áp dụng quy tắc loại trừ — tất cả những điều này đều nằm phía trên dấu niêm phong. Dấu niêm phong ghi lại rằng việc thu thập đã diễn ra theo lệnh khám xét FICT-SW-2026-0188; việc lệnh khám xét có được ban hành hợp pháp và thực thi hợp pháp hay không là việc của tòa án.

3. **Bằng chứng có buộc tội, miễn tội, hay trung tính.** Dấu niêm phong neo các hash; cách giải thích những hash đó chứa gì thuộc về báo cáo giám định pháp y, đó là một tài liệu riêng với chế độ khám phá và bằng chứng riêng. Dấu niêm phong sẽ từ chối niêm phong "FACT N: máy tính xách tay của nghi phạm chứa tài liệu buộc tội" — xem quy tắc từ chối R4.

4. **Chuỗi bảo quản có đúng thủ tục theo luật bằng chứng của bang áp dụng hay không.** Dấu niêm phong ghi lại nhật ký sự kiện bảo quản đương thời của cơ quan (FACT 05). Việc nhật ký đó có đáp ứng yêu cầu chuỗi bảo quản của một bang cụ thể hay không là việc của tòa án tại phiên điều trần về bằng chứng.

5. **Phương pháp luận pháp y có đáng tin cậy hay không.** Daubert và những phán quyết kế thừa (cũng như các tương đương ở cấp bang như Frye, nơi vẫn áp dụng) đánh giá độ tin cậy của phương pháp luận. Dấu niêm phong ghi lại NHỮNG công cụ và phiên bản nào đã được sử dụng (FACT 04); việc các công cụ đó có đáp ứng tiêu chuẩn độ tin cậy của một tòa án cụ thể nào hay không là việc của tòa án. Các lỗi của công cụ đã được ghi nhận sau khi thu thập trong các vụ án trước; vai trò của dấu niêm phong là làm cho hồ sơ phiên bản và hash nhị phân có thể bị phản bác công khai, chứ không phải để bảo đảm cho chính các công cụ.

6. **Bằng chứng có bị giả mạo TRƯỚC khi thu thập hay không.** Dấu niêm phong neo các byte từ thời điểm sao chép ảnh trở đi. Nếu một nghi phạm, một sĩ quan, hoặc một bên thứ ba đã thay đổi thiết bị nguồn trước khi nó được sao chép ảnh, dấu niêm phong không thể phát hiện điều đó — nó niêm phong các byte đã bị thay đổi với cùng tính toàn vẹn như khi niêm phong bản gốc. Giá trị của dấu niêm phong bắt đầu từ dấu thời gian sao chép ảnh.

7. **Phạm vi của lệnh khám xét có được tôn trọng hay không.** Phần phụ lục của lệnh khám xét định nghĩa những gì có thể được thu thập; dấu niêm phong ghi lại những gì ĐÃ được thu thập. Việc thu thập có vượt quá phạm vi lệnh khám xét hay không, một lần nữa, là một câu hỏi pháp lý với biện pháp khắc phục riêng (đề nghị loại trừ bằng chứng theo thủ tục thích hợp của bang).

8. **Tái nhận dạng bất kỳ bên tư nhân nào liên quan đến cuộc điều tra.** Dấu niêm phong từ chối công bố bất kỳ tên, định danh, hoặc dấu vân tay nào có thể tái nhận dạng một nghi phạm, bị cáo, nạn nhân, nhân chứng, hoặc người chiếm dụng cơ sở. Tham chiếu hồ sơ vụ án là đầu mối thích hợp cho các bên có tư cách pháp lý để định vị vụ án.

**Phần giới hạn trung thực ở trên là phần chịu lực của bộ kit này.** Các nhóm pháp y tin rằng niêm phong đồng nghĩa với việc được chấp nhận sẽ sử dụng nó làm lá chắn. Bộ kit phải nói thẳng: *đây là một nguyên thủy không thể chối bỏ cho thời điểm thu thập, không phải là chứng minh việc thu thập hợp pháp, sự đúng đắn về phương pháp luận, hay chuỗi bảo quản được tòa án công nhận.*

---

## Những gì bộ kit này PHẢI TỪ CHỐI niêm phong

Bộ kit được cấu hình để từ chối các mẫu sự kiện sau đây ngay cả khi một người dùng có thẩm quyền ký hợp lệ của cơ quan đệ trình chúng:

- **Định danh cá nhân của nghi phạm, bị cáo, nạn nhân, nhân chứng, hoặc bất kỳ bên thứ ba tư nhân nào.** Tham chiếu hồ sơ vụ án là đầu mối cho các bên có tư cách pháp lý; dấu niêm phong công khai không được phép trở thành chỉ mục tái nhận dạng.
- **Tên cá nhân của giám định viên pháp y hoặc nhân sự khác của cơ quan trong dấu niêm phong công khai.** Vai trò là công khai; các liên kết giữa người với vai trò được niêm phong riêng và có thể được khám phá theo thủ tục tòa án.
- **Hash ở cấp tập tin (hoặc dấu vân tay) của tài liệu nghi ngờ là lạm dụng tình dục trẻ em, mẫu sinh trắc học, hoặc bất kỳ dữ liệu tái nhận dạng người dễ tổn thương nào — kể cả bằng hash.** SHA-256 của một tập tin riêng lẻ là một định danh có thể tìm kiếm vĩnh viễn; việc công bố nó trên một sổ cái công khai có thể tái gây tổn thương cho đối tượng thông qua việc đối chiếu với các cơ sở dữ liệu riêng tư. Hash ở cấp ảnh (cấp ảnh pháp y) của toàn bộ ổ đĩa thì có thể chấp nhận; hash ở cấp tập tin của tài liệu như vậy KHÔNG BAO GIỜ được chấp nhận.
- **Kết quả giám định, cách giải thích, ý kiến, hoặc kết luận về ý nghĩa của các byte.** Dấu niêm phong neo NHỮNG BYTE GÌ đã được thu thập và VÀO LÚC NÀO. Việc giải thích thuộc về báo cáo giám định có thể khám phá, không phải trên một sổ cái công khai phát hiện được giả mạo.
- **Tuyên bố về tính chấp nhận được hoặc bất kỳ kết luận pháp lý nào khác** ("bằng chứng này có thể được chấp nhận," "lệnh khám xét là hợp pháp," "chuỗi bảo quản là đúng theo §X.Y"). Kết luận pháp lý là chức năng của tòa án.
- **Niêm phong bởi bất kỳ ai khác ngoài chủ thể được ủy quyền của cơ quan thu thập.** Một chuyên gia của bên bị có thể sử dụng bộ kit để niêm phong việc xác minh độc lập của riêng họ đối với bản kê khai; họ không được phép niêm phong việc thu thập GỐC dưới tên của cơ quan thu thập.
- **Các liên kết vai trò với cá nhân bên trong dấu niêm phong công khai.** Các liên kết được niêm phong trong một hồ sơ đồng hành riêng (được hash trong FACT 05) dưới sự kiểm soát truy cập của cơ quan.
- **Các sự kiện điều tra trước thu giữ hoặc trước lệnh khám xét.** Lời khai của người cung cấp tin, giám sát trước lệnh khám xét, đầu vào của việc xây dựng song song — không có gì trong số này thuộc về dấu niêm phong thu thập. Dấu niêm phong được giới hạn trong sự kiện thu thập.

Một sự từ chối tự nó có thể được niêm phong như một sự kiện ("Cơ quan này yêu cầu niêm phong X; bộ kit từ chối theo quy tắc từ chối Y"), tạo ra một hồ sơ công khai về việc lạm dụng đã được cố gắng.

---

## Những gì bộ kit này CÓ niêm phong

8 sự kiện tại thời điểm thu thập:

1. **Thông báo ví dụ** — tuyên bố bản công bố là một ví dụ (các chứng thực thực tế gỡ bỏ hoặc thay thế phần này).
2. **Bối cảnh thu thập** — định danh vụ án, trích dẫn lệnh khám xét, cơ quan thu thập, cơ quan yêu cầu, ngày/giờ thu giữ và thu thập, địa điểm thu thập (địa điểm thu giữ được biên soạn lại thành một hồ sơ đồng hành được niêm phong riêng để tránh tái nhận dạng cơ sở).
3. **Bản kê khai vật chứng** — theo từng mục ảnh pháp y: hash SHA-256, kích thước tập tin, định danh thiết bị nguồn được ẩn danh, phương pháp thu thập, định dạng ảnh pháp y.
4. **Phương pháp luận thu thập** — tên công cụ pháp y và phiên bản chính xác (với hash nhị phân của công cụ), nhãn hiệu/mẫu mã và firmware của bộ chặn ghi, tham chiếu xác minh NIST CFTT, quy trình xác minh được sử dụng, lựa chọn định dạng ảnh.
5. **Nhật ký chuỗi bảo quản** — dòng thời gian theo từng sự kiện từ thu giữ ban đầu đến kết thúc việc sao chép ảnh, người bảo quản được nhận dạng theo VAI TRÒ (không theo tên), với hash của các hồ sơ đồng hành được niêm phong riêng (liên kết vai trò với cá nhân, nhật ký GPS vận chuyển, nhật ký truy cập kho bằng chứng, ảnh chụp niêm phong chống giả mạo, v.v.).
6. **Trình độ giám định viên theo vai trò** — các chứng chỉ đang nắm giữ, tình trạng đào tạo tiếp tục, số lượng kinh nghiệm làm nhân chứng chuyên gia trước đó, mức độ tiếp xúc với Daubert, công bố xung đột lợi ích — tất cả ở cấp vai trò, không phải cá nhân.
7. **Hồ sơ công bố đồng hành và từ chối** — các điều tra song song, các thách thức lệnh khám xét đang chờ xử lý, các đề nghị về bằng chứng bị loại trừ, giao thức bộ lọc đặc quyền / nhóm taint đang có hiệu lực, các lần cố gắng thu thập trước đó, đánh giá bộ theo dõi lỗi của nhà cung cấp; danh sách rõ ràng các mẫu mà bộ kit đã từ chối niêm phong.
8. **Chủ thể ký** — nhận dạng cơ quan thu thập + người ký ở cấp vai trò (giám định viên trưởng) + người đồng ký ở cấp vai trò (giám sát viên đơn vị) + thông tin khóa mật mã.

Mỗi sự kiện kết thúc với quy ước cổng từ chối: *"Sự kiện này chỉ khẳng định X. Nó không khẳng định Y"* (trong đó Y là chế độ thất bại gần nhất từ phần "KHÔNG làm" ở trên).

---

## Những gì bộ kit này phòng vệ chống lại

- **Thay đổi âm thầm sau thu thập đối với một ảnh pháp y.** Bất kỳ thay đổi ở cấp byte nào đối với bất kỳ ảnh nào đều tạo ra một SHA-256 khác, và ảnh sau khi thay đổi sẽ không xác minh được dựa trên bản kê khai FACT 03 đã được niêm phong.
- **Tuyên bố rằng "các công cụ khác đã được sử dụng."** FACT 04 ghi lại các phiên bản công cụ chính xác với hash nhị phân của công cụ; các tuyên bố muộn hơn kiểu "chúng tôi thực sự đã sử dụng v4.7.0, không phải v4.7.1" có thể bị phản bác công khai.
- **Tuyên bố rằng bộ chặn ghi đã không được kích hoạt, hoặc đã sử dụng một mẫu khác.** FACT 04 đóng băng bản kê khai bộ chặn ghi.
- **Thay đổi nhật ký bảo quản.** Bất kỳ thay đổi nào đối với dòng thời gian sự kiện bảo quản FACT 05 (thêm, xóa, hoặc đánh lại dấu thời gian một sự kiện) đều thay đổi hash của FACT 05 và có thể được phát hiện công khai.
- **Thay thế chứng chỉ của một giám định viên khác.** FACT 06 đóng băng hồ sơ chứng chỉ cấp vai trò tại thời điểm thu thập.
- **Bỏ sót có chọn lọc các công bố đồng hành.** FACT 07 liệt kê các loại công bố được mong đợi; một loại trống phải được chứng thực một cách rõ ràng ("không có vào thời điểm thu thập"), do đó một tuyên bố muộn hơn rằng "chúng tôi không nhận ra điều đó là có liên quan" có thể bị phản bác công khai.
- **Các tuyên bố sau thu thập rằng giám định viên có một xung đột chưa được công bố.** Công bố xung đột của FACT 06 được đóng băng tại thời điểm thu thập; các thách thức muộn hơn có thể được kiểm tra dựa trên đó.

Bộ kit **không** phòng vệ chống lại sự hỏng hóc đương thời — một nhóm cố ý niêm phong siêu dữ liệu sai vào thời điểm thu thập tạo ra một dấu niêm phong hợp lệ mật mã của siêu dữ liệu sai. Nguyên thủy này thành thật về điều đó: nó là một nguyên thủy không thể chối bỏ cho các tuyên bố đương thời của cơ quan, không phải là chứng minh các tuyên bố đó là đúng.

---

## Các vụ án lịch sử hoặc gần như lịch sử mà bộ kit này có thể đã hỗ trợ

Bộ kit này có thể đã tạo ra một điểm neo hữu ích — *không phải một giải pháp* — trong các vụ án trước đây khi chuỗi bảo quản vật chứng số trở thành một vấn đề bằng chứng gây tranh cãi. Để tránh đặt tên cho các bị cáo (những người vẫn là bên tư nhân ngay cả khi đã bị kết án), những vụ này được mô tả theo loại vụ án, không theo cá nhân được nêu tên:

- **Tranh cãi về lỗi công cụ pháp y liên bang giữa thập niên 2010**, trong đó một công cụ sao chép ảnh pháp y được sử dụng rộng rãi đã được phát hiện, sau khi thu thập, có một lỗi trường hợp biên ảnh hưởng đến một loại phương tiện nguồn cụ thể. Một bản kê khai thu thập được niêm phong với dữ liệu phiên bản và hash nhị phân của công cụ được đóng băng sẽ cho phép bên bị và bên truy tố thống nhất chính xác phiên bản nào đã được sử dụng, loại bỏ một trục tranh chấp.

- **Nhiều vụ án cấp bang liên quan đến đầu ra trích xuất thiết bị di động đang tranh chấp**, nơi nhà cung cấp công cụ trích xuất sau đó đã phát hành một bản vá sửa lỗi và câu hỏi trở thành "lỗi có ảnh hưởng đến vụ án này hay không." Một sự kiện phương pháp luận được niêm phong cho phép câu hỏi được trả lời dựa trên dữ liệu phiên bản được đóng băng, thay vì dựa trên trí nhớ hiện tại của cơ quan về phiên bản nào đã được sử dụng.

- **Tranh chấp về việc bàn giao camera đeo người** trong các vụ án mà hệ thống dock của nhà cung cấp BWC sau đó bị cáo buộc đã cho phép sửa đổi cảnh quay khi truyền dữ liệu. Một bản kê khai được niêm phong của kho lưu trữ camera đeo người tại thời điểm cơ quan nhận được neo những byte mà cơ quan đã nhận được từ hệ thống dock; các chỉnh sửa muộn hơn ở phía cơ quan có thể được phát hiện công khai.

- **Tranh cãi về va chạm hash trong các vụ án pháp y máy tính**, nơi một chuyên gia của bên bị lập luận rằng MD5 (vẫn được sử dụng trong một số quy trình làm việc kế thừa) là không đủ. Một thu thập được niêm phong ghi lại CẢ MD5 và SHA-256 cho phép SHA-256 đứng vững ngay cả khi MD5 bị bác bỏ.

- **Tranh chấp về sự tiến hóa của phương pháp luận giám định giữa thu thập và xét xử.** Khi một vụ án nằm chờ giữa thu thập và xét xử trong nhiều năm, phương pháp luận từng là tiêu chuẩn vào thời điểm thu thập có thể đã bị thay thế vào thời điểm xét xử. Hồ sơ được niêm phong cho phép tòa án đánh giá phương pháp luận dựa trên tiêu chuẩn đương thời vào thời điểm thu thập, không phải dựa trên tiêu chuẩn muộn hơn.

Bộ kit sẽ KHÔNG giải quyết các tranh chấp cơ bản về tội hay vô tội trong bất kỳ loại vụ án nào kể trên. Nó sẽ giải quyết một tiểu tranh chấp về bằng chứng cụ thể: liệu các byte, công cụ, và quy trình có đúng như những gì cơ quan tuyên bố vào thời điểm cơ quan tuyên bố.

---

## Khi nào sử dụng bộ kit này

- Cơ quan của bạn có một SOP pháp y ổn định và muốn bổ sung một chứng thực công khai được neo bằng Bitcoin như một lớp phát hiện được giả mạo trên đỉnh chuỗi bảo quản giấy-và-chữ-ký hiện có.
- Bạn dự đoán vụ án này sẽ liên quan đến thách thức đáng kể của bên bị đối với bằng chứng pháp y (vụ án có rủi ro cao, phương pháp luận mới, các phiên bản công cụ đang tranh chấp, v.v.).
- Bạn có thể công bố tập sự kiện được liệt kê mà không phơi bày PII hoặc dữ liệu tái nhận dạng người dễ tổn thương. (Các quy tắc từ chối của bộ kit thực thi điều này; nếu sự kiện của bạn sẽ yêu cầu phá vỡ quy tắc từ chối, đừng sử dụng bộ kit.)
- Cố vấn pháp lý chung của cơ quan thu thập và văn phòng công tố đã xem xét kế hoạch công bố. Công bố công khai một sản phẩm mang định danh vụ án có hệ quả đối với các cuộc điều tra đang diễn ra; việc xem xét của cố vấn pháp lý không phải là tùy chọn.
- Quy tắc khám phá của bên bị trong khu vực pháp lý của bạn tương thích với việc cơ quan giữ riêng hồ sơ liên kết vai trò với cá nhân (được hash trong FACT 05). Nếu khu vực pháp lý của bạn yêu cầu công bố công khai tên giám định viên, bạn phải sửa đổi bộ kit cho phù hợp.

## Khi nào KHÔNG sử dụng bộ kit này

- **Không sử dụng như một sự thay thế cho tài liệu chuỗi bảo quản hiện có của cơ quan.** Bộ kit này là *bổ sung*, không thay thế. CMS, nhật ký bảo quản, và các nghĩa vụ sản xuất khám phá của cơ quan không thay đổi.
- **Không sử dụng nếu việc thu thập liên quan đến CSAM, mẫu sinh trắc học, hoặc dữ liệu tái nhận dạng người dễ tổn thương khác ở cấp tập tin.** Hash ở cấp ảnh của toàn bộ ổ đĩa thì có thể chấp nhận; hash ở cấp tập tin của tài liệu như vậy KHÔNG BAO GIỜ được chấp nhận, ngay cả dưới sự miễn trừ quy tắc từ chối. Nếu bạn không thể xây dựng một tập sự kiện mà không phá vỡ R3, đừng sử dụng bộ kit.
- **Không sử dụng để tuyên bố lệnh khám xét là hợp pháp, việc thu giữ là đúng đắn, hoặc bằng chứng có thể được chấp nhận** — bộ kit không thể làm điều đó, và quy tắc từ chối R5 sẽ từ chối bất kỳ tuyên bố nào như vậy.
- **Không sử dụng dưới áp lực để niêm phong trước khi việc thu thập hoàn tất.** Một dấu niêm phong thu thập một phần làm sai lệch tình trạng.
- **Không sử dụng để công bố tên cá nhân của giám định viên** trừ khi khu vực pháp lý của bạn yêu cầu cụ thể và các giám định viên đã đồng thuận cá nhân. Mặc định là công bố cấp vai trò.
- **Không sử dụng trong các vụ án được niêm phong hoặc dưới niêm phong** mà không có sự cho phép rõ ràng của tòa án. Việc công bố một định danh vụ án trên Bitcoin là không thể đảo ngược; nếu vụ án sau đó được niêm phong, dấu niêm phong công khai không thể được thu hồi. Bộ kit dành cho các cuộc thu thập có hồ sơ công khai mà thôi.
- **Không sử dụng như sân khấu hợp pháp hóa.** Một dấu niêm phong của một thu thập có lỗi là một hồ sơ công khai vĩnh viễn về các lỗi đó, không phải là sự phòng vệ chống lại chúng. Nguyên thủy này cắt cả hai chiều; đó là sự trung thực của nó.

## Cách fork bộ kit này cho một cuộc thu thập thực

```bash
cp -r ~/Genesis/myriam-kit/examples/court-evidence-custody ~/case-FICT-CR-XXXX
cd ~/case-FICT-CR-XXXX
$EDITOR facts/*.txt    # replace fictional content with real
                       # apply refusal rules R1-R8 throughout
bash build/seal.sh     # seal AT or just after completion of imaging
python3 build/verify.py
```

**Thời điểm quan trọng:** niêm phong VÀO hoặc ngay sau khi kết thúc việc sao chép ảnh (sự kiện E17 của FACT 05 trong dòng thời gian ví dụ). Một dấu niêm phong trong khi sao chép ảnh tạo ra hồ sơ thu thập một phần; một dấu niêm phong muộn hơn nhiều tạo ra một khoảng trống trong đó cơ quan có thể đã thay đổi các ảnh. Cửa sổ đúng là ngay sau khi xác minh ảnh hoàn tất cho mục cuối cùng trong tập vật chứng.

**Đánh giá quan trọng:** trước khi niêm phong, hãy chạy bản công bố qua một giám định viên pháp y thứ hai (không phải người dẫn dắt) và qua cố vấn pháp lý của cơ quan. Một khi đã niêm phong, bản công bố là vĩnh viễn.

## Tích hợp với hạ tầng chuỗi bảo quản hiện có

- **Hệ thống Quản lý Hồ sơ Vụ án của Cơ quan (CMS).** CMS vẫn là hệ thống hồ sơ chính của cơ quan. Dấu niêm phong không thay thế CMS; nó cam kết với các byte và phương pháp luận mà CMS ghi lại, do đó các sửa đổi CMS sau thực tế có thể được phát hiện công khai.
- **Quy tắc Bằng chứng Liên bang / Daubert / các bộ luật bằng chứng của bang.** Dấu niêm phong đóng góp vào hồ sơ xác thực FRE 901 bằng cách cung cấp tính toàn vẹn phát hiện được giả mạo. Nó KHÔNG đáp ứng FRE 702 / Daubert một cách riêng lẻ; độ tin cậy của phương pháp luận vẫn được kiểm tra tại phiên điều trần về bằng chứng.
- **Khám phá của bên bị (FRCP 16, Brady, Giglio, và các tương đương ở bang).** Các hồ sơ đồng hành được hash trong FACT 05 (liên kết vai trò với cá nhân, nhật ký bảo quản, ảnh chụp niêm phong chống giả mạo, v.v.) vẫn tuân theo khám phá thông thường. Dấu niêm phong neo những gì các hồ sơ đó tuyên bố tại thời điểm thu thập, do đó một tuyên bố muộn hơn rằng "hồ sơ khác vào thời điểm đó" có thể bị phản bác công khai.
- **Kiểm tra Công cụ Pháp y Máy tính của NIST (CFTT).** Bộ kit tham chiếu các nhật ký xác minh CFTT trong FACT 04 / FACT 05; tham chiếu là một hash, không phải bản thân nhật ký, do đó các quy trình CFTT không bị ảnh hưởng.
- **Trung gian được tòa chỉ định và chuyên gia của bên bị.** Cả hai đều có thể hash lại các ảnh pháp y mà họ nhận được trong khám phá dựa trên bản kê khai FACT 03, độc lập với bất kỳ sự hợp tác nào của cơ quan. Đây là giá trị bổ sung chính của bộ kit cho phía bên bị.
- **Xem xét phúc thẩm.** Nhiều năm sau, một người xem xét pháp y phúc thẩm có thể xác minh phương pháp luận thu thập gốc dựa trên hồ sơ FACT 04 được niêm phong, thay vì dựa trên hồi tưởng hiện tại có thể đã tiến hóa của cơ quan.

## Những gì bộ kit này KHÔNG thay thế

- Quy tắc Bằng chứng Liên bang (hoặc bất kỳ bộ luật bằng chứng nào của bang).
- Tiêu chuẩn độ tin cậy Daubert / Frye cho lời khai chuyên gia.
- SOP pháp y và CMS của cơ quan.
- Nghĩa vụ khám phá của bên bị theo FRCP 16 / Brady / Giglio / các tương đương ở bang.
- Lệnh tòa, đề nghị loại trừ bằng chứng, phiên điều trần về bằng chứng, hoặc bất kỳ quy trình do tòa quản lý nào khác.
- NIST CFTT hoặc bất kỳ chế độ kiểm tra công cụ nào khác.
- Giao thức bộ lọc đặc quyền / nhóm taint của cơ quan.

## Tại sao bộ kit này tồn tại trong v0.4.0+

Đây là ví dụ thực hành thứ 8 được phát hành cùng với myriam-kit. Nó tuân theo cấu trúc ưu tiên ràng buộc (constraint-first) đã được xác thực bởi nghiên cứu tự động được ghi nhận trong `~/Genesis/calc/PROMPT_LIBRARY_v0.md` — biến thể prompt ưu tiên ràng buộc đã đạt điểm cao nhất trên một thước đo có trọng số xuyên qua nhiều miền ví dụ. Các phần mở đầu là các phần chịu lực của bộ kit; nội dung bản kê khai là phần dễ.

Thiết kế của bộ kit có ý thức bảo thủ về việc công bố tên giám định viên và quyết liệt trong việc tuyên bố từ chối "việc này không thiết lập tính chấp nhận được". Cộng đồng pháp y có một lịch sử được ghi nhận về việc bị tấn công vì công việc pháp y của họ; bộ kit mặc định ở vị trí an toàn hơn cho giám định viên. Các cơ quan trong các khu vực pháp lý mà việc nêu tên cá nhân công khai là bắt buộc có thể sửa đổi bản fork của họ cho phù hợp, nhưng sự từ chối mặc định ưu tiên cho sự an toàn của giám định viên.

## Giấy phép

Phạm vi công cộng (CC0). Hãy fork nó. Không yêu cầu ghi nhận.
