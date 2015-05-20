
<%@ page import="ejemplodeprimero.Espacio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'espacio.label', default: 'Espacio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-espacio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-espacio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list espacio">
			
				<g:if test="${espacioInstance?.modulo}">
				<li class="fieldcontain">
					<span id="modulo-label" class="property-label"><g:message code="espacio.modulo.label" default="Modulo" /></span>
					
						<span class="property-value" aria-labelledby="modulo-label"><g:fieldValue bean="${espacioInstance}" field="modulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${espacioInstance?.planta}">
				<li class="fieldcontain">
					<span id="planta-label" class="property-label"><g:message code="espacio.planta.label" default="Planta" /></span>
					
						<span class="property-value" aria-labelledby="planta-label"><g:fieldValue bean="${espacioInstance}" field="planta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${espacioInstance?.capacidad}">
				<li class="fieldcontain">
					<span id="capacidad-label" class="property-label"><g:message code="espacio.capacidad.label" default="Capacidad" /></span>
					
						<span class="property-value" aria-labelledby="capacidad-label"><g:fieldValue bean="${espacioInstance}" field="capacidad"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${espacioInstance?.centro}">
				<li class="fieldcontain">
					<span id="centro-label" class="property-label"><g:message code="espacio.centro.label" default="Centro" /></span>
					
						<span class="property-value" aria-labelledby="centro-label"><g:link controller="centro" action="show" id="${espacioInstance?.centro?.id}">${espacioInstance?.centro?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${espacioInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="espacio.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${espacioInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:espacioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${espacioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
