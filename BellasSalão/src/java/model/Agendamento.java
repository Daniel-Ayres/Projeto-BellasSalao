
package model;

import java.sql.Timestamp;

public class Agendamento {
    
   private int idAgendamento;
   private String nome_cliente;
   private String email;
   private int cliente_Id;
   private int funcionario_Id;
   private int servico_Id;
   private Timestamp data_Agendamento;
   private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Agendamento() {
    }

    public Agendamento(int idAgendamento, String nome_cliente, String email, int cliente_Id, int funcionario_Id, int servico_Id, Timestamp data_Agendamento) {
        this.idAgendamento = idAgendamento;
        this.nome_cliente = nome_cliente;
        this.email = email;
        this.cliente_Id = cliente_Id;
        this.funcionario_Id = funcionario_Id;
        this.servico_Id = servico_Id;
        this.data_Agendamento = data_Agendamento;
    }

    public int getIdAgendamento() {
        return idAgendamento;
    }

    public void setIdAgendamento(int idAgendamento) {
        this.idAgendamento = idAgendamento;
    }

    public String getNome_cliente() {
        return nome_cliente;
    }

    public void setNome_cliente(String nome_cliente) {
        this.nome_cliente = nome_cliente;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCliente_Id() {
        return cliente_Id;
    }

    public void setCliente_Id(int cliente_Id) {
        this.cliente_Id = cliente_Id;
    }

    public int getFuncionario_Id() {
        return funcionario_Id;
    }

    public void setFuncionario_Id(int funcionario_Id) {
        this.funcionario_Id = funcionario_Id;
    }

    public int getServico_Id() {
        return servico_Id;
    }

    public void setServico_Id(int servico_Id) {
        this.servico_Id = servico_Id;
    }

    public Timestamp getData_Agendamento() {
        return data_Agendamento;
    }

    public void setData_Agendamento(Timestamp data_Agendamento) {
        this.data_Agendamento = data_Agendamento;
    }
   
   
   
   
}
