package businessLogic;

import oracle.jdbc.pool.OracleDataSource;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Util {
    private final static String ORACLE_DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
    private final static String ORACLE_DB_URL = "jdbc:oracle:thin:@localhost:1522:xe"; //1521 or 1522
    private final static String ORACLE_DB_USERNAME = "SYSTEM";
    private final static String ORACLE_DB_PASSWORD = "vladbright";

    static {
        try {
            Class.forName(ORACLE_DB_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("Driver error");
            //throw new RuntimeException("Can't register driver!"); // to correct!
        }
    }

/*
    private final String MYSQL_DB_DRIVER = "com.mysql.jdbc.Driver";
    private final String MYSQL_DB_URL = "jdbc:mysql://localhost:3306/carservice";
    private final String MYSQL_DB_USERNAME = "vladbright";
    private final String MYSQL_DB_PASSWORD = "vladbright";
*/
    public static Connection connection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(ORACLE_DB_URL, ORACLE_DB_USERNAME, ORACLE_DB_PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Connection error");
        }
        return connection;
    }

    public static void close(Statement statement, Connection connection) {
        if(statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
