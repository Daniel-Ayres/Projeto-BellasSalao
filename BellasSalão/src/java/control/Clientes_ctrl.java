package control;

import dao.ClientesDAO;
import java.util.List;
import model.Clientes;

public class Clientes_ctrl {

    
    public List<Clientes> select_all() {
        ClientesDAO dao = new ClientesDAO();
        return dao.read();
    }  
    
    public boolean validarDados (Clientes cli) {
      return !cli.getNome().isEmpty() &&
             !cli.getUsuario().isEmpty() &&
             !cli.getEmail().isEmpty() &&
             !cli.getTelefone().isEmpty() &&
             !cli.getSenha().isEmpty();
    }
    
    public boolean salvarDados(Clientes cli) {
        boolean resp = false;
        
        if (validarDados (cli)) {
            ClientesDAO dao = new ClientesDAO();
            
            if (cli.getIdCliente() != 0) {
            
            resp = dao.update(cli);
                
            } else {
            resp = dao.create(cli);
            
            }
        }         
        return resp;
    }

    public boolean delete(int id) {
        ClientesDAO dao = new ClientesDAO();
        return dao.delete(id);
    }
        
}
