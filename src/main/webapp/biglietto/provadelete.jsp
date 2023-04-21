<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
	 	<!-- Common imports in pages -->
	 	<jsp:include page="../header.jsp" />
		<title>Insert title here</title>
	</head>
		<body class="d-flex flex-column h-100">
   
    <!-- Fixed navbar -->
    <jsp:include page="../navbar.jsp"></jsp:include>
    
<!-- Begin page content -->
<main class="flex-shrink-0">
  <div class="container">
 
  <div class='card'>
    <div class='card-header'>
        <h5>Visualizza dettaglio</h5>
    </div>
     <c:set var="bigliettoInPagina" value="${requestScope.bigliettoDaRimuovere}" />
    
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
        <a href="ListBigliettiServlet" class='btn btn-outline-secondary' style='width:80px'>
            <i class='fa fa-chevron-left'></i> Back
        </a>
         <form  action="ExecuteDeleteBigliettoServlet" method="post">
<input type="hidden" name="idDaRimuovere" value="<c:out value="${bigliettoInPagina.id}" />">
<input type="submit" value="Elimina">
     </form>
    </div>
<!-- end card -->
</div>
 
    
  <!-- end container -->  
  </div>
 
</main>
<!-- Footer -->
<jsp:include page="../footer.jsp" />
  </body>		
</html>