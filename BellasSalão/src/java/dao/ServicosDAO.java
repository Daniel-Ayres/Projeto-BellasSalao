
package dao;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;
import model.Servicos;

public class ServicosDAO {
   private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;

    public List<Servicos> read() {
    con = myConnection.getConnection();
    List<Servicos> servicos = new ArrayList<>();
    String sql = "SELECT * FROM servicos";
    try {
        stmt = con.prepareStatement(sql);
        rs = stmt.executeQuery();
        while (rs.next()) {
            // Instanciar um objeto do tipo Servico
            Servicos servico = new Servicos();
            // Setar as informações obtidas no objeto
            servico.setId(rs.getInt("id"));
            servico.setNome(rs.getString("nome"));
            servico.setDescricao(rs.getString("descricao"));
            
            servicos.add(servico);
        }
    } catch (SQLException e) {
        System.out.println("Erro ao tentar listar serviços: " + e);
    } finally {
        myConnection.closeConnection(con, stmt, rs);
    }
    return servicos;
}

    
}
