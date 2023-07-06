package dao;

import connection.ConnectionFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import model.Agendamento;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import model.Agendamentos;

public class AgendamentoDAO {

    private ConnectionFactory myConnection = new ConnectionFactory();
    private Connection con;
    private PreparedStatement stmt;
    private ResultSet rs;
    private Agendamento agend = new Agendamento();

public boolean create(Agendamento agendamento) {
    boolean right = false;
    con = myConnection.getConnection();

    // Verificar se a data é anterior ao dia atual
    Calendar currentCal = Calendar.getInstance();
    currentCal.set(Calendar.HOUR_OF_DAY, 0);
    currentCal.set(Calendar.MINUTE, 0);
    currentCal.set(Calendar.SECOND, 0);
    currentCal.set(Calendar.MILLISECOND, 0);

    Calendar agendamentoCal = Calendar.getInstance();
    agendamentoCal.setTime(agendamento.getData_Agendamento());
    agendamentoCal.set(Calendar.HOUR_OF_DAY, 0);
    agendamentoCal.set(Calendar.MINUTE, 0);
    agendamentoCal.set(Calendar.SECOND, 0);
    agendamentoCal.set(Calendar.MILLISECOND, 0);

    if (agendamentoCal.before(currentCal)) {
        System.out.println("Não é possível agendar para datas anteriores ao dia atual.");
        return right;
    }

    // Verificar se o dia é domingo
    Calendar cal = Calendar.getInstance();
    cal.setTime(agendamento.getData_Agendamento());
    int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
    if (dayOfWeek == Calendar.SUNDAY) {
        System.out.println("Não é possível agendar no domingo.");
        return right;
    }

    // Verificar se o horário está dentro do intervalo permitido (7h às 20h)
    int hourOfDay = cal.get(Calendar.HOUR_OF_DAY);
    if (hourOfDay < 7 || hourOfDay >= 20) {
        System.out.println("O horário de agendamento deve estar entre 7h e 20h.");
        return right;
    }

    // Verificar se o horário já está agendado para o dia especificado
    String checkSql = "SELECT * FROM agendamento WHERE DATE(data_agendamento) = DATE(?)";
    try {
        PreparedStatement checkStmt = con.prepareStatement(checkSql);
        checkStmt.setTimestamp(1, new Timestamp(agendamento.getData_Agendamento().getTime()));
        ResultSet rs = checkStmt.executeQuery();

        while (rs.next()) {
            Timestamp existingTimestamp = rs.getTimestamp("data_agendamento");
            Calendar existingCal = Calendar.getInstance();
            existingCal.setTime(existingTimestamp);

            // Verificar se o horário já está agendado para a mesma hora
            int existingHourOfDay = existingCal.get(Calendar.HOUR_OF_DAY);
            if (hourOfDay == existingHourOfDay) {
                System.out.println("Já existe um agendamento para esse horário.");
                return right;
            }

            // Verificar se o horário está a menos de uma hora do agendamento existente
            if (Math.abs(hourOfDay - existingHourOfDay) < 1) {
                System.out.println("O próximo agendamento só pode ser realizado com pelo menos uma hora de intervalo.");
                return right;
            }
        }
    } catch (SQLException e) {
        System.out.println("Erro ao verificar agendamento existente: " + e);
        return right;
    }

    // Restante do código para inserir o agendamento no banco de dados
    String insertSql = "INSERT INTO agendamento (nome_cliente, email, cliente_id, funcionario_id, servico_id, data_agendamento, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try {
        stmt = con.prepareStatement(insertSql);
        stmt.setString(1, agendamento.getNome_cliente());
        stmt.setString(2, agendamento.getEmail());
        stmt.setInt(3, agendamento.getCliente_Id());
        stmt.setInt(4, agendamento.getFuncionario_Id());
        stmt.setInt(5, agendamento.getServico_Id());
        stmt.setTimestamp(6, new Timestamp(agendamento.getData_Agendamento().getTime()));
        stmt.setString(7, "em espera"); // Definir o status como "em espera"
        stmt.executeUpdate();
        right = true;
    } catch (SQLException e) {
        System.out.println("Erro ao tentar inserir novo agendamento: " + e);
    } finally {
        myConnection.closeConnection(con, stmt);
    }

