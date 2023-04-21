<%@page import="it.prova.gestionebigliettiweb.model.Biglietto"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<jsp:include page="../header.jsp" />
<title>Update</title>
</head>
 <body class="d-flex flex-column h-100">
   
    <!-- Fixed navbar -->
    <jsp:include page="../navbar.jsp"></jsp:include>
    
<!-- Begin page content -->
<main class="flex-shrink-0">
  <div class="container">
 
  <div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }" role="alert">
  ${errorMessage}
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
</div>
<div class="alert alert-danger alert-dismissible fade show d-none" role="alert">
  Esempio di operazione fallita!
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
</div>
<div class="alert alert-info alert-dismissible fade show d-none" role="alert">
  Aggiungere d-none nelle class per non far apparire
   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
</div>
 
  <div class='card'>
    <div class='card-header'>
        <h5>Modifica l'elemento selezionato</h5> 
    </div>
    <div class='card-body'>
<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
<form method="post" action="ExecuteUpdateBigliettoServlet" class="row g-3" novalidate="novalidate">
<% Biglietto bigliettoInPagina = (Biglietto)request.getAttribute("bigliettoDaAggiungere"); %>
<div class="col-md-6">
<label for="provenienza" class="form-label">Provenienza <span class="text-danger">*</span></label>
<input type="text" name="provenienza" id="provenienza" class="form-control"
value="<%=bigliettoInPagina.getProvenienza()!=null?bigliettoInPagina.getProvenienza():"" %>" required>
</div>
<div class="col-md-6">
<label for="destinazione" class="form-label">Destinazione <span class="text-danger">*</span></label>
<input type="text" name="destinazione" id="destinazione" class="form-control"   
value="<%=bigliettoInPagina.getDestinazione()!=null?bigliettoInPagina.getDestinazione():"" %>" required>
</div>
<div class="col-md-3">
<label for="data" class="form-label">Data <span class="text-danger">*</span></label>
<input class="form-control"  name="data" id="data" type="date"  title="formato : gg/mm/aaaa" 
value="<%=bigliettoInPagina.getData()!=null? bigliettoInPagina.getData().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")):""  %>" required/>
</div>
<div class="col-md-6">
<label for="prezzo" class="form-label">Prezzo <span class="text-danger">*</span></label>
<input type="number" class="form-control" name="prezzo" id="prezzo"  
value="<%=bigliettoInPagina.getPrezzo()!=null?bigliettoInPagina.getPrezzo():"" %>" required>
</div>

<div class="col-12">
<input type="hidden" name="id" value="<%=bigliettoInPagina.getId()%>">
<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Modifica</button>
</div>
</form>
  
    
    
<!-- end card-body -->    
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