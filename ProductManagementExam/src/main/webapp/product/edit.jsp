<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 600px;">
        <div class="card shadow-sm">
            <div class="card-header bg-warning text-dark py-3">
                <h4 class="card-title mb-0">Chỉnh Sửa Thông Tin Sản Phẩm</h4>
            </div>
            <div class="card-body p-4">
                <form action="${pageContext.request.contextPath}/products?action=edit" method="post">
                    <input type="hidden" name="id" value="<c:out value='${product.id}' />"/>
                    
                    <div class="mb-3">
                        <label for="name" class="form-label fw-bold">Tên sản phẩm:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<c:out value='${product.name}' />" required>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label fw-bold">Đơn giá (VNĐ):</label>
                        <input type="number" step="1000" min="0" class="form-control" id="price" name="price" value="<c:out value='${product.price}' />" required>
                    </div>
                    <div class="mb-4">
                        <label for="quantity" class="form-label fw-bold">Số lượng trong kho:</label>
                        <input type="number" min="0" class="form-control" id="quantity" name="quantity" value="<c:out value='${product.quantity}' />" required>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Hủy bỏ</a>
                        <button type="submit" class="btn btn-primary px-4">Cập Nhật Sản Phẩm</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
