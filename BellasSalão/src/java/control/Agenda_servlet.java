/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AgendamentoDAO;
import dao.FuncionariosDAO;
import dao.ServicosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Agendamento;
import model.Agendamentos;
import model.Clientes;

/**
 *
 * author sala303b
 */
public class Agenda_servlet extends HttpServlet {

    FuncionariosDAO daoFunc = new FuncionariosDAO();
    ServicosDAO daoServ = new ServicosDAO();
    AgendamentoDAO dao = new AgendamentoDAO();
    Agenda_ctrl ctrl = new Agenda_ctrl();
    Agendamento agendamento = new Agendamento();

    String sucesso = "sucesso.jsp";
    String erro = "erro.jsp";
    String listar = "clienteAgendamentos.jsp";
    String listarEspera = "agendEspera.jsp";
    String listarCancel = "agendCancela.jsp";
    String listarT = "srvA?acao=clienteAgendamentos";
    String listarConfirm = "agendConfirma.jsp";
    String listarAgendas = "listAgendamentos.jsp";
    String cadastrar = "formularioAgendamento.jsp";
    String editar = "editar_matricula.jsp";
    String abrir = "";
    String exibirAgendamentos = "clienteAgendamentos.jsp";
    String inicial = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        HttpSession cliente = request.getSession();
        Clientes cli = new Clientes();
        cli = (Clientes) cliente.getAttribute("cliente");

        if (acao != null && acao.equals("clienteAgendamentos")) {
            abrir = listar;
            int idCliente = cli.getIdCliente();
            request.setAttribute("agendamentos", dao.getAgendamentosCliente(idCliente));
        }
        if (acao != null && acao.equals("agendCancela")) {
            abrir = listarCancel;
            int idCliente = cli.getIdCliente();
            System.out.println("ID CLIENTE " + idCliente);
            request.setAttribute("agendamentosCancel", dao.getAgendamentosCancelados(idCliente));
        }

        if (acao != null && acao.equals("agendEspera")) {
            abrir = listarEspera;
            request.setAttribute("agendamentosEspera", dao.read());
        }

        if (acao != null && acao.equals("agendConfirma")) {
            abrir = listarConfirm;
            request.setAttribute("agendamentoConfirmado", dao.getAgendamentosConfirmados());
        } 
        if (acao != null && acao.equals("listar_agendamentos")) {
            abrir = listarAgendas;
            request.setAttribute("listarAgendamentos", dao.listAgendamentos());
        } 
        
       

        RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
        visualizar.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if (acao != null && acao.equals("cancelarAgendamento")) {
            int idAgendamento = Integer.parseInt(request.getParameter("idAgendamento"));

            if (dao.cancelAgendamento(idAgendamento)) {
                abrir = sucesso;
                request.setAttribute("msg", "Agendamento cancelado com sucesso!");
                request.setAttribute("target", listarT);

                Timer timer = new Timer();
                timer.schedule(new TimerTask() {
                    @Override
                    public void run() {
                        abrir = inicial;
                        RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
                    }
                }, 2000); // 2000 milissegundos = 2 segundos
            } else {
                request.setAttribute("msg", "Erro ao cancelar o agendamento.");
                request.setAttribute("target", listar);
                RequestDispatcher visualizar = request.getRequestDispatcher(abrir);
                visualizar.forward(request, response);
            }

        } else if (acao != null && acao.equals("retomarAgendamento")) {
            int idAgendamento = Integer.parseInt(request.getParameter("idAgendamento"));

            if (dao.retomarAgendamento(idAgendamento)) {
                abrir = sucesso;
                request.setAttribute("msg", "Agendamento retomado com sucesso!");
                request.setAttribute("target", listarT);
            } else {
                abrir = erro;
                request.setAttribute("msg", "Erro ao retomar o agendamento.");
                request.setAttribute("target", listarT);
            }
        } else if (acao != null && acao.equals("confirmarAgendamento")) {
            int idAgendamento = Integer.parseInt(request.getParameter("idAgendamento"));

            if (dao.confirmarAgendamento(idAgendamento)) {
                abrir = sucesso;
                request.setAttribute("msg", "Agendamento confirmado com sucesso!");
                request.setAttribute("target", listarEspera);
            } else {
                abrir = erro;
                request.setAttribute("msg", "Erro ao confirmar o agendamento.");
                request.setAttribute("target", listarEspera);
            }
        } else if (acao != null && acao.equals("agendamentoRealizado")) {
            int idAgendamento = Integer.parseInt(request.getParameter("idAgendamento"));

            if (dao.agendRealizado(idAgendamento)) {
                abrir = sucesso;
                request.setAttribute("msg", "Agendamento marcado como realizado com sucesso!");
                request.setAttribute("target", listarConfirm);
            } else {
                abrir = erro;
                request.setAttribute("msg", "Erro ao marcar o agendamento como realizado.");
                request.setAttribute("target", listarConfirm);
            }
        

        } else if (acao != null && acao.equals("cad_agenda")) {
            AgendamentoDAO dao = new AgendamentoDAO();
            String nome_cliente = request.getParameter("txtNome");
            String email = request.getParameter("txtEmail");
            String funcionarioId = request.getParameter("cbFunc");
            String servicoId = request.getParameter("cbServ");
            String dataHoraStr = request.getParameter("txtDataHora");
            DateTimeFormatter formatterInput = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            LocalDateTime dataHora = LocalDateTime.parse(dataHoraStr, formatterInput);
            DateTimeFormatter formatterOutput = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            String dataHoraFormatada = dataHora.format(formatterOutput);

            String idCliente = request.getParameter("idCliente");

            agendamento.setNome_cliente(nome_cliente);
            agendamento.setEmail(email);
            agendamento.setFuncionario_Id(Integer.parseInt(funcionarioId));
            agendamento.setServico_Id(Integer.parseInt(servicoId));
            agendamento.setData_Agendamento(Timestamp.valueOf(dataHora));
            agendamento.setCliente_Id(Integer.parseInt(idCliente));

            if (ctrl.validarDados(agendamento)) {
                if (dao.create(agendamento)) {
                    abrir = sucesso;
                    request.setAttribute("msg", "Agendamento cadastrado com sucesso!");
                    request.setAttribute("target", cadastrar);
                } else {
                    abrir = erro;
                    request.setAttribute("msg", "Data e Hora inválidos!");
                    request.setAttribute("target", cadastrar);
                }
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
