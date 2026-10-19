<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Ghi Chú - iNotes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container my-5" style="max-width: 700px;">
        <div class="card shadow-sm">
            <div class="card-header bg-info text-white py-3">
                <h4 class="card-title mb-0">Chi Tiết Ghi Chú</h4>
            </div>
            <div class="card-body p-4">
                <h3 class="text-primary mb-3"><c:out value="${note.title}" /></h3>
                <p><strong>Thể loại:</strong> 
                    <span class="badge bg-secondary"><c:out value="${note.typeName}" /></span>
                </p>
                <hr>
                <div class="bg-light p-3 border rounded text-dark" style="white-space: pre-wrap;"><c:out value="${note.content}" /></div>
                
                <div class="mt-4 text-end">
                    <a href="${pageContext.request.contextPath}/notes" class="btn btn-secondary">Quay lại danh sách</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
