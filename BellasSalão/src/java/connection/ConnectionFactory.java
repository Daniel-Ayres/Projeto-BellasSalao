package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionFactory {

    // Constants
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static String URL = "jdbc:mysql://localhost:3306/db_bellasalao?useSSL=false&serverTimezone=UTC";
    private static String USER = "root";
    private static String PASS = "123456";

    public static Connection getConnection() {
        try {
            Class.forName(DRIVER);
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException | SQLException e) {
            throw new RuntimeException("Erro ao tentar conectar ao Banco de Dados! " + e);
        }
    }

    public static void closeConnection(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Erro ao tentar fechar a conexão: " + e);
            }
        }
    }

    public static void closeConnection(Connection con, PreparedStatement stmt) {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                System.out.println("Erro ao tentar fechar o Statement: " + e);
            } finally {
                closeConnection(con);
            }
        }
    }

    public static void closeConnection(Connection con, PreparedStatement stmt, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.out.println("Erro ao tentar fechar o ResultSet: " + e);
            } finally {
                closeConnection(con, stmt);
            }
        }
    }
}
