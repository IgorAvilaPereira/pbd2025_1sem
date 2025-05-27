package david_carnaval;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
        String dbname = "david_carnaval";
        String host = "localhost";
        String username = "postgres";
        String password = "postgres";
        String port = "5432";
        String url = "jdbc:postgresql://"+host+":"+port+"/"+dbname;
        Connection conexao = DriverManager.getConnection(url, username, password);
        conexao.createStatement().execute("CALL inserir_funcionario('David2', '2003-04-28', 'Carnaval2', 2.99);");
        conexao.close();
    }
}