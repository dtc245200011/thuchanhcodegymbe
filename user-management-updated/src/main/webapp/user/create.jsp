<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Mới Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 600px;">
        <div class="card shadow-sm">
            <div class="card-header bg-success text-white">
                <h4 class="card-title mb-0">Thêm Mới Người Dùng</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/users?action=create" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên người dùng:</label>
                        <input type="text" class="form-control" id="name" name="name" required placeholder="Nhập họ và tên">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required placeholder="example@email.com">
                    </div>
                    <div class="mb-3">
                        <label for="country" class="form-label">Quốc gia:</label>
                        <input type="text" class="form-control" id="country" name="country" required placeholder="Nhập quốc gia">
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">Quay lại</a>
                        <button type="submit" class="btn btn-success">Lưu Người Dùng</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
