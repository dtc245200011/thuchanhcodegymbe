# Báo Cáo Phân Tích & Tái Cấu Trúc Layout (Layout Refactoring)

Sử dụng `position: absolute` cho các phần tử dàn trang (như Mosaic Gallery) là một sai lầm nghiêm trọng trong Responsive Design. Khi thiết lập `position: absolute`, phần tử bị tách hoàn toàn khỏi dòng chảy tự nhiên của văn bản (Normal Document Flow), khiến phần tử cha không thể tự động tính toán chiều cao tương ứng. Kết quả là các thành phần phía sau (như văn bản bài viết) sẽ tràn lên và che lấp hình ảnh khi kích thước màn hình thay đổi.

**CSS Grid** là giải pháp cứu cánh tối ưu cho bài toán này. CSS Grid cho phép định dạng bố cục 2 chiều (2D Layout) chặt chẽ, tự động tính toán khoảng cách (`gap`) và tự động co giãn dòng/cột theo nội dung. Nhờ đó, gallery giữ nguyên chiều cao thực tế trên DOM, giúp văn bản bài viết phía dưới tự động đẩy xuống vị trí chính xác trên mọi thiết bị.
