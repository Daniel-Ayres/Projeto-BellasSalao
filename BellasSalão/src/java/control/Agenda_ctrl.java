
package control;
import dao.AgendamentoDAO;
import java.util.List;
import model.Agendamento;
import model.Agendamentos;

public class Agenda_ctrl {
    private AgendamentoDAO dao = new AgendamentoDAO();

    public List<Agendamentos> select_all() {
        return dao.read();
    }  
    
    public boolean validarDados(Agendamento agendamento) {
        return !agendamento.getNome_cliente().isEmpty() &&
               !agendamento.getEmail().isEmpty() &&
               agendamento.getFuncionario_Id() != 0 &&
               agendamento.getCliente_Id()!= 0 &&
               agendamento.getServico_Id() != 0 &&
               agendamento.getData_Agendamento() != null;
    }
    
    public boolean salvarDados(Agendamento agendamento) {
        boolean resp = false;
        
        if (validarDados(agendamento)) {
            if (agendamento.getIdAgendamento()!= 0) {
                resp = dao.update(agendamento);
            } else {
                resp = dao.create(agendamento);
            }
        }         
        return resp;
    }

    public boolean delete(int id) {
        return dao.delete(id);
    }
}

