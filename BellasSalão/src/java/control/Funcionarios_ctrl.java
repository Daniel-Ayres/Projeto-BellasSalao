package control;

import dao.AgendamentoDAO;
import dao.FuncionariosDAO;
import java.util.List;
import model.Funcionarios;

public class Funcionarios_ctrl {
    AgendamentoDAO dao = new AgendamentoDAO();
    public List<Funcionarios> select_all() {
        FuncionariosDAO dao = new FuncionariosDAO();
        return dao.read();
    }  
    
   public boolean validarDados(Funcionarios func) {
    return !func.getNome().isEmpty() &&
           !func.getUsuario().isEmpty() &&
           !func.getCargo().isEmpty() &&
           !func.getTelefone().isEmpty() &&
           !func.getSenha().isEmpty();
}
    
    public boolean salvarDados(Funcionarios func) {
        boolean resp = false;
        
        if (validarDados (func)) {
            FuncionariosDAO dao = new FuncionariosDAO();
            
            if (func.getId() != 0) {
            
            resp = dao.update(func);
                
            } else {
            resp = dao.create(func);
            
            }
            
        }         
        
        return resp;
    }
    public boolean delete(int id) {
        return dao.delete(id);
    }

  
}
