<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Người Dùng & Phân Quyền</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 650px;">
        <div class="card shadow-sm">
            <div class="card-header bg-success text-white">
                <h4 class="card-title mb-0"><i class="bi bi-shield-lock-fill"></i> Thêm Người Dùng & Phân Quyền (Transaction)</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/users?action=create" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label fw-bold">Tên người dùng:</label>
                        <input type="text" class="form-control" id="name" name="name" required placeholder="Nhập họ và tên">
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label fw-bold">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" required placeholder="example@email.com">
                    </div>
                    <div class="mb-3">
                        <label for="country" class="form-label fw-bold">Quốc gia:</label>
                        <input type="text" class="form-control" id="country" name="country" required placeholder="Nhập quốc gia">
                    </div>

                    <!-- BƯỚC 4: NHÓM CHECKBOX PHÂN QUYỀN -->
                    <div class="mb-4">
                        <label class="form-label fw-bold">Quyền hạn (Permissions):</label>
                        <div class="d-flex flex-wrap gap-3 p-3 bg-white border rounded">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="permissions" value="1" id="perm1">
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
                                <input class="form-check-input" type="checkbox" name="permissions" value="4" id="perm4">
                                <label class="form-check-label" for="perm4">Xem (View)</label>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">Quay lại</a>
                        <button type="submit" class="btn btn-success"><i class="bi bi-save"></i> Lưu Thông Tin</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
