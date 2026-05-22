# Bộ công cụ Tiền đăng ký Thử nghiệm Thuốc

*Bản dịch tiếng Việt — đối với phiên bản gốc bằng tiếng Anh, xem [README.md](README.md)*

Một ví dụ myriam-kit sẵn sàng sử dụng dành cho các nhà tài trợ thử nghiệm
lâm sàng và nhà nghiên cứu học thuật muốn tiền đăng ký một thử nghiệm theo
cách có thể phát hiện sự can thiệp và được neo vào Bitcoin, **bổ sung cho**
việc đăng ký tại ClinicalTrials.gov, EU CTR, hoặc các cơ quan đăng ký khác
theo từng khu vực pháp lý.

## Tại sao tiền đăng ký *bổ sung* theo MYRIAM?

Các cơ quan đăng ký thử nghiệm hiện có (ClinicalTrials.gov, EU CTR, ISRCTN)
có những điểm yếu về tính toàn vẹn đã được ghi nhận:

- ClinicalTrials.gov cho phép các nhà tài trợ cập nhật điểm kết thúc, tính
  toán cỡ mẫu, và kế hoạch phân tích **sau** khi đăng ký gốc, với ngày sửa
  đổi hiển thị trong cơ quan đăng ký nhưng thay đổi *nội dung* không phải
  lúc nào cũng được neo bằng mật mã.
- Một số nghiên cứu lớn (Goldacre et al., 2019; Mathieu et al., 2009) đã
  ghi nhận hiện tượng đổi điểm kết thúc post-hoc một cách có hệ thống trên
  toàn lĩnh vực.
- Sự thực thi biên tập của các tạp chí (CONSORT, ICMJE) bắt được một số
  trường hợp; nhiều trường hợp khác lọt qua.

Một con dấu MYRIAM lấp đầy khoảng trống này. Gốc Merkle + biên nhận OTS
Bitcoin khiến bất kỳ thay đổi post-hoc nào đối với điểm kết thúc chính
*đã tiền đăng ký*, kế hoạch phân tích thống kê, hoặc danh sách phân nhóm
đều có thể phát hiện được bằng mật mã. Con dấu khó retcon về mặt pháp y
hơn chính cơ quan đăng ký.

Bộ công cụ này là một **bổ sung cho**, không phải thay thế cho, các cơ
quan đăng ký theo khu vực pháp lý. Một thử nghiệm thực tế nên đăng ký tại
cơ quan đăng ký phù hợp VÀ niêm phong theo MYRIAM.

## Bộ công cụ này phòng vệ chống lại điều gì

Các trường hợp tử vong lịch sử mà bộ công cụ này có thể đã giúp ích:

- **Vioxx (Merck, 2004)**: các biến cố tim mạch là một điểm kết thúc
  tiền đăng ký trong thử nghiệm APPROVe nhưng phân tích được công bố đã
  sử dụng một mốc cắt làm giảm thiểu mức độ tác hại biểu kiến. Một con
  dấu của mốc cắt tiền đăng ký sẽ làm cho việc thay đổi mốc cắt post-hoc
  trở nên công khai phát hiện được trước khi bài báo được công bố.
- **Paxil/Study 329 (GSK/SmithKline, 2001)**: dữ liệu thử nghiệm tiêu
  cực về xu hướng tự sát ở vị thành niên đã được tái khung qua phân tích
  post-hoc. Tiền đăng ký niêm phong các điểm kết thúc sẽ làm cho việc
  tái khung này trở nên công khai phát hiện được.
- **Nhiều thử nghiệm ung thư** trong đó điểm kết thúc sống còn đã bị
  thay bằng điểm kết thúc thay thế (sống còn không tiến triển bệnh, tỷ
  lệ đáp ứng) khi lợi ích sống còn không đạt được.

**Các kiểu thất bại mà con dấu trực tiếp bắt được:**

- **Đổi điểm kết thúc**: nâng cấp post-hoc một điểm kết thúc thứ cấp
  thành "chính" khi điểm chính thực tế thất bại. FACT 05 của con dấu
  chứa điểm kết thúc chính đã tiền đăng ký; điểm kết thúc chính được
  công bố phải khớp.
