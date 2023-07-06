/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AgendamentoDAO;
import java.util.List;
import model.Agendamento;

public class Agendamento_ctrl {




   /* 
    public List<Agendamento> select_all() {
        AgendamentoDAO dao = new AgendamentoDAO();
        return dao.read();
    }

    public boolean validarDados(Agendamento agenda) {
        return agenda.getNome()!= 0
                && mat.getIdTurma() != 0
                && mat.getValor() > 0;
    }
    public boolean salvarDados(Matricula matricula) {
        boolean resp = false;
        
        if (validarDados (matricula)) {
            MatriculaDAO dao = new MatriculaDAO();
            
            if (matricula.getIdMatricula()!= 0) {
            
            resp = dao.update(matricula);
                
            } else {
            resp = dao.create(matricula);
            
            }
        }         
        return resp;
    }
    
     public boolean delete(int id) {
        MatriculaDAO dao = new MatriculaDAO();
        return dao.delete(id);
    
        
}*/

}