    return right;
}



    public List<Agendamentos> read() {
        List<Agendamentos> agendamentos = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT a.idAgendamento, a.nome_cliente, a.data_agendamento, f.nome funcionario, s.nome servico, a.status FROM agendamento a, funcionarios f, servicos s WHERE a.funcionario_id = f.id AND  a.servico_id = s.id AND a.status = 'em espera'";
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                // Verificar se a data de agendamento está no mês atual
                Timestamp dataAgendamento = rs.getTimestamp("data_agendamento");
                Calendar calAgendamento = Calendar.getInstance();
                calAgendamento.setTime(dataAgendamento);
                int mesAgendamento = calAgendamento.get(Calendar.MONTH);

                Calendar calAtual = Calendar.getInstance();
                int mesAtual = calAtual.get(Calendar.MONTH);

                if (mesAgendamento == mesAtual) {
                    System.out.println("ID AGEND " + rs.getInt("idAgendamento"));
                    // Resto do seu código para criar e adicionar o objeto Agendamentos na lista
                    Agendamentos agendamento = new Agendamentos();
                    // Setar as informações obtidas no objeto
                    agendamento.setIdAgendamento(rs.getInt("idAgendamento"));
                    agendamento.setNome_cliente(rs.getString("nome_cliente"));
                    agendamento.setFuncionario(rs.getString("funcionario"));
                    agendamento.setServico(rs.getString("servico"));
                    agendamento.setData_agendamento(rs.getTimestamp("data_agendamento"));
                    agendamento.setStatus(rs.getString("status"));

                    agendamentos.add(agendamento);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao tentar listar agendamentos: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return agendamentos;
    }

    public List<Agendamentos> getAgendamentosConfirmados() {
        List<Agendamentos> agendamentos = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT a.idAgendamento, a.nome_cliente, a.data_agendamento, f.nome AS funcionario, s.nome AS servico, a.status FROM agendamento a, funcionarios f, servicos s WHERE a.funcionario_id = f.id AND  a.servico_id = s.id AND a.status IN ('confirmado', 'realizado')";
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                // Verificar se a data de agendamento está no mês atual
                Timestamp dataAgendamento = rs.getTimestamp("data_agendamento");
                Calendar calAgendamento = Calendar.getInstance();
                calAgendamento.setTime(dataAgendamento);
                int mesAgendamento = calAgendamento.get(Calendar.MONTH);

                Calendar calAtual = Calendar.getInstance();
                int mesAtual = calAtual.get(Calendar.MONTH);

                if (mesAgendamento == mesAtual) {
                    System.out.println("ID AGEND " + rs.getInt("idAgendamento"));
                    // Resto do seu código para criar e adicionar o objeto Agendamentos na lista
                    Agendamentos agendamento = new Agendamentos();
                    // Setar as informações obtidas no objeto
                    agendamento.setIdAgendamento(rs.getInt("idAgendamento"));
                    agendamento.setNome_cliente(rs.getString("nome_cliente"));
                    agendamento.setFuncionario(rs.getString("funcionario"));
                    agendamento.setServico(rs.getString("servico"));
                    agendamento.setData_agendamento(rs.getTimestamp("data_agendamento"));
                    agendamento.setStatus(rs.getString("status"));

                    agendamentos.add(agendamento);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao tentar listar agendamentos: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return agendamentos;
    }
    public List<Agendamentos> listAgendamentos() {
        List<Agendamentos> agendamentos = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT a.idAgendamento, a.nome_cliente, a.data_agendamento, f.nome AS funcionario, s.nome AS servico, a.status FROM agendamento a, funcionarios f, servicos s WHERE a.funcionario_id = f.id AND  a.servico_id = s.id";
        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                // Verificar se a data de agendamento está no mês atual
                Timestamp dataAgendamento = rs.getTimestamp("data_agendamento");
                Calendar calAgendamento = Calendar.getInstance();
                calAgendamento.setTime(dataAgendamento);
                int mesAgendamento = calAgendamento.get(Calendar.MONTH);

                Calendar calAtual = Calendar.getInstance();
                int mesAtual = calAtual.get(Calendar.MONTH);

                if (mesAgendamento == mesAtual) {
                    System.out.println("ID AGEND " + rs.getInt("idAgendamento"));
                    // Resto do seu código para criar e adicionar o objeto Agendamentos na lista
                    Agendamentos agendamento = new Agendamentos();
                    // Setar as informações obtidas no objeto
                    agendamento.setIdAgendamento(rs.getInt("idAgendamento"));
                    agendamento.setNome_cliente(rs.getString("nome_cliente"));
                    agendamento.setFuncionario(rs.getString("funcionario"));
                    agendamento.setServico(rs.getString("servico"));
                    agendamento.setData_agendamento(rs.getTimestamp("data_agendamento"));
                    agendamento.setStatus(rs.getString("status"));

                    agendamentos.add(agendamento);
                }
            }
        } catch (SQLException e) {
            System.out.println("Erro ao tentar listar agendamentos: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return agendamentos;
    }

    public boolean update(Agendamento agendamento) {
        boolean success = false;
        con = myConnection.getConnection();
        String sql = "UPDATE agendamento SET nome_cliente=?, email=?, funcionario_id=?, servico_id=?, data_agendamento=? WHERE idAgendamento=?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, agendamento.getNome_cliente());
            stmt.setString(2, agendamento.getEmail());
            stmt.setInt(3, agendamento.getFuncionario_Id());
            stmt.setInt(4, agendamento.getServico_Id());
            stmt.setTimestamp(5, new Timestamp(agendamento.getData_Agendamento().getTime()));
            stmt.setInt(6, agendamento.getIdAgendamento());
            stmt.executeUpdate();
            success = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar atualizar dados do Agendamento!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return success;
    }

    public boolean delete(int id) {
        boolean success = false;
        con = myConnection.getConnection();
        String sql = "DELETE FROM agendamento WHERE idAgendamento=?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.executeUpdate();
            success = true;
        } catch (Exception e) {
            System.out.println("Erro ao tentar excluir Agendamento!" + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return success;
    }

    /*public List<Agendamento> getAgendamentosCliente(int idCliente) {
        List<Agendamento> agendamentos = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT * FROM agendamento WHERE cliente_Id = ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Agendamento agendamento = new Agendamento();
                agendamento.setCliente_Id(rs.getInt("cliente_Id"));
                agendamento.setIdAgendamento(rs.getInt("idAgendamento"));
                agendamento.setNome_cliente(rs.getString("nome_cliente"));
                agendamento.setEmail(rs.getString("email"));
                agendamento.setFuncionario_Id(rs.getInt("funcionario_id"));
                agendamento.setServico_Id(rs.getInt("servico_id"));
                agendamento.setData_Agendamento(rs.getTimestamp("data_agendamento"));

                agendamentos.add(agendamento);
            }
        } catch (Exception e) {
            System.out.println("Erro ao obter os agendamentos do cliente: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return agendamentos;
    }*/
    public List<Agendamentos> getAgendamentosCliente(int idCliente) {
        List<Agendamentos> agendamentos = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT a.idAgendamento, a.nome_cliente, a.email, a.data_agendamento, a.cliente_id, "
                + "f.nome funcionario, s.nome servico, a.status "
                + "FROM agendamento a, funcionarios f, servicos s "
                + "WHERE a.funcionario_id = f.id "
                + "AND a.servico_id = s.id AND cliente_id = ? "
                + "AND (a.status = 'em espera' OR a.status = 'confirmado') "
                + "AND MONTH(a.data_agendamento) = ?"; // Adiciona a condição para o mês atual
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idCliente);

            // Obtém o mês atual
            Calendar cal = Calendar.getInstance();
            int month = cal.get(Calendar.MONTH) + 1; // Adiciona +1 porque os meses em Calendar são baseados em 0

            stmt.setInt(2, month);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Agendamentos agendamento = new Agendamentos();
                agendamento.setCliente_id(rs.getInt("cliente_Id"));
                agendamento.setIdAgendamento(rs.getInt("idAgendamento"));
                agendamento.setNome_cliente(rs.getString("nome_cliente"));
                agendamento.setEmail(rs.getString("email"));
                agendamento.setFuncionario(rs.getString("funcionario"));
                agendamento.setServico(rs.getString("servico"));
                agendamento.setData_agendamento(rs.getTimestamp("data_agendamento"));
                agendamento.setStatus(rs.getString("status"));

                agendamentos.add(agendamento);
            }
        } catch (Exception e) {
            System.out.println("Erro ao obter os agendamentos do cliente: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return agendamentos;
    }

    public boolean cancelAgendamento(int idAgendamento) {
        boolean success = false;
        con = myConnection.getConnection();
        String sql = "UPDATE agendamento SET status = 'cancelado' WHERE idAgendamento = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idAgendamento);
            stmt.executeUpdate();
            success = true;
        } catch (SQLException e) {
            System.out.println("Erro ao tentar cancelar o agendamento: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return success;
    }

    public List<Agendamentos> getAgendamentosCancelados(int idCliente) {
        List<Agendamentos> agendamentos = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT a.idAgendamento, a.nome_cliente, "
                + "a.data_agendamento, a.cliente_id, "
                + "f.nome funcionario, s.nome servico, "
                + "a.status FROM agendamento a, funcionarios "
                + "f, servicos s WHERE a.funcionario_id = f.id AND "
                + "a.servico_id = s.id AND a.cliente_id = ? "
                + "AND a.status = 'cancelado'";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idCliente);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("ID CLIENTE DAO " + idCliente);
                Agendamentos agendamento = new Agendamentos();
                agendamento.setCliente_id(rs.getInt("cliente_Id"));
                agendamento.setIdAgendamento(rs.getInt("idAgendamento"));
                agendamento.setNome_cliente(rs.getString("nome_cliente"));
                agendamento.setFuncionario(rs.getString("funcionario"));
                agendamento.setServico(rs.getString("servico"));
                agendamento.setData_agendamento(rs.getTimestamp("data_agendamento"));
                agendamento.setStatus(rs.getString("status"));
                agendamentos.add(agendamento);
            }
        } catch (Exception e) {
            System.out.println("Erro ao obter os agendamentos do cliente: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return agendamentos;
    }

    public boolean retomarAgendamento(int idAgendamento) {
        boolean success = false;
        con = myConnection.getConnection();
        String sql = "UPDATE agendamento SET status = 'em espera' WHERE idAgendamento = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idAgendamento);
            stmt.executeUpdate();
            success = true;
        } catch (SQLException e) {
            System.out.println("Erro ao tentar retomar o agendamento: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return success;
    }

    public boolean confirmarAgendamento(int idAgendamento) {
        boolean success = false;
        con = myConnection.getConnection();
        String sql = "UPDATE agendamento SET status = 'confirmado' WHERE idAgendamento = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idAgendamento);
            stmt.executeUpdate();
            success = true;
        } catch (SQLException e) {
            System.out.println("Erro ao tentar confirmar o agendamento: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return success;
    }

     public boolean agendRealizado(int idAgendamento) {
        boolean success = false;
        con = myConnection.getConnection();
        String sql = "UPDATE agendamento SET status = 'realizado' WHERE idAgendamento = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, idAgendamento);
            stmt.executeUpdate();
            success = true;
        } catch (SQLException e) {
            System.out.println("Erro ao tentar confirmar o agendamento: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }
        return success;
    }

    public int getQuantidadeAgendamentosCancelados() {
        int quantidadeCancelados = 0;
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) AS quantidade FROM agendamento WHERE status = 'cancelado'";

        try {
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                quantidadeCancelados = rs.getInt("quantidade");
            }
        } catch (SQLException e) {
            System.out.println("Erro ao obter a quantidade de agendamentos cancelados: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return quantidadeCancelados;
    }

    public int getQuantidadeAgendamentosEmEspera() {
        int quantidadeEmEspera = 0;
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) AS quantidade FROM agendamento WHERE status = 'em espera'";

        try {
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                quantidadeEmEspera = rs.getInt("quantidade");
            }
        } catch (SQLException e) {
            System.out.println("Erro ao obter a quantidade de agendamentos em espera: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return quantidadeEmEspera;
    }

    public int getQuantidadeAgendamentosConfirmado() {
        int quantidadeEmEspera = 0;
        con = myConnection.getConnection();
        String sql = "SELECT COUNT(*) AS quantidade FROM agendamento WHERE status = 'confirmado'";

        try {
            stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                quantidadeEmEspera = rs.getInt("quantidade");
            }
        } catch (SQLException e) {
            System.out.println("Erro ao obter a quantidade de agendamentos em espera: " + e);
        } finally {
            myConnection.closeConnection(con, stmt);
        }

        return quantidadeEmEspera;
    }

    public List<Agendamentos> searchByCliente(String nomeCliente) {
        List<Agendamentos> agendamentos = new ArrayList<>();
        con = myConnection.getConnection();
        String sql = "SELECT a.idAgendamento, a.nome_cliente, a.data_agendamento, f.nome funcionario, s.nome servico, a.status FROM agendamento a, funcionarios f, servicos s WHERE a.funcionario_id = f.id AND a.servico_id = s.id AND a.nome_cliente LIKE ?";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, "%" + nomeCliente + "%");
            rs = stmt.executeQuery();
            while (rs.next()) {
                Agendamentos agendamento = new Agendamentos();
                agendamento.setIdAgendamento(rs.getInt("idAgendamento"));
                agendamento.setNome_cliente(rs.getString("nome_cliente"));
                agendamento.setFuncionario(rs.getString("funcionario"));
                agendamento.setServico(rs.getString("servico"));
                agendamento.setData_agendamento(rs.getTimestamp("data_agendamento"));
                agendamento.setStatus(rs.getString("status"));

                agendamentos.add(agendamento);
            }
        } catch (SQLException e) {
            System.out.println("Erro ao tentar pesquisar agendamentos por cliente: " + e);
        } finally {
            myConnection.closeConnection(con, stmt, rs);
        }
        return agendamentos;
    }

}
