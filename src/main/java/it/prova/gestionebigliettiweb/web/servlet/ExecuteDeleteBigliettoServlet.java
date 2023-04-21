package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;


import it.prova.gestionebigliettiweb.service.BigliettoService;
import it.prova.gestionebigliettiweb.service.MyServiceFactory;


@WebServlet("/ExecuteDeleteBigliettoServlet")
public class ExecuteDeleteBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//iniziamo il binding
		
				String parametroIdDaEliminare = request.getParameter("idDaRimuovere");
				Long idArticoloDaRimuovere = Long.parseLong(parametroIdDaEliminare);
				
				
				
				//validazione
						if (!NumberUtils.isCreatable(parametroIdDaEliminare)) {
							// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
							request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
							request.getRequestDispatcher("/index.jsp").forward(request, response);
							return;
						
			            }
						
						
			  //business
						
					try {
						BigliettoService bigliettoServiceInstance = MyServiceFactory.getBigliettoServiceInstance();
						bigliettoServiceInstance.rimuovi(idArticoloDaRimuovere);
						request.setAttribute("listaBigliettiAttribute", bigliettoServiceInstance.listAll());
					} catch (Exception e) {
						e.printStackTrace();
						request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
						request.getRequestDispatcher("/index.jsp").forward(request, response);
						return;
						
					}
					
					
			//forward
					
					request.getRequestDispatcher("/biglietto/results.jsp").forward(request, response);

	}

}
