package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO2 {
    public static Connection con;

    public DAO2() {
        try {
            if (con == null || con.isClosed() || !con.isValid(2)) {
                String dbUrl = "jdbc:mysql://localhost:3306/db_shopman2?useSSL=false&allowPublicKeyRetrieval=true&characterEncoding=UTF-8&serverTimezone=Asia/Ho_Chi_Minh";
                String dbClass = "com.mysql.cj.jdbc.Driver";
                Class.forName(dbClass);
                try {
                    con = DriverManager.getConnection(dbUrl, "root", "");
                } catch (Exception e) {
                    con = DriverManager.getConnection(dbUrl, "root", "root");
                }
            }
        } catch (Exception ex) {
            System.err.println("Database connection failed in DAO2: " + ex.getMessage());
        }
    }
}
