<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hệ Thống Quản Lý Sản Phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
</head>
<body class="bg-light">
    <div class="container my-5">
        <div class="card shadow-sm">
            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center py-3">
                <h3 class="card-title mb-0"><i class="bi bi-box-seam-fill"></i> Quản Lý Danh Sách Sản Phẩm</h3>
                <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-success fw-bold">
                    <i class="bi bi-plus-circle-fill"></i> Thêm Sản Phẩm Mới
                </a>
            </div>
            
            <div class="card-body p-4">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col" style="width: 8%;" class="text-center">ID</th>
                                <th scope="col" style="width: 40%;">Tên Sản Phẩm</th>
                                <th scope="col" style="width: 22%;" class="text-end">Đơn Giá (VNĐ)</th>
                                <th scope="col" style="width: 12%;" class="text-center">Số Lượng</th>
                                <th scope="col" style="width: 18%;" class="text-center">Thao Tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="p" items="${listProduct}">
                                <tr>
                                    <td class="text-center"><c:out value="${p.id}"/></td>
                                    <td class="fw-bold text-primary"><c:out value="${p.name}"/></td>
                                    <td class="text-end fw-medium text-success">
                                        <fmt:formatNumber value="${p.price}" type="number" maxFractionDigits="0"/> đ
                                    </td>
                                    <td class="text-center">
                                        <span class="badge ${p.quantity > 5 ? 'bg-info text-dark' : 'bg-danger'}">
                                            <c:out value="${p.quantity}"/>
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/products?action=edit&id=${p.id}" 
                                           class="btn btn-sm btn-warning me-1">
                                            <i class="bi bi-pencil-square"></i> Sửa
                                        </a>
                                        <a href="${pageContext.request.contextPath}/products?action=delete&id=${p.id}" 
                                           class="btn btn-sm btn-danger" 
                                           onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm \'${p.name}\' không?');">
                                            <i class="bi bi-trash-fill"></i> Xóa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty listProduct}">
                                <tr>
                                    <td colspan="5" class="text-center text-muted py-4">Chưa có sản phẩm nào trong cơ sở dữ liệu.</td>
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
