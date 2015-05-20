<%@ page import="ejemplodeprimero.Laboratorio" %>



<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'modulo', 'error')} required">
	<label for="modulo">
		<g:message code="laboratorio.modulo.label" default="Modulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modulo" pattern="${laboratorioInstance.constraints.modulo.matches}" required="" value="${laboratorioInstance?.modulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'planta', 'error')} required">
	<label for="planta">
		<g:message code="laboratorio.planta.label" default="Planta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="planta" from="${0..4}" class="range" required="" value="${fieldValue(bean: laboratorioInstance, field: 'planta')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="laboratorio.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacidad" type="number" value="${laboratorioInstance.capacidad}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'centro', 'error')} required">
	<label for="centro">
		<g:message code="laboratorio.centro.label" default="Centro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="centro" name="centro.id" from="${ejemplodeprimero.Centro.list()}" optionKey="id" required="" value="${laboratorioInstance?.centro?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: laboratorioInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="laboratorio.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${laboratorioInstance.numero}" required=""/>

</div>

