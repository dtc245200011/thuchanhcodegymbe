<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản Lý Sản Phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        h1 { color: #1b2a7a; }
        .header-actions { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .search-form { display: flex; gap: 10px; }
        .search-form input[type="text"] { padding: 8px 12px; border: 1px solid #ccc; border-radius: 4px; width: 250px; font-size: 14px; }
        .search-form button { padding: 8px 16px; background-color: #1b2a7a; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        table { border-collapse: collapse; width: 100%; background: white; border-radius: 8px; overflow: hidden; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #1b2a7a; color: white; }
        tr:hover { background-color: #f1f5f9; }
        .btn { display: inline-block; padding: 8px 16px; text-decoration: none; border-radius: 4px; font-weight: bold; font-size: 14px; }
        .btn-create { background-color: #27ae60; color: white; }
        .btn-edit { color: #2980b9; text-decoration: none; margin-right: 10px; }
        .btn-delete { color: #c0392b; text-decoration: none; }
        .btn-view { color: #1b2a7a; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <h1>Danh Sách Sản Phẩm</h1>

    <div class="header-actions">
        <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-create">+ Tạo sản phẩm mới</a>
        
        <form action="${pageContext.request.contextPath}/products" method="GET" class="search-form">
            <input type="hidden" name="action" value="search" />
            <input type="text" name="search" placeholder="Nhập tên sản phẩm..." value="${requestScope.searchQuery}" />
            <button type="submit">Tìm kiếm</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>STT</th>
                <th>Tên Sản Phẩm</th>
                <th>Giá ($)</th>
                <th>Nhà Sản Xuất</th>
                <th>Mô Tả</th>
                <th>Hành Động</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty requestScope.products}">
                    <c:forEach items="${requestScope.products}" var="product" varStatus="loop">
                        <tr>
                            <td>${loop.index + 1}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/products?action=view&id=${product.id}" class="btn-view">${product.name}</a>
                            </td>
                            <td>$${product.price}</td>
                            <td>${product.manufacturer}</td>
                            <td>${product.description}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/products?action=edit&id=${product.id}" class="btn-edit">Sửa</a>
                                <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.id}" class="btn-delete">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6" style="text-align: center; color: #777;">Không tìm thấy sản phẩm nào!</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>
</body>
</html>
