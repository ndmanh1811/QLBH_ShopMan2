package test;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public class TestRunner {
    public static void main(String[] args) {
        System.out.println("=================================================");
        System.out.println("BAT DAU CHAY TOAN BO TEST CASE KIEM THU DON VI");
        System.out.println("=================================================");

        Class<?>[] testClasses = new Class<?>[] {
            MemberDAO2Test.class,
            CustomerDAO2Test.class,
            ItemRevenueStatDAO2Test.class,
            InvoiceDetailDAO2Test.class
        };

        int totalTests = 0;
        int totalFailures = 0;
        long startTime = System.currentTimeMillis();

        for (Class<?> testClass : testClasses) {
            System.out.println("\n>>> Chay test suite: " + testClass.getSimpleName() + "...");
            Result result = JUnitCore.runClasses(testClass);
            totalTests += result.getRunCount();
            totalFailures += result.getFailureCount();

            System.out.println("    - So luong test cases: " + result.getRunCount());
            System.out.println("    - So luong thanh cong: " + (result.getRunCount() - result.getFailureCount()));
            System.out.println("    - So luong that bai:   " + result.getFailureCount());
            System.out.println("    - Thoi gian chay:      " + result.getRunTime() + " ms");

            if (!result.wasSuccessful()) {
                System.out.println("    [!] CHI TIET LOI:");
                for (Failure failure : result.getFailures()) {
                    System.out.println("        + " + failure.toString());
                }
            } else {
                System.out.println("    [OK] TAT CA TEST CASES TRONG SUITE DEU PASS 100%!");
            }
        }

        long totalTime = System.currentTimeMillis() - startTime;
        System.out.println("\n=================================================");
        System.out.println("TONG KET KET QUA KIEM THU DON VI UNIT TEST (TUAN 7)");
        System.out.println("=================================================");
        System.out.println("Tong so test cases da thuc thi: " + totalTests);
        System.out.println("Tong so test cases PASS:        " + (totalTests - totalFailures));
        System.out.println("Tong so test cases FAILED:      " + totalFailures);
        System.out.println("Ti le thanh cong:               " + (totalTests > 0 ? ((totalTests - totalFailures) * 100 / totalTests) : 0) + "%");
        System.out.println("Tong thoi gian thuc thi:        " + totalTime + " ms");
        System.out.println("=================================================");
    }
}
