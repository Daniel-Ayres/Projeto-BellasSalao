/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import model.Funcionarios;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

public class FuncionariosDAO {

    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    private Funcionarios func = new Funcionarios();

    public Funcionarios logar(Funcionarios funcionario) {
        Funcionarios func = new Funcionarios();
        con = myConnection.getConnection();
        String sql = "SELECT * FROM funcionarios WHERE usuario=? AND senha=?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, funcionario.getUsuario());
            stmt.setString(2, funcionario.getSenha());
            rs = stmt.executeQuery();
            while (rs.next()) {
                func.setId(rs.getInt("id"));
                func.setNome(rs.getString("nome"));
                func.setUsuario((rs.getString("usuario")));
                func.setCargo((rs.getString("cargo")));
                func.setTelefone((rs.getString("telefone")));
                func.setSenha((rs.getString("senha")));
            }

        } catch (Exception e) {
            System.out.println("Nome de usuário ou senha incorretos!" + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return func;
    }
public boolean create(Funcionarios funcionario) {
    boolean right = false;
    con = myConnection.getConnection();
    
    // Verificar se o usuário já existe
    String verificarUsuarioSql = "SELECT COUNT(*) FROM funcionarios WHERE usuario = ?";
    try {
        PreparedStatement verificarStmt = con.prepareStatement(verificarUsuarioSql);
        verificarStmt.setString(1, funcionario.getUsuario());
        ResultSet rs = verificarStmt.executeQuery();
        rs.next();
        int count = rs.getInt(1);
        if (count > 0) {
            System.out.println("Usuário já existe na tabela funcionarios!");
            return false; // Retorna falso se o usuário já existir
        }
    } catch (Exception e) {
        System.out.println("Erro ao verificar usuário existente: " + e);
        return false; // Retorna falso em caso de erro
    }
    
    // Inserir novo funcionário
    String inserirSql = "INSERT INTO funcionarios(nome, usuario, cargo, telefone, senha) VALUES(?, ?, ?, ?, ?)";
    try {
        stmt = con.prepareStatement(inserirSql);
        stmt.setString(1, funcionario.getNome());
        stmt.setString(2, funcionario.getUsuario());
        stmt.setString(3, funcionario.getCargo());
        stmt.setString(4, funcionario.getTelefone());
        stmt.setString(5, funcionario.getSenha());
        stmt.executeUpdate();
        right = true;
    } catch (Exception e) {
        System.out.println("Erro ao tentar inserir novo funcionário: " + e);
    } finally {
        myConnection.closeConnection(con, stmt);
    }
    
    return right;
}
 public boolean delete(int id) {
        boolean success = false;
        con = myConnection.getConnection();
        String sql = "DELETE FROM funcionarios WHERE id=?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            success = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar excluir Funcionario!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return success;
    }


    public List<Funcionarios> read() {
        con = myConnection.getConnection();
        List<Funcionarios> funcionarios = new ArrayList<>();
        String sql = "SELECT * from funcionarios";
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                // Instanciar um objeto do tipo Funcionarios
                Funcionarios funcionario = new Funcionarios();
                // Setar as informações obtidas no objeto
                funcionario.setId(rs.getInt("id"));
                funcionario.setNome(rs.getString("nome"));
                funcionario.setCargo(rs.getString("cargo"));
                funcionario.setTelefone(rs.getString("telefone"));
                funcionario.setUsuario(rs.getString("usuario"));
                funcionario.setSenha(rs.getString("senha"));

                funcionarios.add(funcionario);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao tentar listar funcionários: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return funcionarios;
    }
    public boolean update(Funcionarios funcionario) {
        boolean right = false;
        con = myConnection.getConnection();
        String sql = "update funcionarios set nome=?, usuario=?, cargo=?, telefone=?, senha=? where id=? ";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, funcionario.getNome());
            stmt.setString(2, funcionario.getUsuario());
            stmt.setString(3, funcionario.getCargo());
            stmt.setString(4, funcionario.getTelefone());
            stmt.setString(5, funcionario.getSenha());
            stmt.setInt(6, funcionario.getId());
            stmt.executeUpdate();
            right = true;

        } catch (Exception e) {
            System.out.println("Erro ao tentar atualizar dados do Clientes!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return right;
    }
    public Funcionarios listar_funcionario(int id) {
        con = myConnection.getConnection();
        Funcionarios func = new Funcionarios ();
        String sql="select * from funcionarios where id=?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            while (rs.next()) {
               
                func.setId(rs.getInt("id"));
                func.setNome(rs.getString ("nome"));
                func.setUsuario(rs.getString ("usuario"));
                func.setTelefone((rs.getString ("telefone")));
                func.setCargo(rs.getString ("cargo"));
                func.setSenha((rs.getString("senha")));              
            
            }
                    
        } catch (Exception e) {
            System.out.println("Erro ao tentar listar Alunos!" + e);
        }finally {
             myConnection.closeConnection(con, stmt, rs);
        }
        return func;
    }
}
