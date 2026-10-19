<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Người Dùng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                <h3 class="card-title mb-0">Danh Sách Người Dùng</h3>
                <a href="${pageContext.request.contextPath}/users?action=create" class="btn btn-success">
                    <i class="bi bi-person-plus-fill"></i> Thêm Người Dùng Mới
                </a>
            </div>
            
            <div class="card-body">
                <!-- Thanh công cụ: Tìm kiếm và Sắp xếp -->
                <div class="row g-3 mb-4">
                    <!-- Form Tìm kiếm theo Country -->
                    <div class="col-md-7">
                        <form action="${pageContext.request.contextPath}/users" method="get" class="d-flex gap-2">
                            <input type="hidden" name="action" value="search">
                            <input type="text" name="country" class="form-control" 
                                   placeholder="Nhập tên Quốc gia (Country)..." 
                                   value="${requestScope.searchCountry}">
                            <button type="submit" class="btn btn-outline-primary text-nowrap">
                                <i class="bi bi-search"></i> Tìm kiếm
                            </button>
                            <c:if test="${not empty requestScope.searchCountry}">
                                <a href="${pageContext.request.contextPath}/users" class="btn btn-outline-secondary text-nowrap">Xóa tìm kiếm</a>
                            </c:if>
                        </form>
                    </div>

                    <!-- Nút Sắp xếp theo Name -->
                    <div class="col-md-5 d-flex justify-content-md-end gap-2 align-items-center">
                        <span class="fw-bold">Sắp xếp Tên:</span>
                        <a href="${pageContext.request.contextPath}/users?action=sort&order=ASC" 
                           class="btn btn-sm ${requestScope.currentSortOrder == 'ASC' ? 'btn-dark' : 'btn-outline-dark'}">
                            <i class="bi bi-sort-alpha-down"></i> A - Z
                        </a>
                        <a href="${pageContext.request.contextPath}/users?action=sort&order=DESC" 
                           class="btn btn-sm ${requestScope.currentSortOrder == 'DESC' ? 'btn-dark' : 'btn-outline-dark'}">
                            <i class="bi bi-sort-alpha-up-alt"></i> Z - A
                        </a>
                    </div>
                </div>

                <!-- Bảng danh sách User -->
                <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle">
                        <thead class="table-secondary">
                            <tr>
                                <th scope="col" style="width: 5%;">ID</th>
                                <th scope="col" style="width: 30%;">Tên</th>
                                <th scope="col" style="width: 35%;">Email</th>
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
                                           class="btn btn-sm btn-warning me-1" title="Chỉnh sửa">
                                            <i class="bi bi-pencil-square"></i> Sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/users?action=delete&id=${user.id}" 
                                           class="btn btn-sm btn-danger" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');" title="Xóa">
                                            <i class="bi bi-trash-fill"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty listUser}">
                                <tr>
                                    <td colspan="5" class="text-center text-muted py-4">Không tìm thấy người dùng nào phù hợp.</td>
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