- **Chọn lọc kết quả thuận lợi**: chỉ báo cáo có chọn lọc các phân tích
  có kết quả. FACT 06 chứa toàn bộ kế hoạch phân tích đã tiền đăng ký;
  các phân tích được công bố phải bao gồm tất cả các phân tích đã tiền
  đăng ký.
- **Khai thác phân nhóm post-hoc**: tuyên bố "thuốc có tác dụng đối với
  phân nhóm X" sau khi đã xem dữ liệu. FACT 07 chứa danh sách phân nhóm
  đã tiền đăng ký; bất kỳ phân nhóm nào khác phải được dán nhãn post-hoc.
- **Sửa đổi cỡ mẫu**: tăng cỡ mẫu sau khi nhìn thấy xu hướng tạm thời.
  FACT 06 chứa cỡ mẫu đã tiền đăng ký và phép tính công suất.
- **Âm thầm loại bỏ các điểm kết thúc thứ cấp bất tiện**: FACT 05 sắp
  xếp trước các điểm kết thúc thứ cấp cho việc kiểm định phân cấp; bất
  kỳ sự sắp xếp lại hoặc loại bỏ nào đều có thể phát hiện được.
- **Đè nén kết quả tiêu cực**: FACT 08 chứa cam kết công bố; việc không
  công bố trong cửa sổ đã cam kết là công khai nhìn thấy được.

**Các kiểu thất bại KHÔNG được bao phủ:**

- Hành vi sai trái trong việc thực hiện thử nghiệm (làm giả dữ liệu,
  ghi danh gian lận). Con dấu neo *kế hoạch*, không phải *việc thực hiện*.
- Báo cáo có chọn lọc trong các ấn phẩm bao gồm tất cả các phân tích đã
  tiền đăng ký nhưng diễn giải theo hướng có lợi. Con dấu bắt được những
  gì còn thiếu; nó không bắt được thiên kiến diễn giải.
- Tổn hại cho bệnh nhân trong chính quá trình thử nghiệm. Con dấu là
  quy định và bằng chứng; nó không làm giảm rủi ro thực hiện thử nghiệm.

## Khi nào sử dụng bộ công cụ này

Bạn nên cân nhắc niêm phong một tiền đăng ký nếu:

- Bạn đang tài trợ hoặc thực hiện một thử nghiệm lâm sàng — Pha 1 đến
  Pha 4 — sẽ được sử dụng để cung cấp thông tin cho các quyết định y
  tế hoặc quy định.
- Bạn sẵn sàng bị ràng buộc công khai với thiết kế, các điểm kết thúc,
  và kế hoạch phân tích đã tiền đăng ký.
- Bạn có thể đối phó với hậu quả: nếu thử nghiệm thất bại trên các điểm
  kết thúc đã tiền đăng ký, bạn không thể âm thầm retcon sang một điểm
  kết thúc khác đã thành công.
- Bạn đang tham gia một văn hóa nghiên cứu (y học học thuật, các nhóm
  hợp tác, nghiên cứu được NIH tài trợ) trong đó tính toàn vẹn của tiền
  đăng ký ngày càng được đòi hỏi.

Bộ công cụ này *đặc biệt* có giá trị đối với:

- Các thử nghiệm do nhà nghiên cứu khởi xướng tại các tổ chức học thuật
  (nơi áp lực từ nhà tài trợ thay đổi điểm kết thúc post-hoc là có
  thật nhưng nhà nghiên cứu học thuật có động lực về danh tiếng để
  chống lại).
- Các thử nghiệm khoa học mở và các nghiên cứu khoa học công dân.
- Các thử nghiệm tái sử dụng thuốc tại các công ty công nghệ sinh học
  nhỏ không có thành tích thực hiện thử nghiệm lâu dài.
- Bất kỳ thử nghiệm nào nhằm cung cấp thông tin cho các đệ trình quy
  định mà sau này có thể có các lập luận "chúng tôi chưa bao giờ nói
  điều đó".

## Khi nào KHÔNG sử dụng bộ công cụ này

KHÔNG sử dụng bộ công cụ này nếu:

