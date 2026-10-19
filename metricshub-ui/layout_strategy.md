# Giải Trình Chiến Lược Dàn Trang (Layout Strategy)

**CSS Grid** được thiết kế nguyên bản cho bố cục 2 chiều (2D Layout - vừa theo cột vừa theo hàng). CSS Grid phù hợp nhất để xây dựng cấu trúc trang tổng thể, các Dashboard bất đối xứng (như Bento Box) mà không làm phồng cấu trúc DOM với các thẻ lồng nhau thừa thãi.

**Flexbox** được tối ưu hóa cho không gian 1 chiều (1D Layout - dòng hoặc cột). Flexbox lý tưởng để sắp xếp các thành phần con linh hoạt theo nội dung thực tế (Content-first), như căn chỉnh các phần tử trên thanh điều hướng (Navbar) hoặc căn giữa các biểu tượng/văn bản bên trong một Component chi tiết.

Việc phối hợp **CSS Grid cho khung sườn tổng thể** và **Flexbox cho linh kiện bên trong** giúp giao diện đáp ứng linh hoạt (Responsive), duy trì cấu trúc DOM ngắn gọn và dễ bảo trì.
