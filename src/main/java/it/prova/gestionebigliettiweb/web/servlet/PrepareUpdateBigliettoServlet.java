package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.prova.gestionebigliettiweb.service.MyServiceFactory;



@WebServlet("/PrepareUpdateBigliettoServlet")
public class PrepareUpdateBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// iniziamo il binding
				String parametroId = request.getParameter("idBiglietto");
				Long idDaAggiornare = Long.parseLong(parametroId);
				
		//validazione
				if (!NumberUtils.isCreatable(parametroId)) {
					// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
					request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
					return;
				
		        }
				
				
				//iniziamo il business!
				
				try {
					request.setAttribute("bigliettoDaAggiungere", MyServiceFactory.getBigliettoServiceInstance().caricaSingoloElemento(idDaAggiornare));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
					request.getRequestDispatcher("/index.jsp").forward(request, response);
					return;
				}
				
				
				//forward
				request.getRequestDispatcher("/biglietto/update.jsp").forward(request, response);
	}

	

}