- Quy trình thử nghiệm thực sự vẫn đang thay đổi. Tiền đăng ký khi
  quy trình đã hoàn thiện, không phải trước đó.
- Bạn không thể cam kết công bố kết quả bất kể hướng nào. Con dấu làm
  cho việc không công bố trở nên công khai phát hiện được.
- Thử nghiệm liên quan đến bí mật cạnh tranh công nghiệp ngăn cản bạn
  công khai kế hoạch phân tích. Con dấu làm cho kế hoạch phân tích trở
  thành hồ sơ công khai vĩnh viễn; không có cách nào để niêm phong điều
  gì đó một cách riêng tư.
- Bạn không có sự chấp thuận pháp lý và đạo đức về quy trình. Con dấu
  ghi nhận quy trình NHƯ bạn đã niêm phong; nó không thể được IRB hoặc
  ủy ban đạo đức xác nhận hồi tố.

## Cách fork bộ công cụ này cho tiền đăng ký thực

```bash
# 1. Sao chép ví dụ này
cp -r ~/Genesis/myriam-kit/examples/drug-trial-preregistration ~/my-trial
cd ~/my-trial

# 2. Thay thế nội dung hư cấu bằng nội dung quy trình thử nghiệm thực.
# Mỗi fact tương ứng với một phần của tiền đăng ký tiêu chuẩn:
$EDITOR facts/01_example_notice.txt   # THAY THẾ bằng tuyên bố bìa thực
$EDITOR facts/02_trial_identification.txt
$EDITOR facts/03_hypothesis.txt
$EDITOR facts/04_study_design.txt
$EDITOR facts/05_endpoints.txt       # CHÍNH + THỨ CẤP + KHÁM PHÁ
$EDITOR facts/06_statistical_analysis_plan.txt
$EDITOR facts/07_subgroups_and_exclusions.txt
$EDITOR facts/08_commitments_and_principal.txt

# 3. Cập nhật site/index.html để phản ánh thử nghiệm thực.

# 4. Niêm phong (TRƯỚC KHI việc ghi danh bắt đầu, TRƯỚC KHI khóa cơ sở dữ liệu):
bash build/seal.sh

# 5. Xác minh tại chỗ:
python3 build/verify.py

# 6. Triển khai:
#    - Công bố URL của con dấu trên trang web của nhà tài trợ thử nghiệm VÀ
#    - Thêm IPFS CID vào trường "Description" hoặc "References" trong hồ sơ
#      ClinicalTrials.gov của thử nghiệm, để hồ sơ đăng ký tham chiếu chéo
#      đến con dấu mật mã.
```

**THỜI ĐIỂM QUAN TRỌNG**: con dấu phải được tạo TRƯỚC KHI việc ghi danh
bắt đầu. Một tiền đăng ký được niêm phong sau khi bệnh nhân đầu tiên được
ghi danh là yếu hơn nhiều về mặt pháp y. Lý tưởng là niêm phong vào thời
điểm IRB phê duyệt.

## Tích hợp với cơ sở hạ tầng tiền đăng ký hiện có

Bộ công cụ này được thiết kế để kết hợp, không thay thế:

- **ClinicalTrials.gov / EU CTR / ISRCTN**: đăng ký thử nghiệm tại cơ
  quan đăng ký theo khu vực pháp lý theo yêu cầu. Sau đó, trong trường
  "Description" hoặc "References" của cơ quan đăng ký, liên kết đến ấn
  phẩm được niêm phong MYRIAM.
- **OSF (Open Science Framework)**: OSF hỗ trợ tiền đăng ký với dấu thời
  gian nhưng không có neo Bitcoin. Con dấu MYRIAM có thể được đính kèm
  dưới dạng tệp bổ sung trên trang đăng ký OSF, mang lại cả dấu thời
  gian và neo Bitcoin.
- **AsPredicted.org**: tương tự — liên kết con dấu MYRIAM dưới dạng URL
  bổ sung.
- **Tạp chí**: một số tạp chí (ví dụ Trials, BMJ Open) chấp nhận URL
  tiền đăng ký như một phần của việc nộp bài. Bao gồm URL con dấu
  MYRIAM cùng với URL của cơ quan đăng ký.

