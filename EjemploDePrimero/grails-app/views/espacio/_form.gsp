<%@ page import="ejemplodeprimero.Espacio" %>



<div class="fieldcontain ${hasErrors(bean: espacioInstance, field: 'modulo', 'error')} required">
	<label for="modulo">
		<g:message code="espacio.modulo.label" default="Modulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modulo" pattern="${espacioInstance.constraints.modulo.matches}" required="" value="${espacioInstance?.modulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: espacioInstance, field: 'planta', 'error')} required">
	<label for="planta">
		<g:message code="espacio.planta.label" default="Planta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="planta" from="${0..4}" class="range" required="" value="${fieldValue(bean: espacioInstance, field: 'planta')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: espacioInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="espacio.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacidad" type="number" value="${espacioInstance.capacidad}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: espacioInstance, field: 'centro', 'error')} required">
	<label for="centro">
		<g:message code="espacio.centro.label" default="Centro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="centro" name="centro.id" from="${ejemplodeprimero.Centro.list()}" optionKey="id" required="" value="${espacioInstance?.centro?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: espacioInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="espacio.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${espacioInstance.numero}" required=""/>

</div>

