
<%@ page import="ejemplodeprimero.Departamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-departamento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-departamento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list departamento">
			
				<g:if test="${departamentoInstance?.asignaturas}">
				<li class="fieldcontain">
					<span id="asignaturas-label" class="property-label"><g:message code="departamento.asignaturas.label" default="Asignaturas" /></span>
					
						<g:each in="${departamentoInstance.asignaturas}" var="a">
						<span class="property-value" aria-labelledby="asignaturas-label"><g:link controller="asignatura" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${departamentoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="departamento.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${departamentoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${departamentoInstance?.profesores}">
				<li class="fieldcontain">
					<span id="profesores-label" class="property-label"><g:message code="departamento.profesores.label" default="Profesores" /></span>
					
						<g:each in="${departamentoInstance.profesores}" var="p">
						<span class="property-value" aria-labelledby="profesores-label"><g:link controller="profesor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${departamentoInstance?.seminarios}">
				<li class="fieldcontain">
					<span id="seminarios-label" class="property-label"><g:message code="departamento.seminarios.label" default="Seminarios" /></span>
					
						<g:each in="${departamentoInstance.seminarios}" var="s">
						<span class="property-value" aria-labelledby="seminarios-label"><g:link controller="seminario" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:departamentoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${departamentoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