## Người nhận (cơ quan quản lý, người đánh giá tạp chí, nhà phân tích meta) nhận được gì

Một thử nghiệm được tiền đăng ký theo MYRIAM cung cấp cho người đánh giá:

1. **Bằng chứng mật mã rằng quy trình đã được hoàn thiện tại một thời
   điểm cụ thể.** Người đánh giá có thể xác minh thời gian niêm phong
   thông qua biên nhận OTS.
2. **Tính ổn định từng byte của văn bản quy trình.** Người đánh giá so
   sánh phần phương pháp được công bố với thiết kế được tiền đăng ký
   có thể làm theo từng ký tự.
3. **Phát hiện đổi điểm kết thúc.** Một diff đơn giản giữa FACT 05 được
   niêm phong và điểm kết thúc chính được công bố cho thấy bất kỳ sự
   thay thế nào.
4. **Phát hiện sai lệch kế hoạch phân tích.** Một diff đơn giản giữa
   FACT 06 được niêm phong và phương pháp thống kê được công bố cho
   thấy các sửa đổi.
5. **Phát hiện báo cáo phân nhóm có chọn lọc.** FACT 07 được niêm phong
   chứa tất cả các phân nhóm đã tiền đăng ký; bất kỳ phân nhóm nào
   trong ấn phẩm mà không có trong con dấu phải được dán nhãn post-hoc.

Điều này làm cho các đánh giá hệ thống và phân tích meta dễ dàng hơn
đáng kể so với thực hành hiện tại.

## Bộ công cụ này KHÔNG phải là gì

- Không phải sự thay thế cho phê duyệt IRB / ủy ban đạo đức.
- Không phải sự thay thế cho đăng ký tại cơ quan đăng ký theo khu vực
  pháp lý.
- Không phải sự đảm bảo rằng thử nghiệm sẽ được tiến hành như kế hoạch.
- Không phải cách để neo sự đồng thuận của bệnh nhân hoặc các tài liệu
  đạo đức khác (những tài liệu đó cần cơ chế niêm phong riêng).
- Không phải sự bảo vệ chống lại sự phê bình sau công bố về thiết kế
  thử nghiệm.

## Một lưu ý về việc công bố kết quả tiêu cực

Cam kết #1 trong FACT 08 ("công bố bất kể hướng nào") là cam kết có
tác động tử vong cao nhất trong con dấu. Việc đè nén lịch sử các kết
quả thử nghiệm tiêu cực (đặc biệt đối với thuốc tâm thần ở vị thành
niên, thuốc ung thư ở người cao tuổi, và thuốc tim mạch ở phụ nữ) có
thể đã góp phần gây ra hàng ngàn ca tử vong có thể phòng ngừa được
trong nhiều thập kỷ thông qua việc kê đơn quá mức dựa trên ước tính
hiệu quả thiên lệch.

Một cam kết được niêm phong để công bố kết quả tiêu cực, tự nó, là
một trong những hành động sức khỏe cộng đồng có đòn bẩy cao nhất mà
một nhà tài trợ có thể thực hiện. Con dấu cung cấp trách nhiệm giải
trình bên ngoài cho cam kết đó theo cách mà các chính sách công bố
do bản thân giám sát không làm được.

## Kết luận

Tiền đăng ký thử nghiệm thuốc theo MYRIAM là công việc bổ sung nhỏ
cho nhà tài trợ: ~30 phút để điền các fact, ~10 giây để niêm phong.
Trách nhiệm giải trình mà nó thêm vào là bất đối xứng: chi phí nhỏ
đối với việc tiến hành thử nghiệm trung thực, ràng buộc lớn đối với
các thao tác post-hoc đã góp phần vào các thiên kiến lịch sử trong
cơ sở bằng chứng.

Nếu bạn là nhà tài trợ hoặc nhà nghiên cứu chính đang cân nhắc bộ
công cụ này, bộ công cụ thuộc phạm vi công cộng (CC0). Hãy sử dụng
nó. Sửa đổi nó. Cải thiện nó.

## Giấy phép

Phạm vi công cộng (CC0). Không yêu cầu ghi công.
