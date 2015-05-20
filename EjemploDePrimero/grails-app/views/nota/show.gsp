
<%@ page import="ejemplodeprimero.Nota" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'nota.label', default: 'Nota')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-nota" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-nota" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list nota">
			
				<g:if test="${notaInstance?.asignatura}">
				<li class="fieldcontain">
					<span id="asignatura-label" class="property-label"><g:message code="nota.asignatura.label" default="Asignatura" /></span>
					
						<span class="property-value" aria-labelledby="asignatura-label"><g:link controller="asignatura" action="show" id="${notaInstance?.asignatura?.id}">${notaInstance?.asignatura?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${notaInstance?.expediente}">
				<li class="fieldcontain">
					<span id="expediente-label" class="property-label"><g:message code="nota.expediente.label" default="Expediente" /></span>
					
						<span class="property-value" aria-labelledby="expediente-label"><g:link controller="expediente" action="show" id="${notaInstance?.expediente?.id}">${notaInstance?.expediente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${notaInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="nota.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${notaInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${notaInstance?.mencionDeHonor}">
				<li class="fieldcontain">
					<span id="mencionDeHonor-label" class="property-label"><g:message code="nota.mencionDeHonor.label" default="Mencion De Honor" /></span>
					
						<span class="property-value" aria-labelledby="mencionDeHonor-label"><g:formatBoolean boolean="${notaInstance?.mencionDeHonor}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:notaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${notaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
