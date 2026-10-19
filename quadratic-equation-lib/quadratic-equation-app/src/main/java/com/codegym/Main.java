package com.codegym;

public class Main {
    public static void main(String[] args) {
        System.out.println("=== THỬ NGHIỆM THƯ VIỆN GIẢI PHƯƠNG TRÌNH BẬC 2 ===");

        // Trường hợp 1: a = 1, b = -3, c = 2 -> 2 nghiệm x1 = 2.0, x2 = 1.0
        System.out.println("\n1. Phương trình: x^2 - 3x + 2 = 0");
        QuadraticResult result1 = QuadraticEquation.solve(1, -3, 2);
        System.out.println("Kết quả: " + result1);

        // Trường hợp 2: a = 1, b = -2, c = 1 -> Nghiệm kép x = 1.0
        System.out.println("\n2. Phương trình: x^2 - 2x + 1 = 0");
        QuadraticResult result2 = QuadraticEquation.solve(1, -2, 1);
        System.out.println("Kết quả: " + result2);

        // Trường hợp 3: a = 1, b = 1, c = 1 -> Vô nghiệm
        System.out.println("\n3. Phương trình: x^2 + x + 1 = 0");
        QuadraticResult result3 = QuadraticEquation.solve(1, 1, 1);
        System.out.println("Kết quả: " + result3);

        // Trường hợp 4: a = 0, b = 2, c = -4 -> Phương trình bậc nhất x = 2.0
        System.out.println("\n4. Phương trình suy biến (a=0): 2x - 4 = 0");
        QuadraticResult result4 = QuadraticEquation.solve(0, 2, -4);
        System.out.println("Kết quả: " + result4);
    }
}
