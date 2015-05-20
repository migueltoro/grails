
<%@ page import="ejemplodeprimero.Profesor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'profesor.label', default: 'Profesor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-profesor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-profesor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list profesor">
			
				<g:if test="${profesorInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="profesor.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${profesorInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.primerApellido}">
				<li class="fieldcontain">
					<span id="primerApellido-label" class="property-label"><g:message code="profesor.primerApellido.label" default="Primer Apellido" /></span>
					
						<span class="property-value" aria-labelledby="primerApellido-label"><g:fieldValue bean="${profesorInstance}" field="primerApellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.segundoApellido}">
				<li class="fieldcontain">
					<span id="segundoApellido-label" class="property-label"><g:message code="profesor.segundoApellido.label" default="Segundo Apellido" /></span>
					
						<span class="property-value" aria-labelledby="segundoApellido-label"><g:fieldValue bean="${profesorInstance}" field="segundoApellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.dni}">
				<li class="fieldcontain">
					<span id="dni-label" class="property-label"><g:message code="profesor.dni.label" default="Dni" /></span>
					
						<span class="property-value" aria-labelledby="dni-label"><g:fieldValue bean="${profesorInstance}" field="dni"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="profesor.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${profesorInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.asignaturas}">
				<li class="fieldcontain">
					<span id="asignaturas-label" class="property-label"><g:message code="profesor.asignaturas.label" default="Asignaturas" /></span>
					
						<g:each in="${profesorInstance.asignaturas}" var="a">
						<span class="property-value" aria-labelledby="asignaturas-label"><g:link controller="asignatura" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.despacho}">
				<li class="fieldcontain">
					<span id="despacho-label" class="property-label"><g:message code="profesor.despacho.label" default="Despacho" /></span>
					
						<span class="property-value" aria-labelledby="despacho-label"><g:link controller="despacho" action="show" id="${profesorInstance?.despacho?.id}">${profesorInstance?.despacho?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.fechaDeNacimiento}">
				<li class="fieldcontain">
					<span id="fechaDeNacimiento-label" class="property-label"><g:message code="profesor.fechaDeNacimiento.label" default="Fecha De Nacimiento" /></span>
					
						<span class="property-value" aria-labelledby="fechaDeNacimiento-label"><g:formatDate date="${profesorInstance?.fechaDeNacimiento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.horarioDeTutorias}">
				<li class="fieldcontain">
					<span id="horarioDeTutorias-label" class="property-label"><g:message code="profesor.horarioDeTutorias.label" default="Horario De Tutorias" /></span>
					
						<g:each in="${profesorInstance.horarioDeTutorias}" var="h">
						<span class="property-value" aria-labelledby="horarioDeTutorias-label"><g:link controller="bloqueDeTutorias" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${profesorInstance?.tutorias}">
				<li class="fieldcontain">
					<span id="tutorias-label" class="property-label"><g:message code="profesor.tutorias.label" default="Tutorias" /></span>
					
						<g:each in="${profesorInstance.tutorias}" var="t">
						<span class="property-value" aria-labelledby="tutorias-label"><g:link controller="tutoria" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:profesorInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${profesorInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
