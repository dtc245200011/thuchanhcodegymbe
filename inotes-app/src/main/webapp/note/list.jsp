<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>iNotes Dashboard - Danh Sách Ghi Chú</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <!-- Navbar Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/notes">
                <i class="bi bi-journal-bookmark-fill"></i> iNotes Application
            </a>
            <div class="d-flex align-items-center">
                <span class="text-white me-2">Chế độ lưu trữ hiện tại:</span>
                <c:choose>
                    <c:when test="${currentStorage == 'file'}">
                        <a href="${pageContext.request.contextPath}/notes?storage=db" class="btn btn-light btn-sm fw-bold text-primary" title="Bấm để chuyển sang MySQL">
                            <i class="bi bi-file-earmark-text-fill"></i> Tệp tin (File TXT)
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/notes?storage=file" class="btn btn-warning btn-sm fw-bold text-dark" title="Bấm để chuyển sang File TXT">
                            <i class="bi bi-database-fill"></i> MySQL Database
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-white py-3">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h4 class="mb-0 text-secondary"><i class="bi bi-list-task"></i> Danh Sách Ghi Chú</h4>
                    </div>
                    <div class="col-md-6 text-md-end mt-2 mt-md-0">
                        <a href="${pageContext.request.contextPath}/notes?action=create" class="btn btn-success">
                            <i class="bi bi-plus-circle-fill"></i> Thêm Mới Ghi Chú
                        </a>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <!-- Thanh Tìm kiếm -->
                <form action="${pageContext.request.contextPath}/notes" method="get" class="row g-2 mb-4">
                    <input type="hidden" name="action" value="search">
                    <div class="col-md-10">
                        <input type="text" name="keyword" class="form-control" placeholder="Nhập từ khóa tìm kiếm tiêu đề hoặc nội dung..." value="${keyword}">
                    </div>
                    <div class="col-md-2 d-grid">
                        <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Tìm kiếm</button>
                    </div>
                </form>

                <!-- Bảng danh sách Ghi chú -->
                <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col" style="width: 5%;">#</th>
                                <th scope="col" style="width: 35%;">Tiêu đề</th>
                                <th scope="col" style="width: 20%;">Phân loại</th>
                                <th scope="col" style="width: 25%;" class="text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="note" items="${listNotes}">
                                <tr>
                                    <td><c:out value="${note.id}"/></td>
                                    <td class="fw-bold text-primary"><c:out value="${note.title}"/></td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${note.typeId == 1}"><span class="badge bg-info text-dark">Cá nhân</span></c:when>
                                            <c:when test="${note.typeId == 2}"><span class="badge bg-warning text-dark">Công việc</span></c:when>
                                            <c:when test="${note.typeId == 3}"><span class="badge bg-success">Học tập</span></c:when>
                                            <c:otherwise><span class="badge bg-secondary"><c:out value="${note.typeName}"/></span></c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/notes?action=view&id=${note.id}" class="btn btn-sm btn-info text-white me-1">
                                            <i class="bi bi-eye-fill"></i> Xem
                                        </a>
                                        <a href="${pageContext.request.contextPath}/notes?action=edit&id=${note.id}" class="btn btn-sm btn-warning me-1">
                                            <i class="bi bi-pencil-square"></i> Sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/notes?action=delete&id=${note.id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xóa ghi chú này?');">
                                            <i class="bi bi-trash-fill"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty listNotes}">
                                <tr>
                                    <td colspan="4" class="text-center text-muted py-4">Chưa có ghi chú nào trong hệ thống.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
