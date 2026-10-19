<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Mới Ghi Chú - iNotes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 700px;">
        <div class="card shadow-sm">
            <div class="card-header bg-success text-white py-3">
                <h4 class="card-title mb-0">Thêm Mới Ghi Chú</h4>
            </div>
            <div class="card-body p-4">
                <form action="${pageContext.request.contextPath}/notes?action=create" method="post">
                    <div class="mb-3">
                        <label for="title" class="form-label fw-bold">Tiêu đề:</label>
                        <input type="text" class="form-control" id="title" name="title" required placeholder="Nhập tiêu đề ghi chú...">
                    </div>

                    <div class="mb-3">
                        <label for="typeId" class="form-label fw-bold">Phân loại:</label>
                        <select class="form-select" id="typeId" name="typeId" required>
                            <option value="1">Cá nhân</option>
                            <option value="2">Công việc</option>
                            <option value="3">Học tập</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="content" class="form-label fw-bold">Nội dung:</label>
                        <textarea class="form-control" id="content" name="content" rows="6" required placeholder="Nhập nội dung ghi chú chi tiết..."></textarea>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Hủy bỏ</a>
                        <button type="submit" class="btn btn-success px-4">Lưu Ghi Chú</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
