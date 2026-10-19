package com.codegym;

public class QuadraticResult {
    public enum Status {
        INFINITE_SOLUTIONS, // Vô số nghiệm
        NO_REAL_ROOTS,      // Vô nghiệm
        SINGLE_ROOT,        // Nghiệm duy nhất (hoặc nghiệm kép)
        TWO_ROOTS           // 2 nghiệm phân biệt
    }

    private final Status status;
    private final Double x1;
    private final Double x2;

    public QuadraticResult(Status status, Double x1, Double x2) {
        this.status = status;
        this.x1 = x1;
        this.x2 = x2;
    }

    public Status getStatus() {
        return status;
    }

    public Double getX1() {
        return x1;
    }

    public Double getX2() {
        return x2;
    }

    @Override
    public String toString() {
        switch (status) {
            case INFINITE_SOLUTIONS:
                return "Phương trình có vô số nghiệm.";
            case NO_REAL_ROOTS:
                return "Phương trình vô nghiệm thực.";
            case SINGLE_ROOT:
                return "Phương trình có nghiệm: x = " + x1;
            case TWO_ROOTS:
                return "Phương trình có 2 nghiệm phân biệt: x1 = " + x1 + ", x2 = " + x2;
            default:
                return "Trạng thái không xác định.";
        }
    }
}
