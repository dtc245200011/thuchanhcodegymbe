<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Người Dùng - Stored Procedures</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h3 class="card-title mb-0">Danh Sách Người Dùng (MySQL Stored Procedures)</h3>
                <a href="${pageContext.request.contextPath}/users?action=create" class="btn btn-success">
                    <i class="bi bi-person-plus-fill"></i> Thêm Người Dùng Mới
                </a>
            </div>
            
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle">
                        <thead class="table-secondary">
                            <tr>
                                <th scope="col" style="width: 10%;">ID</th>
                                <th scope="col" style="width: 30%;">Tên</th>
                                <th scope="col" style="width: 30%;">Email</th>
                                <th scope="col" style="width: 15%;">Quốc gia</th>
                                <th scope="col" style="width: 15%;" class="text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${listUser}">
                                <tr>
                                    <td><c:out value="${user.id}"/></td>
                                    <td class="fw-medium"><c:out value="${user.name}"/></td>
                                    <td><c:out value="${user.email}"/></td>
                                    <td><span class="badge bg-info text-dark"><c:out value="${user.country}"/></span></td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/users?action=edit&id=${user.id}" 
                                           class="btn btn-sm btn-warning me-1" title="Chỉnh sửa (Stored Procedure)">
                                            <i class="bi bi-pencil-square"></i> Sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}" 
                                           class="btn btn-sm btn-danger" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa?');" title="Xóa">
                                            <i class="bi bi-trash-fill"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty listUser}">
                                <tr>
                                    <td colspan="5" class="text-center text-muted py-4">Chưa có dữ liệu người dùng.</td>
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
