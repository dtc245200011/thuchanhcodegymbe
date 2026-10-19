<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Simple Calculator</title>
        <style>
            body {
                font-family: 'Times New Roman', Times, serif;
                padding: 20px;
            }

            h2 {
                font-size: 28px;
                font-weight: bold;
                margin-bottom: 15px;
            }

            fieldset {
                width: 450px;
                border: 1px solid #777777;
                padding: 15px 20px;
            }

            legend {
                font-size: 16px;
                padding: 0 5px;
            }

            .form-group {
                margin-bottom: 10px;
                display: flex;
                align-items: center;
            }

            .form-group label {
                width: 130px;
                font-size: 16px;
            }

            .form-group input, .form-group select {
                padding: 3px;
                font-size: 14px;
            }

            .form-group input[type="text"] {
                width: 180px;
            }

            .btn-container {
                margin-left: 130px;
                margin-top: 10px;
            }

            button {
                padding: 3px 10px;
                font-size: 14px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>

        <h2>Simple Calculator</h2>

        <form action="calculate" method="POST">
            <fieldset>
                <legend>Calculator</legend>
                
                <div class="form-group">
                    <label for="first-operand">First operand:</label>
                    <input type="text" id="first-operand" name="first-operand" required />
                </div>

                <div class="form-group">
                    <label for="operator">Operator:</label>
                    <select id="operator" name="operator">
                        <option value="+">Addition</option>
                        <option value="-">Subtraction</option>
                        <option value="*">Multiplication</option>
                        <option value="/">Division</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="second-operand">Second operand:</label>
                    <input type="text" id="second-operand" name="second-operand" required />
                </div>

                <div class="btn-container">
                    <button type="submit">Calculate</button>
                </div>
            </fieldset>
        </form>

    </body>
</html>
