
<%@ page import="ejemplodeprimero.Tutoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tutoria.label', default: 'Tutoria')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tutoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tutoria" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tutoria">
			
				<g:if test="${tutoriaInstance?.profesor}">
				<li class="fieldcontain">
					<span id="profesor-label" class="property-label"><g:message code="tutoria.profesor.label" default="Profesor" /></span>
					
						<span class="property-value" aria-labelledby="profesor-label"><g:link controller="profesor" action="show" id="${tutoriaInstance?.profesor?.id}">${tutoriaInstance?.profesor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutoriaInstance?.alumno}">
				<li class="fieldcontain">
					<span id="alumno-label" class="property-label"><g:message code="tutoria.alumno.label" default="Alumno" /></span>
					
						<span class="property-value" aria-labelledby="alumno-label"><g:link controller="alumno" action="show" id="${tutoriaInstance?.alumno?.id}">${tutoriaInstance?.alumno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutoriaInstance?.fecha}">
				<li class="fieldcontain">
					<span id="fecha-label" class="property-label"><g:message code="tutoria.fecha.label" default="Fecha" /></span>
					
						<span class="property-value" aria-labelledby="fecha-label"><g:formatDate date="${tutoriaInstance?.fecha}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutoriaInstance?.horaDeComienzo}">
				<li class="fieldcontain">
					<span id="horaDeComienzo-label" class="property-label"><g:message code="tutoria.horaDeComienzo.label" default="Hora De Comienzo" /></span>
					
						<span class="property-value" aria-labelledby="horaDeComienzo-label"><g:fieldValue bean="${tutoriaInstance}" field="horaDeComienzo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutoriaInstance?.minutoDeComienzo}">
				<li class="fieldcontain">
					<span id="minutoDeComienzo-label" class="property-label"><g:message code="tutoria.minutoDeComienzo.label" default="Minuto De Comienzo" /></span>
					
						<span class="property-value" aria-labelledby="minutoDeComienzo-label"><g:fieldValue bean="${tutoriaInstance}" field="minutoDeComienzo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tutoriaInstance?.duracion}">
				<li class="fieldcontain">
					<span id="duracion-label" class="property-label"><g:message code="tutoria.duracion.label" default="Duracion" /></span>
					
						<span class="property-value" aria-labelledby="duracion-label"><g:fieldValue bean="${tutoriaInstance}" field="duracion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tutoriaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tutoriaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
