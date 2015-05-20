<%@ page import="ejemplodeprimero.Becario" %>



<div class="fieldcontain ${hasErrors(bean: becarioInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="becario.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${becarioInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: becarioInstance, field: 'expediente', 'error')} required">
	<label for="expediente">
		<g:message code="becario.expediente.label" default="Expediente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="expediente" name="expediente.id" from="${ejemplodeprimero.Expediente.list()}" optionKey="id" required="" value="${becarioInstance?.expediente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: becarioInstance, field: 'asignaturas', 'error')} ">
	<label for="asignaturas">
		<g:message code="becario.asignaturas.label" default="Asignaturas" />
		
	</label>
	<g:select name="asignaturas" from="${ejemplodeprimero.Asignatura.list()}" multiple="multiple" optionKey="id" size="5" value="${becarioInstance?.asignaturas*.id}" class="many-to-many"/>

</div>

