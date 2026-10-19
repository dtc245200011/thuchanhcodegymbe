<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi Tiết Sản Phẩm</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f8fafc; }
        .detail-container { background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); max-width: 500px; margin: auto; }
        h2 { color: #1b2a7a; text-align: center; border-bottom: 2px solid #1b2a7a; padding-bottom: 10px; }
        table { width: 100%; margin-top: 15px; }
        td { padding: 10px; font-size: 16px; }
        .label { font-weight: bold; color: #555; width: 35%; }
        .value { color: #333; }
        .price-highlight { color: #27ae60; font-weight: bold; font-size: 18px; }
        .link-back { display: block; text-align: center; margin-top: 25px; color: #1b2a7a; text-decoration: none; font-weight: bold; }
    </style>
</head>
<body>
    <div class="detail-container">
        <h2>Chi Tiết Sản Phẩm</h2>
        <table>
            <tr>
                <td class="label">Mã Sản Phẩm:</td>
                <td class="value">${requestScope.product.id}</td>
            </tr>
            <tr>
                <td class="label">Tên Sản Phẩm:</td>
                <td class="value"><strong>${requestScope.product.name}</strong></td>
            </tr>
            <tr>
                <td class="label">Giá Bán:</td>
                <td class="value price-highlight">$${requestScope.product.price}</td>
            </tr>
            <tr>
                <td class="label">Nhà Sản Xuất:</td>
                <td class="value">${requestScope.product.manufacturer}</td>
            </tr>
            <tr>
                <td class="label">Mô Tả:</td>
                <td class="value">${requestScope.product.description}</td>
            </tr>
        </table>
        <a href="${pageContext.request.contextPath}/products" class="link-back">Quay lại danh sách</a>
    </div>
</body>
</html>
