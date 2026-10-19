<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Ghi Chú - iNotes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 700px;">
        <div class="card shadow-sm">
            <div class="card-header bg-warning text-dark py-3">
                <h4 class="card-title mb-0">Chỉnh Sửa Ghi Chú</h4>
            </div>
            <div class="card-body p-4">
                <form action="${pageContext.request.contextPath}/notes?action=edit" method="post">
                    <input type="hidden" name="id" value="<c:out value='${note.id}' />"/>

                    <div class="mb-3">
                        <label for="title" class="form-label fw-bold">Tiêu đề:</label>
                        <input type="text" class="form-control" id="title" name="title" value="<c:out value='${note.title}' />" required>
                    </div>

                    <div class="mb-3">
                        <label for="typeId" class="form-label fw-bold">Phân loại:</label>
                        <select class="form-select" id="typeId" name="typeId" required>
                            <option value="1" <c:if test="${note.typeId == 1}">selected</c:if>>Cá nhân</option>
                            <option value="2" <c:if test="${note.typeId == 2}">selected</c:if>>Công việc</option>
                            <option value="3" <c:if test="${note.typeId == 3}">selected</c:if>>Học tập</option>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="content" class="form-label fw-bold">Nội dung:</label>
                        <textarea class="form-control" id="content" name="content" rows="6" required><c:out value="${note.content}" /></textarea>
                    </div>

                    <div class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Hủy bỏ</a>
                        <button type="submit" class="btn btn-primary px-4">Cập Nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
