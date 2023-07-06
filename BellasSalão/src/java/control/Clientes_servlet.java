package control;

import dao.ClientesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Clientes;
import model.Agendamento; // Importe a classe Agendamento correta

/**
 *
 * author sala303b
 */
public class Clientes_servlet extends HttpServlet {

    Clientes clientes = new Clientes();
    ClientesDAO dao = new ClientesDAO();
    Clientes_ctrl ctrl = new Clientes_ctrl();

    //páginas
    String sucesso = "sucesso.jsp";
    String erro = "erro.jsp";
    String listar = "DadosClientes.jsp";
    String inicial = "index.jsp";
    String editar = "editarCliente.jsp";
    String editarAdmClie = "EditarClieAdm.jsp";
    String login = "login.jsp";
    String listCliente = "DadosClientes.jsp";
    String abrir = "";
    String excluir = "editarCliente.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String acao = request.getParameter("acao");
        if (acao.equals("listar_clientes")) {
                abrir = listar;
                request.setAttribute("clientes", dao.read());
        }else if (acao.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            abrir = editarAdmClie;
            request.setAttribute("cliente", dao.listar_clientes(id));
        }
        
         if (acao.equals("excluir")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (dao.delete(id)) {
                abrir = sucesso;
                request.setAttribute("msg", "Deuuuuuuuuuu");
                request.setAttribute("target", login);

            } else {
                abrir = erro;
                request.setAttribute("msg", "Que que foi, que que foi, que que há? ");

            }
         }
             if (acao.equals("excluirClieAdm")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (dao.delete(id)) {
                abrir = sucesso;
                request.setAttribute("msg", "Cliente excluído com sucesso!!");
                request.setAttribute("target", listCliente);

            } else {
                abrir = erro;
                request.setAttribute("msg", "Erro ao excluir o cliente ");
                 request.setAttribute("target", listCliente);

            }
             }
         
            
         RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
        visualizar.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //processRequest(request, response);

        String acao = request.getParameter("acao");

        if (acao.equals("cad_clientes")) {
            clientes.setNome(request.getParameter("txtNome"));
            clientes.setUsuario(request.getParameter("txtUsuario"));
            clientes.setEmail(request.getParameter("txtEmail"));
            clientes.setTelefone(request.getParameter("txtTel"));
            clientes.setSenha(request.getParameter("txtSenha"));

            // Verificar se a senha contém espaços em branco
            if (clientes.getSenha().contains(" ")) {
                abrir = erro;
                request.setAttribute("msg", "A senha não pode conter espaços em branco!");
                request.setAttribute("target", login);
            } else {
                if (ctrl.validarDados(clientes)) {
                    try {
                        boolean usuarioExistente = dao.verificarUsuarioExistente(clientes.getUsuario());
                        boolean emailExistente = dao.verificarEmailExistente(clientes.getEmail());
                        boolean telefoneExistente = dao.verificarTelefoneExistente(clientes.getTelefone());

                        // Verificar se o usuário, email ou telefone já existem
                        if (usuarioExistente || emailExistente || telefoneExistente) {
                            abrir = erro;
                            StringBuilder mensagemErro = new StringBuilder("Erro ao tentar cadastrar!");

                            if (usuarioExistente) {
                                mensagemErro.append(" Nome de usuário já existe!");
                            }

                            if (emailExistente) {
                                mensagemErro.append(" Endereço de email já existe!");
                            }

                            if (telefoneExistente) {
                                mensagemErro.append(" Número de telefone já existe!");
                            }

                            request.setAttribute("msg", mensagemErro.toString());
                            request.setAttribute("target", login);
                        } else {
                            if (dao.create(clientes)) {
                                abrir = sucesso;
                                request.setAttribute("msg", "Cadastro feito com sucesso!");
                                request.setAttribute("target", login);
                            } else {
                                abrir = erro;
                                request.setAttribute("msg", "Erro ao tentar cadastrar!");
                                request.setAttribute("target", login);
                            }
                        }
                    } catch (Exception e) {
                        request.setAttribute("msg", "Erro ao tentar cadastrar!");
                        request.setAttribute("target", login);
                        e.printStackTrace(); // Imprime a pilha de exceções para debug
                    }
                }
            }
        }

        HttpSession session = request.getSession();

        if (acao.equals("logar")) {
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            clientes.setUsuario(usuario);
            clientes.setSenha(senha);

            clientes = dao.logar(clientes);
            if (clientes.getNome() != null) {
               abrir = sucesso;
                session.setAttribute("cliente", clientes);
                request.setAttribute("msg", "Login feito com sucesso!!");
                request.setAttribute("target", inicial);
               
               
            } else {
                abrir = erro;
                session.removeAttribute("nome");
                request.setAttribute("msg", "Erro ao fazer login do usuário");
                request.setAttribute("target", login);
            }

        } else if (acao.equals("atualizar")) {
            Clientes cliente = new Clientes();
            cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            cliente.setNome(request.getParameter("txtNome"));
            cliente.setUsuario(request.getParameter("txtUsuario"));
            cliente.setEmail(request.getParameter("txtEmail"));
            cliente.setTelefone(request.getParameter("txtTel"));
            cliente.setSenha(request.getParameter("txtSenha"));
            try {
                if (dao.update(cliente)) {
                    abrir = sucesso;
                    request.setAttribute("msg", "Eba!!! Aluno atualizado com sucesso!");
                    request.setAttribute("target", excluir);

                    // Obtém as informações atualizadas do cliente
                    Timer timer = new Timer();
                    timer.schedule(new TimerTask() {
                        @Override
                        public void run() {
                            abrir = inicial;

                        }
                    }, 2000);
                } else {
                    abrir = erro;
                    request.setAttribute("msg", "Ops!!! Erro ao tentar atualizar aluno!");
                }
            } catch (Exception e) {
                abrir = erro;
                request.setAttribute("msg", "Ops!!! Erro ao tentar atualizar aluno!");
                e.printStackTrace(); // Imprime a pilha de exceções para debug
            }
        }
        else if (acao.equals("atualizarAdm")) {
            Clientes cliente = new Clientes();
            cliente.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
            cliente.setNome(request.getParameter("txtNome"));
            cliente.setUsuario(request.getParameter("txtUsuario"));
            cliente.setEmail(request.getParameter("txtEmail"));
            cliente.setTelefone(request.getParameter("txtTel"));
            cliente.setSenha(request.getParameter("txtSenha"));
            try {
                if (dao.update(cliente)) {
                    abrir = sucesso;
                    request.setAttribute("msg", "Eba!!! Aluno atualizado com sucesso!");
                    request.setAttribute("target", listar);

                    // Obtém as informações atualizadas do cliente
                    Timer timer = new Timer();
                    timer.schedule(new TimerTask() {
                        @Override
                        public void run() {
                            abrir = inicial;

                        }
                    }, 2000);
                } else {
                    abrir = erro;
                    request.setAttribute("msg", "Ops!!! Erro ao tentar atualizar aluno!");
                }
            } catch (Exception e) {
                abrir = erro;
                request.setAttribute("msg", "Ops!!! Erro ao tentar atualizar aluno!");
                e.printStackTrace(); // Imprime a pilha de exceções para debug
            }
        }

        RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
        visualizar.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
