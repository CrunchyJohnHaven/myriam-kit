*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

# Bộ Công Cụ Niêm Phong Tiền-Chứng Nhận Kiểm Phiếu Bầu Cử

Một ví dụ myriam-kit chìa-khóa-trao-tay dành cho các hội đồng kiểm phiếu cấp quận, các cơ quan bầu cử cấp tiểu bang, và các quan sát viên liêm chính bầu cử muốn công bố một con dấu được neo vào Bitcoin, có tính minh chứng can thiệp, của một kết quả kiểm phiếu tại đúng thời điểm chứng nhận.

**Đóng** [vấn đề số 4](https://github.com/CrunchyJohnHaven/myriam-kit/issues/4).

---

## Bộ công cụ này KHÔNG làm những gì (đọc trước)

Con dấu là một dấu thời gian mã hóa của những gì đã được chứng nhận. Nó không thể xác minh được liệu những gì đã được chứng nhận là đúng hay không. Các kiểu thất bại sau đây nằm **ngoài phạm vi của con dấu**:

1. **Sự xâm phạm máy bỏ phiếu.** Nếu firmware đã bị giả mạo hoặc tổng số phiếu bị đếm sai, con dấu sẽ neo một con số sai với mức độ liêm chính cao. Con dấu quan sát đầu ra của hệ thống tổng hợp; nó không có khả năng nhìn vào bên trong hệ thống.

2. **Đàn áp cử tri / tước quyền bầu cử có cấu trúc.** Việc đóng cửa các điểm bỏ phiếu, sự bất bình đẳng về luật ID, thiên lệch trong tỷ lệ từ chối phiếu bầu qua thư, và việc thanh lọc danh sách đăng ký đều nằm ở thượng nguồn của việc chứng nhận. Con dấu ghi lại những lá phiếu đã được đếm, không phải những lá phiếu lẽ ra phải được đếm.

3. **Thông tin sai lệch về bầu cử.** Con dấu không phán xét các tuyên bố về cuộc bầu cử do ứng cử viên, truyền thông, hoặc các nền tảng đưa ra. Một chứng nhận đã được niêm phong có thể được trích dẫn trong một câu chuyện thông tin sai lệch dễ dàng như được dùng để phản bác nó. Các dấu thời gian mã hóa mang tính trung lập về nội dung.

4. **Gian lận tiền-chứng nhận trong quá trình thu thập hoặc kiểm đếm phiếu.** Những sai phạm trong việc thu phiếu, sự giả mạo hộp bỏ phiếu, các đứt gãy chuỗi-giám-sát trong cửa sổ kiểm đếm — tất cả đều xảy ra trước thời điểm niêm phong. Con dấu không thể phát hiện chúng một cách hồi tố.

5. **Sự cưỡng ép đối với cơ quan chứng nhận.** Một chứng nhận bị cưỡng ép sẽ tạo ra một con dấu mã hóa hợp lệ của một kết quả bị cưỡng ép. Con dấu xác minh rằng một quan chức đã ký, không phải tại sao.

6. **Những chứng nhận sai mà sau này không bao giờ được sửa chữa.** Giá trị của con dấu phụ thuộc vào một quy trình tìm kiếm sự thật về sau (kiểm toán, kiểm phiếu lại, kiện tụng) mà con dấu có thể được so sánh với. Nếu không có quy trình nào như vậy được tiến hành, con dấu sẽ đứng vững như là bản ghi duy nhất và có thể đóng băng sai sót.

7. **Các bất thường thống kê và phát hiện mẫu hình.** Con dấu không gắn cờ các biên độ không hợp lý, các bất thường về địa lý, hoặc các sai lệch theo định luật Benford. Đó là những nhiệm vụ phân tích trên dữ liệu đã được niêm phong, không phải là thuộc tính của con dấu.

8. **Các cuộc đua dưới-lá-phiếu với dấu vết kiểm toán mỏng.** Các cuộc đua nhỏ hơn có các kích hoạt kiểm phiếu lại yếu hơn; một con dấu đơn lẻ không thể bao phủ một cách có ý nghĩa tất cả các cuộc đua trên một lá phiếu mà không có phạm vi theo từng cuộc đua.

**Mục giới-hạn-trung-thực ở trên là phần chịu lực của bộ công cụ này.** Những quan chức tin rằng việc niêm phong tương đương với tính chính danh sẽ sử dụng nó như một tấm khiên. Bộ công cụ phải nói thẳng: đây là một *bản nguyên-thủy phủ-quyết-không-được cho thời điểm chứng nhận*, không phải là một bằng chứng về tính đúng đắn của cuộc bầu cử.

---

## Những gì bộ công cụ này BẮT BUỘC TỪ CHỐI niêm phong

Bộ công cụ được cấu hình để từ chối các mẫu hình sự kiện sau đây ngay cả khi một người dùng có thẩm quyền ký hợp lệ gửi chúng:

- **Định danh cử tri cá nhân.** Không có sự kiện nào được phép nêu tên một cử tri, liên kết một lá phiếu với một cử tri, hoặc tiết lộ bất kỳ trường nào có thể tái-định-danh một người.
- **Các quyết định khớp-chữ-ký từng-lá-phiếu.** Chứa đầy PII; việc niêm phong tạo ra các bản ghi vĩnh viễn về các quyết định mà sau này có thể bị thách thức.
- **Bất kỳ sự kiện nào mà việc công bố sẽ định danh một cử tri dễ tổn thương.** Bao gồm các kết quả cấp khu vực bỏ phiếu trong các khu vực bỏ phiếu nhỏ đến mức lựa chọn bỏ phiếu có thể suy luận được (thường là <50 lá phiếu).
- **Các kết quả kiểm phiếu được niêm phong trước khi tất cả các lá phiếu được đếm.** Bộ công cụ từ chối các con số đếm một phần được trình bày như là "kết quả kiểm phiếu". Tiền-chứng nhận có nghĩa là *tất cả các lá phiếu đã được đếm, trước khi chứng nhận chính thức* — không phải *trong khi đang đếm*.
- **Các chứng nhận tạm thời hoặc có điều kiện.** Con dấu phải phản ánh một sự kiện, không phải một điều kiện.
- **Các con số đếm loại trừ các nhóm đang chờ kiện tụng** mà không có một sự-kiện-bạn-đồng-hành đã được niêm phong rõ ràng tiết lộ sự loại trừ đó.
- **Việc niêm phong bởi bất kỳ ai khác ngoài cơ quan chứng nhận** cho khu vực pháp lý đó.

Một sự từ chối tự nó có thể được niêm phong như một sự kiện ("Cơ quan này đã yêu cầu niêm phong X; bộ công cụ đã từ chối theo quy tắc từ chối Y"), tạo ra một bản ghi công khai về việc cố gắng lạm dụng.

---

## Những gì bộ công cụ này CÓ niêm phong

8 sự kiện tại thời điểm chứng nhận:

1. **Thông báo ví dụ** — tuyên bố ấn phẩm là một ví dụ (các chứng thực thực tế sẽ loại bỏ hoặc thay thế điều này).
2. **Định danh khu vực pháp lý** — quận, ngày bầu cử, cơ quan chứng nhận, các quan chức chứng nhận theo tên + vai trò.
3. **Kết quả kiểm phiếu đã chứng nhận** — tổng số phiếu theo từng cuộc đua theo từng ứng cử viên + phiếu thừa/thiếu + phiếu ghi-vào.
4. **Hạch toán phiếu bầu và đối chiếu** — tổng số đã bỏ, tổng số đã tổng hợp, tổng số bị từ chối theo danh mục, phân tích theo phương thức, mẫu số cử tri-đã-đăng-ký.
5. **Bản kê khai thiết bị và dấu vết kiểm toán** — mô hình máy tổng hợp + băm firmware, băm tệp CVR, băm kho ảnh-lá-phiếu, băm nhật ký giám sát, băm chính sách khớp-chữ-ký.
6. **Ngưỡng và kích hoạt tại thời điểm chứng nhận** — ngưỡng khớp-chữ-ký đang có hiệu lực, các ngưỡng kích hoạt kiểm phiếu lại, các biên độ thực tế theo từng cuộc đua, cam kết hạt-giống RLA.
7. **Các tiết lộ đồng-hành và bản ghi từ chối** — các vụ kiện đang chờ xử lý, các bất thường hậu-kiểm-đếm đang được xem xét, các nhóm bị loại trừ, các thành viên hội đồng bất đồng; danh sách rõ ràng các mẫu hình mà bộ công cụ đã từ chối niêm phong.
8. **Bên chủ thể ký** — định danh Hội đồng Kiểm phiếu + tên và đảng của mỗi người ký + thông tin khóa mã hóa.

Mỗi sự kiện kết thúc với quy ước cổng-từ-chối: *"Sự kiện này chỉ khẳng định X. Nó không khẳng định Y"* (trong đó Y là kiểu thất bại gần nhất từ phần "KHÔNG làm" ở trên).

---

## Bộ công cụ này phòng vệ chống lại những gì

- **Việc sửa đổi âm thầm hậu-chứng-nhận đối với tổng số phiếu** — bất kỳ thay đổi số nguyên nào đối với FACT 03 đều tạo ra một SHA-256 khác, gốc Merkle khác, và làm thất bại việc xác minh OTS.
- **"Các lá phiếu được tìm thấy" bị âm thầm hấp thụ** — số học đối chiếu FACT 04 được cố định tại thời điểm chứng nhận.
- **Các tuyên bố về thay-thế-firmware** — FACT 05 đóng băng bản kê khai thiết bị tại thời điểm chứng nhận.
- **Thay-thế-tạo-phẩm-kiểm-toán hậu-chứng-nhận** — bản kê khai băm của FACT 05 bắt được bất kỳ thay đổi hậu-chứng-nhận nào đối với CVR, ảnh lá phiếu, nhật ký giám sát, hoặc chính sách khớp-chữ-ký.
- **Việc tái-định-nghĩa ngưỡng và kích hoạt** — FACT 06 đóng băng các quy tắc đang có hiệu lực tại thời điểm chứng nhận (ngưỡng khớp-chữ-ký, các kích hoạt kiểm phiếu lại, giới hạn rủi ro RLA).

## Các trường hợp lịch sử hoặc gần-lịch sử mà bộ công cụ đã có thể giúp ích

Bộ công cụ đã có thể tạo ra một mỏ neo hữu ích — *không phải một biện pháp khắc phục* — trong các trường hợp liên quan đến:

- **Quận Antrim, Michigan (2020).** Kết quả không-chính-thức ban đầu cho thấy một sự hoán đổi ứng cử viên mà sau đó được sửa thành kết quả ngược lại. Một con dấu trước-khi-sửa-chữa sẽ cung cấp một tham chiếu công khai về những gì thông báo gốc đã nói so với những gì sự sửa chữa đã nói, với cả hai đều được chứng thực mã hóa.
- **Quận Maricopa, Arizona (2020–2022).** Nhiều lần lặp lại của các tổng số đã được kiểm phiếu lại/tái-xem-xét đã lưu hành. Một con dấu của thời điểm chứng nhận sẽ cung cấp một điểm tham chiếu rõ ràng để so sánh từng lần đếm tiếp theo với nó.
- **Florida 2000 (cuộc kiểm phiếu Bush v. Gore).** Các tổng số đã chứng nhận của từng quận đã thay đổi dưới áp lực kiểm phiếu lại; một con dấu trước-kiểm-phiếu-lại theo từng quận sẽ bảo tồn những gì mỗi quận đã chứng nhận trước khi các thủ tục kiểm phiếu lại thủ công bắt đầu.
- **Nhiều cuộc bầu cử nước ngoài với những "sửa chữa" hậu-chứng-nhận có tài liệu.** Không phụ thuộc khu vực pháp lý.

Bộ công cụ sẽ KHÔNG giải quyết các tranh chấp căn bản về tính liêm chính của máy năm 2020, các tranh chấp về chính sách phiếu bầu qua thư, hoặc bất kỳ cuộc bầu cử nào mà câu hỏi cốt lõi là sự thật bị tranh cãi chứ không phải bản ghi bị tranh cãi.

## Khi nào nên sử dụng bộ công cụ này

- Khu vực pháp lý của bạn có một quy trình chứng nhận ổn định, đã được kiểm toán và muốn thêm một mỏ neo công khai không-thể-thay-đổi.
- Bạn dự đoán sẽ có sự xem xét kỹ lưỡng hậu-chứng-nhận và muốn có một điểm tham chiếu có-tính-minh-chứng-can-thiệp.
- Bạn có thẩm quyền pháp lý để công bố tập hợp sự kiện được liệt kê mà không tiết lộ PII.
- Bạn có một quy trình kiểm toán song song hoặc RLA để con dấu có thể được so sánh với đầu ra của việc tìm kiếm sự thật.

## Khi nào KHÔNG nên sử dụng bộ công cụ này

- **Không sử dụng như một sự thay thế cho kiểm toán giới-hạn-rủi-ro, kiểm phiếu lại thủ công, hoặc kiểm toán hậu-bầu-cử.** Bộ công cụ này là *bổ sung*, không phải thay thế.
- **Không sử dụng nếu quan chức chứng nhận không phải là người ra quyết định thực sự** (tạo ra sự quy gán sai).
- **Không sử dụng giữa-kỳ-tổng-hợp.** Bộ công cụ là dành cho thời điểm chứng nhận cụ thể. Các con dấu đếm một phần tạo ra các điểm tham chiếu gây hiểu lầm.
- **Không sử dụng để tuyên bố rằng cuộc bầu cử là công bằng, chính xác, hoặc chính danh** — nó không thể làm điều đó.
- **Không sử dụng dưới áp lực để niêm phong sớm hơn thời điểm chứng nhận, hoặc để bỏ qua một tiết lộ sự-kiện-bạn-đồng-hành.** Hãy từ chối, và niêm phong sự từ chối.
- **Không sử dụng như sân khấu chính danh.** Một con dấu của một kết quả kiểm phiếu gian lận là một bản ghi công khai vĩnh viễn về sự gian lận, không phải là một sự bảo vệ cho nó. Bản nguyên-thủy cắt cả hai chiều; đó là sự trung thực của nó.

## Cách fork bộ công cụ này cho một chứng nhận thực tế

```bash
cp -r ~/Genesis/myriam-kit/examples/election-tally-precertification ~/my-county-2026
cd ~/my-county-2026
$EDITOR facts/*.txt    # replace fictional content with real
bash build/seal.sh     # seal AT or after the official certification signature
python3 build/verify.py
```

**Thời điểm tới hạn:** niêm phong TẠI thời điểm chứng nhận, KHÔNG phải trước đó. Một con dấu trước khi chứng nhận chính thức tạo ra một bản ghi giả-tích-cực "đây là kết quả chính thức". Một con dấu sau đó là sự phủ-quyết-không-được thông thường.

## Tích hợp với cơ sở hạ tầng bầu cử hiện có

- **Các Hội đồng Bầu cử Tiểu bang / chứng nhận EAC.** Bộ công cụ công bố cùng với tài liệu chứng nhận chính thức. Nó không thay thế việc chứng nhận theo luật định.
- **Các kiểm toán giới-hạn-rủi-ro.** Băm CVR trong FACT 05 là cùng một băm mà công cụ RLA tiêu thụ. Con dấu ràng buộc CVR đã được kiểm toán với tổng số đã được chứng nhận.
- **Các thủ tục kiểm phiếu lại.** Một cuộc kiểm phiếu lại được kích hoạt theo luật của tiểu bang sẽ tạo ra một tập hợp sự kiện đã được niêm phong MỚI (dấu thời gian khác, các băm khác, cùng một khu vực pháp lý). Cả hai con dấu cùng tồn tại; không cái nào ghi đè lên cái nào. Sự khác biệt giữa các con dấu là bản ghi công khai về những gì cuộc kiểm phiếu lại đã thay đổi.
- **Ngôn ngữ Đánh dấu Bầu cử (EML) và Định dạng Dữ liệu Chung (CDF).** Phần thân sự kiện nên có thể được dẫn xuất từ các đầu ra EML/CDF hiện có của khu vực pháp lý để giữ cho bộ công cụ không phụ thuộc vào định dạng dữ liệu.
- **Ký kết bởi hội đồng kiểm phiếu lưỡng đảng.** Biến thể đa-chữ-ký được khuyến nghị cho các khu vực pháp lý có hội đồng kiểm phiếu cân-bằng-đảng.

## Những gì bộ công cụ này KHÔNG thay thế

- Chứng nhận theo luật định theo luật bầu cử tiểu bang
- Chứng nhận hệ thống bỏ phiếu của EAC
- Các kiểm toán giới-hạn-rủi-ro / kiểm phiếu lại thủ công
- Các thủ tục kiểm phiếu lại và kiểm toán hậu-bầu-cử
- Các lệnh tòa hoặc kiện tụng tranh-chấp-bầu-cử

## Tại sao bộ công cụ này tồn tại trong v0.3.0+

Đây là ví dụ được thực hiện thứ 6 được vận chuyển cùng với myriam-kit. Bộ công cụ được sản xuất thông qua một quy trình tự-nghiên-cứu kiểu Karpathy được ghi lại trong `~/Genesis/calc/AUTORESEARCH_RESULTS_v0.md`. Ba biến thể prompt (mô phỏng / nguyên-lý-đầu-tiên / ràng-buộc-trước) đã tạo ra các phác thảo bộ công cụ song song; biến thể ràng-buộc-trước đã đạt điểm cao nhất trên một thang đánh giá có trọng số, và bộ công cụ cuối cùng tổng hợp cấu trúc của nó với sự gắn kết của biến thể mô phỏng và chi tiết vận hành của biến thể nguyên-lý-đầu-tiên.

Bản thân quy trình tự-nghiên-cứu được ghi lại như một mẫu prompt trong `~/Genesis/calc/PROMPT_LIBRARY_v0.md` để sử dụng trong tương lai.

## Giấy phép

Phạm vi công cộng (CC0). Hãy fork nó. Không yêu cầu ghi nhận.
