
<%@ page import="ejemplodeprimero.BloqueDeTutorias" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bloqueDeTutorias.label', default: 'BloqueDeTutorias')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bloqueDeTutorias" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-bloqueDeTutorias" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list bloqueDeTutorias">
			
				<g:if test="${bloqueDeTutoriasInstance?.profesor}">
				<li class="fieldcontain">
					<span id="profesor-label" class="property-label"><g:message code="bloqueDeTutorias.profesor.label" default="Profesor" /></span>
					
						<span class="property-value" aria-labelledby="profesor-label"><g:link controller="profesor" action="show" id="${bloqueDeTutoriasInstance?.profesor?.id}">${bloqueDeTutoriasInstance?.profesor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${bloqueDeTutoriasInstance?.diaDeSemana}">
				<li class="fieldcontain">
					<span id="diaDeSemana-label" class="property-label"><g:message code="bloqueDeTutorias.diaDeSemana.label" default="Dia De Semana" /></span>
					
						<span class="property-value" aria-labelledby="diaDeSemana-label"><g:fieldValue bean="${bloqueDeTutoriasInstance}" field="diaDeSemana"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bloqueDeTutoriasInstance?.horaDeComienzo}">
				<li class="fieldcontain">
					<span id="horaDeComienzo-label" class="property-label"><g:message code="bloqueDeTutorias.horaDeComienzo.label" default="Hora De Comienzo" /></span>
					
						<span class="property-value" aria-labelledby="horaDeComienzo-label"><g:fieldValue bean="${bloqueDeTutoriasInstance}" field="horaDeComienzo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${bloqueDeTutoriasInstance?.horaDeFinalizacion}">
				<li class="fieldcontain">
					<span id="horaDeFinalizacion-label" class="property-label"><g:message code="bloqueDeTutorias.horaDeFinalizacion.label" default="Hora De Finalizacion" /></span>
					
						<span class="property-value" aria-labelledby="horaDeFinalizacion-label"><g:fieldValue bean="${bloqueDeTutoriasInstance}" field="horaDeFinalizacion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:bloqueDeTutoriasInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${bloqueDeTutoriasInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
