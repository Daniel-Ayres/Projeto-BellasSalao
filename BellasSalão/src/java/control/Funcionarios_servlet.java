package control;

import dao.FuncionariosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Funcionarios;

public class Funcionarios_servlet extends HttpServlet {

    Funcionarios funcionario = new Funcionarios();
    FuncionariosDAO dao = new FuncionariosDAO();
    Funcionarios_ctrl ctrl = new Funcionarios_ctrl();

    String sucesso = "sucesso.jsp";
    String erro = "erro.jsp";
    String listar = "DadosFunci.jsp";
    String inicial = "index.jsp";
    String editar = "EditarFunci.jsp";
    String login = "loginTest.jsp";
    String abrir = "";
    String cadastro = "CadFunci.jsp";
    String adm = "PainelAdm.jsp";

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
        if (acao != null) {
            if (acao.equals("listar_funcionarios")) {
                abrir = listar;
                request.setAttribute("funcionarios", dao.read());
        } else if (acao.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            abrir = editar;
            request.setAttribute("funcionario", dao.listar_funcionario(id));
        } else if (acao.equals("excluir")) {
            int id = Integer.parseInt(request.getParameter("id"));
            if (dao.delete(id)) {
                abrir = sucesso;
                request.setAttribute("msg", "Funcionario excluído com sucesso!!");
                request.setAttribute("target", editar);
            } else {
                abrir = erro;
                request.setAttribute("msg", "Erro ao excluir o funcionário.");
                request.setAttribute("target", editar);
            }
        }

        RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
        visualizar.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String acao = request.getParameter("acao");
        if (acao.equals("cad_funcionarios")) {
            Funcionarios funcionario = new Funcionarios();
            funcionario.setNome(request.getParameter("txtNome"));
            funcionario.setUsuario(request.getParameter("txtUsuario"));
            funcionario.setCargo(request.getParameter("txtCargo"));
            funcionario.setTelefone(request.getParameter("txtTel"));
            funcionario.setSenha(request.getParameter("txtSenha"));

            // Verificar se os dados do funcionário são válidos
            if (ctrl.validarDados(funcionario)) {

                if (dao.create(funcionario)) {
                    abrir = sucesso;
                    request.setAttribute("msg", "Cadastro feito com sucesso!");
                    request.setAttribute("target", cadastro);
                } else {
                    abrir = erro;
                    request.setAttribute("msg", "Erro ao tentar cadastrar!");
                    request.setAttribute("target", cadastro);

                }
            } else {
                abrir = erro;
                request.setAttribute("msg", "Dados inválidos!");
                request.setAttribute("target", cadastro);

            }
        }

        HttpSession session = request.getSession();

        if (acao.equals("logar")) {
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            funcionario.setUsuario(usuario);
            funcionario.setSenha(senha);

            funcionario = dao.logar(funcionario);
            if (funcionario.getNome() != null) {
                abrir = adm;

                session.setAttribute("usario", usuario);
                request.setAttribute("usuario", usuario);
            } else {
                abrir = erro;
                session.removeAttribute("nome");
                request.setAttribute("msg", "Erro ao fazer login do funcionario");
                request.setAttribute("target", login);

            }
        } else if (acao.equals("atualizar")) {
            Funcionarios funcionario = new Funcionarios();
            funcionario.setId(Integer.parseInt(request.getParameter("idFunc")));
            funcionario.setNome(request.getParameter("txtNome"));
            funcionario.setUsuario(request.getParameter("txtUsuario"));
            funcionario.setCargo(request.getParameter("txtCargo"));
            funcionario.setTelefone(request.getParameter("txtTel"));
            funcionario.setSenha(request.getParameter("txtSenha"));
            if (dao.update(funcionario)) {
                abrir = sucesso;
                request.setAttribute("msg", "Eba!!! Funcionario atualizado com sucesso!");
                request.setAttribute("target", editar);

            } else {
                abrir = erro;
                request.setAttribute("msg", "Ops!!! Erro ao tentar atualizar aluno!");
                request.setAttribute("target", editar);

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
