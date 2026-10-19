package com.codegym;

public class QuadraticEquation {

    /**
     * Giải phương trình bậc 2: ax^2 + bx + c = 0
     * @param a hệ số a
     * @param b hệ số b
     * @param c hệ số c
     * @return QuadraticResult chứa kết quả giải
     */
    public static QuadraticResult solve(double a, double b, double c) {
        if (a == 0) {
            if (b == 0) {
                if (c == 0) {
                    return new QuadraticResult(QuadraticResult.Status.INFINITE_SOLUTIONS, null, null);
                } else {
                    return new QuadraticResult(QuadraticResult.Status.NO_REAL_ROOTS, null, null);
                }
            } else {
                double x = -c / b;
                return new QuadraticResult(QuadraticResult.Status.SINGLE_ROOT, x, null);
            }
        }

        double delta = b * b - 4 * a * c;

        if (delta < 0) {
            return new QuadraticResult(QuadraticResult.Status.NO_REAL_ROOTS, null, null);
        } else if (delta == 0) {
            double x = -b / (2 * a);
            return new QuadraticResult(QuadraticResult.Status.SINGLE_ROOT, x, null);
        } else {
            double x1 = (-b + Math.sqrt(delta)) / (2 * a);
            double x2 = (-b - Math.sqrt(delta)) / (2 * a);
            return new QuadraticResult(QuadraticResult.Status.TWO_ROOTS, x1, x2);
        }
    }
}
