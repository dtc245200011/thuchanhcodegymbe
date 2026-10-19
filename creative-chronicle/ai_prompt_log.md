# Nhật Ký Sử Dụng AI (AI Prompt Log)

### Prompt 1 - Căn giữa dọc Flexbox với Utilities Bootstrap
- **Prompt:** "Làm thế nào để căn giữa theo chiều dọc Avatar, Tên tác giả và Nút Share trên cùng một dòng bằng Utilities Class của Bootstrap 5 mà không cần viết CSS custom?"
- **Kết quả:** Sử dụng cụm class `d-flex justify-content-between align-items-center flex-wrap gap-3`.

### Prompt 2 - Cấu trúc Mosaic Gallery bằng CSS Grid
- **Prompt:** "Cho tôi cú pháp CSS Grid để làm một khung ảnh dạng Mosaic gồm 1 ảnh lớn bên trái chiếm 2 hàng và 2 ảnh nhỏ bên phải xếp chồng lên nhau, tự động về 1 cột khi xuống màn hình điện thoại?"
- **Kết quả:** Xây dựng class `.mosaic-gallery` dùng `grid-template-columns: 2fr 1fr` và `grid-row: span 2`.

### Prompt 3 - Tối ưu hiển thị ảnh
- **Prompt:** "Thuộc tính CSS nào giúp hình ảnh trong khung Grid không bị méo tỉ lệ khi ép chiều cao cố định?"
- **Kết quả:** Sử dụng `object-fit: cover`.
