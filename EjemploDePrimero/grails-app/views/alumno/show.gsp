
<%@ page import="ejemplodeprimero.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-alumno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-alumno" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list alumno">
			
				<g:if test="${alumnoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="alumno.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${alumnoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.primerApellido}">
				<li class="fieldcontain">
					<span id="primerApellido-label" class="property-label"><g:message code="alumno.primerApellido.label" default="Primer Apellido" /></span>
					
						<span class="property-value" aria-labelledby="primerApellido-label"><g:fieldValue bean="${alumnoInstance}" field="primerApellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.segundoApellido}">
				<li class="fieldcontain">
					<span id="segundoApellido-label" class="property-label"><g:message code="alumno.segundoApellido.label" default="Segundo Apellido" /></span>
					
						<span class="property-value" aria-labelledby="segundoApellido-label"><g:fieldValue bean="${alumnoInstance}" field="segundoApellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.dni}">
				<li class="fieldcontain">
					<span id="dni-label" class="property-label"><g:message code="alumno.dni.label" default="Dni" /></span>
					
						<span class="property-value" aria-labelledby="dni-label"><g:fieldValue bean="${alumnoInstance}" field="dni"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="alumno.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${alumnoInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.expediente}">
				<li class="fieldcontain">
					<span id="expediente-label" class="property-label"><g:message code="alumno.expediente.label" default="Expediente" /></span>
					
						<span class="property-value" aria-labelledby="expediente-label"><g:link controller="expediente" action="show" id="${alumnoInstance?.expediente?.id}">${alumnoInstance?.expediente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.asignaturas}">
				<li class="fieldcontain">
					<span id="asignaturas-label" class="property-label"><g:message code="alumno.asignaturas.label" default="Asignaturas" /></span>
					
						<g:each in="${alumnoInstance.asignaturas}" var="a">
						<span class="property-value" aria-labelledby="asignaturas-label"><g:link controller="asignatura" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.fechaDeNacimiento}">
				<li class="fieldcontain">
					<span id="fechaDeNacimiento-label" class="property-label"><g:message code="alumno.fechaDeNacimiento.label" default="Fecha De Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeNacimiento-label"><g:formatDate date="${alumnoInstance?.fechaDeNacimiento}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:alumnoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${alumnoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
