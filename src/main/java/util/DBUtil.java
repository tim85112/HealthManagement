package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String URL ="jdbc:sqlserver://localhost:1433;databaseName=HealthManagement;encrypt=true;trustServerCertificate=true;useUnicode=true;characterEncoding=UTF-8";
    private static final String USER = "Ivan";
    private static final String PASSWORD = "abcd+1234"; 

    static {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
