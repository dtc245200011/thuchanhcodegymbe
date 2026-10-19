<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 600px;">
        <div class="card shadow-sm">
            <div class="card-header bg-warning text-dark">
                <h4 class="card-title mb-0">Chỉnh Sửa Thông Tin (Tải qua Stored Procedure)</h4>
            </div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/users?action=edit" method="post">
                    <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
                    
                    <div class="mb-3">
                        <label for="name" class="form-label">Tên người dùng:</label>
                        <input type="text" class="form-control" id="name" name="name" value="<c:out value='${user.name}' />" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="<c:out value='${user.email}' />" required>
                    </div>
                    <div class="mb-3">
                        <label for="country" class="form-label">Quốc gia:</label>
                        <input type="text" class="form-control" id="country" name="country" value="<c:out value='${user.country}' />" required>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/users" class="btn btn-secondary">Hủy bỏ</a>
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
