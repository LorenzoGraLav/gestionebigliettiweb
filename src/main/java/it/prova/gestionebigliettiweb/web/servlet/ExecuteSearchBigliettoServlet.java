package it.prova.gestionebigliettiweb.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.prova.gestionebigliettiweb.model.Biglietto;
import it.prova.gestionebigliettiweb.service.MyServiceFactory;
import it.prova.gestionebigliettiweb.utility.UtilityBigliettoForm;


@WebServlet("/ExecuteSearchBigliettoServlet")
public class ExecuteSearchBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// binding

				String provenienzaInputParam = request.getParameter("provenienza");
				String destinazioneInputParam = request.getParameter("destinazione");
				String dataInputParam = request.getParameter("data");
				String prezzoInputParam = request.getParameter("prezzo");
				
				

				Biglietto bigliettoInstance = UtilityBigliettoForm.createBigliettoFromParams(provenienzaInputParam,
						destinazioneInputParam, dataInputParam, prezzoInputParam);

				// validazione vuota

				// business

				try {
					request.setAttribute("listaBigliettiAttribute",
							MyServiceFactory.getBigliettoServiceInstance().findByExample(bigliettoInstance));
				} catch (Exception e) {
					request.setAttribute("errorMessage", "Attenzione si è verificato un errore");
					request.getRequestDispatcher("/biglietto/search.jsp").forward(request, response);
					return;
				}

				request.getRequestDispatcher("/biglietto/results.jsp").forward(request, response);
		
		
		
	}

}
