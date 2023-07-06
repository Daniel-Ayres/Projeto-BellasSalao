package model;

public class Clientes {

    
    private int idCliente;
    private String nome;
    private String usuario;
    private String telefone;
    private String email;
    private String senha;

    public Clientes() {

    }
    
    public Clientes(int idCliente, String nome, String usuario, String telefone, String email, String senha) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.usuario = usuario;
        this.telefone = telefone;
        this.email = email;
        this.senha = senha;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    

    

    
}
