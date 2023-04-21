
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
<head>
	 
	 	<!-- Common imports in pages -->
	 	<jsp:include page="../header.jsp" />
	   
	   <title>Visualizza Elemento</title>
	 </head>
   <body class="d-flex flex-column h-100">
   
   		<!-- Navbar fissa -->
   		<jsp:include page="../navbar.jsp"></jsp:include>
    
		
		<!-- Contenuto principale della pagina -->
		<main class="flex-shrink-0">
		  <div class="container">
		  
		  		<div class='card'>
				    <div class='card-header'>
				        <h5>Visualizza dettaglio</h5>
				    </div>
				     <c:set var="bigliettoInPagina" value="${requestScope.visualizza_biglietto_attr}" />
				
				    <div class='card-body'>
				    	<dl class="row">
						  <dt class="col-sm-3 text-right">Provenienza</dt>
						  <dd class="col-sm-9"><c:out value="${bigliettoInPagina.provenienza}" /></dd>
				    	</dl>
				    	
				    	<dl class="row">
						  <dt class="col-sm-3 text-right">Destinazione:</dt>
						  <dd class="col-sm-9"><c:out value="${bigliettoInPagina.destinazione}" /></dd>
				    	</dl>
				    	
				    	<dl class="row">
						  <dt class="col-sm-3 text-right">Prezzo:</dt>
						  <dd class="col-sm-9"><c:out value="${bigliettoInPagina.prezzo}" /></dd>
				    	</dl>
				    	
				    	<dl class="row">
						  <dt class="col-sm-3 text-right">Data:</dt>
						  <dd class="col-sm-9"><c:out value="${bigliettoInPagina.data.format(DateTimeFormatter.ofPattern('dd/MM/yyyy'))}" /></dd>
				    	</dl>
				    	
				    </div>
				    
				    <div class='card-footer'>
				        <a href="ListBigliettiServlet" class='btn btn-outline-secondary' style='width:100px'>
				            <i class='fa fa-chevron-left'></i>Indietro
				        </a>
				    </div>
					<!-- fine card -->
				</div>	
		  
		    
		  <!-- fine container -->  
		  </div>
		  
		</main>
		
		<!-- Footer -->
		<jsp:include page="../footer.jsp" />
    </body>
  
  </html>