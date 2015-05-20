<%@ page import="ejemplodeprimero.Seminario" %>



<div class="fieldcontain ${hasErrors(bean: seminarioInstance, field: 'modulo', 'error')} required">
	<label for="modulo">
		<g:message code="seminario.modulo.label" default="Modulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modulo" pattern="${seminarioInstance.constraints.modulo.matches}" required="" value="${seminarioInstance?.modulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarioInstance, field: 'planta', 'error')} required">
	<label for="planta">
		<g:message code="seminario.planta.label" default="Planta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="planta" from="${0..4}" class="range" required="" value="${fieldValue(bean: seminarioInstance, field: 'planta')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarioInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="seminario.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacidad" type="number" value="${seminarioInstance.capacidad}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarioInstance, field: 'centro', 'error')} required">
	<label for="centro">
		<g:message code="seminario.centro.label" default="Centro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="centro" name="centro.id" from="${ejemplodeprimero.Centro.list()}" optionKey="id" required="" value="${seminarioInstance?.centro?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarioInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="seminario.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${ejemplodeprimero.Departamento.list()}" optionKey="id" required="" value="${seminarioInstance?.departamento?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: seminarioInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="seminario.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${seminarioInstance.numero}" required=""/>

</div>

