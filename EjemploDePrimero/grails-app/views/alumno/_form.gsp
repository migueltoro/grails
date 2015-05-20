<%@ page import="ejemplodeprimero.Alumno" %>



<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="alumno.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${alumnoInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'primerApellido', 'error')} required">
	<label for="primerApellido">
		<g:message code="alumno.primerApellido.label" default="Primer Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="primerApellido" required="" value="${alumnoInstance?.primerApellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'segundoApellido', 'error')} required">
	<label for="segundoApellido">
		<g:message code="alumno.segundoApellido.label" default="Segundo Apellido" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="segundoApellido" required="" value="${alumnoInstance?.segundoApellido}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'dni', 'error')} required">
	<label for="dni">
		<g:message code="alumno.dni.label" default="Dni" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="dni" pattern="${alumnoInstance.constraints.dni.matches}" required="" value="${alumnoInstance?.dni}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="alumno.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${alumnoInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'expediente', 'error')} ">
	<label for="expediente">
		<g:message code="alumno.expediente.label" default="Expediente" />
		
	</label>
	<g:select id="expediente" name="expediente.id" from="${ejemplodeprimero.Expediente.list()}" optionKey="id" value="${alumnoInstance?.expediente?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'asignaturas', 'error')} ">
	<label for="asignaturas">
		<g:message code="alumno.asignaturas.label" default="Asignaturas" />
		
	</label>
	<g:select name="asignaturas" from="${ejemplodeprimero.Asignatura.list()}" multiple="multiple" optionKey="id" size="5" value="${alumnoInstance?.asignaturas*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'fechaDeNacimiento', 'error')} required">
	<label for="fechaDeNacimiento">
		<g:message code="alumno.fechaDeNacimiento.label" default="Fecha De Nacimiento" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaDeNacimiento" precision="day"  value="${alumnoInstance?.fechaDeNacimiento}"  />

</div>

