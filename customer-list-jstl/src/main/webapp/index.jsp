<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.codegym.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            padding-top: 50px;
        }

        .container {
            background-color: #ffffff;
            padding: 25px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
            width: 800px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333333;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            font-weight: bold;
            color: #000000;
            font-size: 16px;
        }

        td {
            font-size: 15px;
            color: #333333;
        }

        .customer-img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>

    <%
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "https://picsum.photos/id/1005/100/100"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "https://picsum.photos/id/1011/100/100"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "https://picsum.photos/id/1012/100/100"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "https://picsum.photos/id/1025/100/100"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "https://picsum.photos/id/1027/100/100"));

        request.setAttribute("customers", customerList);
    %>

    <div class="container">
        <h2>Danh sách khách hàng</h2>
        <table>
            <thead>
                <tr>
                    <th>Tên</th>
                    <th>Ngày sinh</th>
                    <th>Địa chỉ</th>
                    <th>Ảnh</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td><c:out value="${customer.name}"/></td>
                        <td><c:out value="${customer.dob}"/></td>
                        <td><c:out value="${customer.address}"/></td>
                        <td>
                            <img src="${customer.image}" alt="${customer.name}" class="customer-img" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>
</html>
