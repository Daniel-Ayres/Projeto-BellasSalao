package dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import model.Agendamento;
import model.Clientes;

public class ClientesDAO {

    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    private Clientes cli = new Clientes();

    public Clientes logar(Clientes clientes) {
        Clientes clie = new Clientes();
        con = myConnection.getConnection();
        String sql = "SELECT * FROM clientes WHERE usuario=? AND senha=?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, clientes.getUsuario());
            stmt.setString(2, clientes.getSenha());
            rs = stmt.executeQuery();
            while (rs.next()) {
                clie.setIdCliente(rs.getInt("idCliente"));
                clie.setNome(rs.getString("nome"));
                clie.setUsuario((rs.getString("usuario")));
                clie.setEmail(rs.getString("email"));
                clie.setTelefone((rs.getString("telefone")));
                clie.setSenha((rs.getString("senha")));
            }

            // Chamada do método para obter o ID do cliente logado
            int idCliente = obterIdClienteLogado(clientes);
            clie.setIdCliente(idCliente);

        } catch (Exception e) {
            System.out.println("Nome de usuário ou senha incorretos!" + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return clie;
    }

    public boolean create(Clientes clientes) {
    boolean right = false;
    con = myConnection.getConnection();
    
    String sql = "insert into clientes(nome, usuario, telefone, email, senha) values(?, ?, ?, ?, ?)";
    try {
        stmt = con.prepareStatement(sql);
        stmt.setString(1, clientes.getNome());
        stmt.setString(2, clientes.getUsuario());
        stmt.setString(3, clientes.getTelefone());
        stmt.setString(4, clientes.getEmail());
        stmt.setString(5, clientes.getSenha());
        stmt.executeUpdate();
        right = true;
    } catch (Exception e) {
        System.out.println("Erro ao tentar inserir novo Usuário!" + e);
    } finally {
        myConnection.closeConnection(con, stmt);
    }
    
   
    
    return right;
}


    public Clientes listar_clientes(int id) {
        con = myConnection.getConnection();
        Clientes cliente = new Clientes();
        String sql = "select * from clientes where idCliente=?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {

                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setUsuario((rs.getString("usuario")));
                cliente.setEmail(rs.getString("email"));
                cliente.setTelefone((rs.getString("telefone")));
                cliente.setSenha((rs.getString("senha")));

            }

        } catch (Exception e) {
            System.out.println("Erro ao tentar listar Alunos!" + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return cliente;
    }

    public List<Clientes> read() {
        con = myConnection.getConnection();
        List clientes = new ArrayList();
        String sql = "select * from clientes";
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                //instanciar um objeto do tipo Clientes
                Clientes cli = new Clientes();
                //setar as informações obtidas no objeto
                cli.setIdCliente(rs.getInt("idCliente"));
                cli.setNome(rs.getString("nome"));
                cli.setUsuario(rs.getString("usuario"));
                cli.setTelefone((rs.getString("telefone")));
                cli.setEmail(rs.getString("email"));
                cli.setSenha((rs.getString("senha")));

                clientes.add(cli);
            }

        } catch (Exception e) {
            System.out.println("Erro ao tentar listar Clientes!" + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return clientes;
    }

    public boolean update(Clientes cliente) {
        boolean right = false;
        con = myConnection.getConnection();
        String sql = "update clientes set nome=?, usuario=?, telefone=?, email=?, senha=? where idCliente=? ";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getUsuario());
            stmt.setString(3, cliente.getTelefone());
            stmt.setString(4, cliente.getEmail());
            stmt.setString(5, cliente.getSenha());
            stmt.setInt(6, cliente.getIdCliente());
            stmt.executeUpdate();
            right = true;

        } catch (Exception e) {
            System.out.println("Erro ao tentar atualizar dados do Clientes!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return right;
    }

    public boolean delete(int id) {
        boolean success = false;
        con = myConnection.getConnection();

        try {
            con.setAutoCommit(false); // Desabilita o commit automático

            String deleteAgendamentosSql = "DELETE FROM agendamento WHERE cliente_id = ?";
            stmt = con.prepareStatement(deleteAgendamentosSql);
            stmt.setInt(1, id);
            stmt.executeUpdate();

            String deleteClienteSql = "DELETE FROM clientes WHERE idCliente = ?";
            stmt = con.prepareStatement(deleteClienteSql);
            stmt.setInt(1, id);
            stmt.executeUpdate();

            con.commit(); // Executa o commit da transação
            success = true;
        } catch (Exception e) {
            try {
                con.rollback(); // Em caso de erro, faz o rollback da transação
            } catch (Exception rollbackException) {
                System.out.println("Erro ao tentar fazer rollback da transação: " + rollbackException);
            }
            System.out.println("Erro ao tentar excluir Aluno!" + e);
        } finally {
            try {
                con.setAutoCommit(true); // Habilita o commit automático novamente
            } catch (Exception setAutoCommitException) {
                System.out.println("Erro ao tentar reativar o commit automático: " + setAutoCommitException);
            }
            myConnection.closeConnection(con, stmt);
        }

        return success;
    }

    private int idClienteObtido;

    public int obterIdClienteLogado(Clientes cliente) {
        con = myConnection.getConnection();
        String sql = "SELECT idCliente FROM clientes WHERE usuario=?";
        int idCliente = 0;
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, cliente.getUsuario());
            rs = stmt.executeQuery();
            if (rs.next()) {
                System.out.println("o id é  no obter" + idCliente);
                idCliente = rs.getInt("idCliente");

                idClienteObtido = idCliente; // Atribui o valor a variável de instância
            }
        } catch (Exception e) {
            System.out.println("Erro ao obter o ID do cliente logado: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return idCliente;
    }

    public int getTotalClientes() {
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) AS total FROM clientes";
        int totalClientes = 0;

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            if (rs.next()) {
                totalClientes = rs.getInt("total");
            }
        } catch (Exception e) {
            System.out.println("Erro ao obter o total de clientes: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }

        return totalClientes;
    }

    public boolean verificarUsuarioExistente(String usuario) {
        boolean usuarioExistente = false;
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM clientes WHERE usuario = ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, usuario);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    usuarioExistente = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao verificar existência de usuário: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return usuarioExistente;
    }

    public boolean verificarEmailExistente(String email) {
        boolean emailExistente = false;
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM clientes WHERE email = ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    emailExistente = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao verificar existência de email: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return emailExistente;
    }

    public boolean verificarTelefoneExistente(String telefone) {
        boolean telefoneExistente = false;
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) FROM clientes WHERE telefone = ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, telefone);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    telefoneExistente = true;
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao verificar existência de telefone: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return telefoneExistente;
    }

}
