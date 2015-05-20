
<%@ page import="ejemplodeprimero.Despacho" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'despacho.label', default: 'Despacho')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-despacho" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-despacho" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list despacho">
			
				<g:if test="${despachoInstance?.modulo}">
				<li class="fieldcontain">
					<span id="modulo-label" class="property-label"><g:message code="despacho.modulo.label" default="Modulo" /></span>
					
						<span class="property-value" aria-labelledby="modulo-label"><g:fieldValue bean="${despachoInstance}" field="modulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${despachoInstance?.planta}">
				<li class="fieldcontain">
					<span id="planta-label" class="property-label"><g:message code="despacho.planta.label" default="Planta" /></span>
					
						<span class="property-value" aria-labelledby="planta-label"><g:fieldValue bean="${despachoInstance}" field="planta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${despachoInstance?.capacidad}">
				<li class="fieldcontain">
					<span id="capacidad-label" class="property-label"><g:message code="despacho.capacidad.label" default="Capacidad" /></span>
					
						<span class="property-value" aria-labelledby="capacidad-label"><g:fieldValue bean="${despachoInstance}" field="capacidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${despachoInstance?.centro}">
				<li class="fieldcontain">
					<span id="centro-label" class="property-label"><g:message code="despacho.centro.label" default="Centro" /></span>
					
						<span class="property-value" aria-labelledby="centro-label"><g:link controller="centro" action="show" id="${despachoInstance?.centro?.id}">${despachoInstance?.centro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${despachoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="despacho.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${despachoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${despachoInstance?.profesores}">
				<li class="fieldcontain">
					<span id="profesores-label" class="property-label"><g:message code="despacho.profesores.label" default="Profesores" /></span>
					
						<g:each in="${despachoInstance.profesores}" var="p">
						<span class="property-value" aria-labelledby="profesores-label"><g:link controller="profesor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:despachoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${despachoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
