<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Luyện Tập Transaction - Thêm User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 650px;">
        <div class="card shadow-sm">
            <div class="card-header bg-danger text-white">
                <h4 class="card-title mb-0"><i class="bi bi-shield-slash-fill"></i> Thêm User & Test Rollback Transaction</h4>
            </div>
            <div class="card-body">
                <div class="alert alert-warning" role="alert">
                    <i class="bi bi-exclamation-circle-fill"></i> <b>Lưu ý thử nghiệm:</b> Phương thức hiện tại cố tình gõ sai tên bảng trong SQL phân quyền. Khi bấm <b>Lưu Thông Tin</b>, hệ thống sẽ gặp lỗi SQL và thực hiện <b>Rollback</b> (không có dữ liệu nào được lưu).
                </div>
                
                <form action="${pageContext.request.contextPath}/users?action=create" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label fw-bold">Tên người dùng:</label>
                        <input type="text" class="form-control" id="name" name="name" required placeholder="Nhập tên test (Ví dụ: Test Rollback)">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label fw-bold">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required placeholder="rollback@gmail.com">
                    </div>
                    <div class="mb-3">
                        <label for="country" class="form-label fw-bold">Quốc gia:</label>
                        <input type="text" class="form-control" id="country" name="country" required placeholder="Viet Nam">
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Chọn quyền hạn:</label>
                        <div class="d-flex flex-wrap gap-3 p-3 bg-white border rounded">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="permissions" value="1" id="perm1" checked>
                                <label class="form-check-label" for="perm1">Thêm (Add)</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="permissions" value="2" id="perm2">
                                <label class="form-check-label" for="perm2">Sửa (Edit)</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="permissions" value="3" id="perm3">
                                <label class="form-check-label" for="perm3">Xóa (Delete)</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="permissions" value="4" id="perm4" checked>
                                <label class="form-check-label" for="perm4">Xem (View)</label>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">Quay lại</a>
                        <button type="submit" class="btn btn-danger"><i class="bi bi-save"></i> Lưu Thông Tin (Test Rollback)</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
