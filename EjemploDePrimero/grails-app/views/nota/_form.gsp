<%@ page import="ejemplodeprimero.Nota" %>



<div class="fieldcontain ${hasErrors(bean: notaInstance, field: 'asignatura', 'error')} required">
	<label for="asignatura">
		<g:message code="nota.asignatura.label" default="Asignatura" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="asignatura" name="asignatura.id" from="${ejemplodeprimero.Asignatura.list()}" optionKey="id" required="" value="${notaInstance?.asignatura?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: notaInstance, field: 'expediente', 'error')} required">
	<label for="expediente">
		<g:message code="nota.expediente.label" default="Expediente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="expediente" name="expediente.id" from="${ejemplodeprimero.Expediente.list()}" optionKey="id" required="" value="${notaInstance?.expediente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: notaInstance, field: 'valor', 'error')} required">
	<label for="valor">
		<g:message code="nota.valor.label" default="Valor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="valor" from="${0..10}" class="range" required="" value="${fieldValue(bean: notaInstance, field: 'valor')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: notaInstance, field: 'mencionDeHonor', 'error')} ">
	<label for="mencionDeHonor">
		<g:message code="nota.mencionDeHonor.label" default="Mencion De Honor" />
		
	</label>
	<g:checkBox name="mencionDeHonor" value="${notaInstance?.mencionDeHonor}" />

</div>

