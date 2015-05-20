
<%@ page import="ejemplodeprimero.Becario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'becario.label', default: 'Becario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-becario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-becario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list becario">
			
				<g:if test="${becarioInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="becario.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${becarioInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${becarioInstance?.expediente}">
				<li class="fieldcontain">
					<span id="expediente-label" class="property-label"><g:message code="becario.expediente.label" default="Expediente" /></span>
					
						<span class="property-value" aria-labelledby="expediente-label"><g:link controller="expediente" action="show" id="${becarioInstance?.expediente?.id}">${becarioInstance?.expediente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${becarioInstance?.asignaturas}">
				<li class="fieldcontain">
					<span id="asignaturas-label" class="property-label"><g:message code="becario.asignaturas.label" default="Asignaturas" /></span>
					
						<g:each in="${becarioInstance.asignaturas}" var="a">
						<span class="property-value" aria-labelledby="asignaturas-label"><g:link controller="asignatura" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:becarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${becarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
