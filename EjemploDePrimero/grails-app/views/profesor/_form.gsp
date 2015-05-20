<%@ page import="ejemplodeprimero.Profesor" %>



<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="profesor.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${profesorInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'primerApellido', 'error')} required">
	<label for="primerApellido">
		<g:message code="profesor.primerApellido.label" default="Primer Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="primerApellido" required="" value="${profesorInstance?.primerApellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'segundoApellido', 'error')} required">
	<label for="segundoApellido">
		<g:message code="profesor.segundoApellido.label" default="Segundo Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="segundoApellido" required="" value="${profesorInstance?.segundoApellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'dni', 'error')} required">
	<label for="dni">
		<g:message code="profesor.dni.label" default="Dni" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dni" pattern="${profesorInstance.constraints.dni.matches}" required="" value="${profesorInstance?.dni}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="profesor.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${profesorInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'asignaturas', 'error')} ">
	<label for="asignaturas">
		<g:message code="profesor.asignaturas.label" default="Asignaturas" />
		
	</label>
	<g:select name="asignaturas" from="${ejemplodeprimero.Asignatura.list()}" multiple="multiple" optionKey="id" size="5" value="${profesorInstance?.asignaturas*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'despacho', 'error')} required">
	<label for="despacho">
		<g:message code="profesor.despacho.label" default="Despacho" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="despacho" name="despacho.id" from="${ejemplodeprimero.Despacho.list()}" optionKey="id" required="" value="${profesorInstance?.despacho?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'fechaDeNacimiento', 'error')} required">
	<label for="fechaDeNacimiento">
		<g:message code="profesor.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeNacimiento" precision="day"  value="${profesorInstance?.fechaDeNacimiento}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'horarioDeTutorias', 'error')} ">
	<label for="horarioDeTutorias">
		<g:message code="profesor.horarioDeTutorias.label" default="Horario De Tutorias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profesorInstance?.horarioDeTutorias?}" var="h">
    <li><g:link controller="bloqueDeTutorias" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bloqueDeTutorias" action="create" params="['profesor.id': profesorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bloqueDeTutorias.label', default: 'BloqueDeTutorias')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: profesorInstance, field: 'tutorias', 'error')} ">
	<label for="tutorias">
		<g:message code="profesor.tutorias.label" default="Tutorias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${profesorInstance?.tutorias?}" var="t">
    <li><g:link controller="tutoria" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="tutoria" action="create" params="['profesor.id': profesorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'tutoria.label', default: 'Tutoria')])}</g:link>
</li>
</ul>


</div>

