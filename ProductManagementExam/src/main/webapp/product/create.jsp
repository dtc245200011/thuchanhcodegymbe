<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Sản Phẩm Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 600px;">
        <div class="card shadow-sm">
            <div class="card-header bg-success text-white py-3">
                <h4 class="card-title mb-0">Thêm Sản Phẩm Mới</h4>
            </div>
            <div class="card-body p-4">
                <form action="${pageContext.request.contextPath}/products?action=create" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label fw-bold">Tên sản phẩm:</label>
                        <input type="text" class="form-control" id="name" name="name" required placeholder="Nhập tên sản phẩm...">
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label fw-bold">Đơn giá (VNĐ):</label>
                        <input type="number" step="1000" min="0" class="form-control" id="price" name="price" required placeholder="Nhập đơn giá...">
                    </div>
                    <div class="mb-4">
                        <label for="quantity" class="form-label fw-bold">Số lượng trong kho:</label>
                        <input type="number" min="0" class="form-control" id="quantity" name="quantity" required placeholder="Nhập số lượng...">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Quay lại danh sách</a>
                        <button type="submit" class="btn btn-success px-4">Lưu Sản Phẩm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
