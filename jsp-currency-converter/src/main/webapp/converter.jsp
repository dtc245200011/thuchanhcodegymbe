<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kết quả chuyển đổi</title>
        <style>
            body { font-family: 'Arial', sans-serif; display: flex; justify-content: center; margin-top: 100px; background-color: #f8fafc; }
            .result-container { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); text-align: center; width: 400px; }
            .back-btn { text-decoration: none; padding: 10px 20px; background-color: #1b2a7a; color: white; border-radius: 4px; display: inline-block; margin-top: 20px;}
        </style>
    </head>
    <body>
        <div class="result-container">
            <h2 style="color: #1b2a7a;">KẾT QUẢ CHUYỂN ĐỔI</h2>
            
            <%
                try {
                    float rate = Float.parseFloat(request.getParameter("rate"));
                    float usd = Float.parseFloat(request.getParameter("usd"));
                    float vnd = rate * usd;
            %>
            
            <p style="font-size: 18px; color: #555;">Tỉ giá hiện tại: <b><%= rate %></b> VND/USD</p>
            <p style="font-size: 18px; color: #555;">Lượng USD yêu cầu: <b>$<%= usd %></b></p>
            
            <div style="background-color: #e8f5e9; padding: 15px; border-radius: 8px; margin-top: 20px;">
                <h3 style="color: #27ae60; font-size: 24px; margin: 0;">Thành tiền: <%= String.format("%,.0f", vnd) %> VNĐ</h3>
            </div>
            
            <%
                } catch (Exception e) {
            %>
            
            <div style="background-color: #ffebee; padding: 15px; border-radius: 8px;">
                <h3 style="color: #c0392b; margin: 0;">Lỗi xử lý!</h3>
                <p>Dữ liệu đầu vào không hợp lệ. Vui lòng kiểm tra lại.</p>
            </div>
            
            <%
                }
            %>
            
            <a href="index.jsp" class="back-btn">Quay lại trang chủ</a>
        </div>
    </body>
</html>
