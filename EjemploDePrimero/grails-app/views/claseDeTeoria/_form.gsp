<%@ page import="ejemplodeprimero.ClaseDeTeoria" %>



<div class="fieldcontain ${hasErrors(bean: claseDeTeoriaInstance, field: 'modulo', 'error')} required">
	<label for="modulo">
		<g:message code="claseDeTeoria.modulo.label" default="Modulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modulo" pattern="${claseDeTeoriaInstance.constraints.modulo.matches}" required="" value="${claseDeTeoriaInstance?.modulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseDeTeoriaInstance, field: 'planta', 'error')} required">
	<label for="planta">
		<g:message code="claseDeTeoria.planta.label" default="Planta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="planta" from="${0..4}" class="range" required="" value="${fieldValue(bean: claseDeTeoriaInstance, field: 'planta')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseDeTeoriaInstance, field: 'capacidad', 'error')} required">
	<label for="capacidad">
		<g:message code="claseDeTeoria.capacidad.label" default="Capacidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="capacidad" type="number" value="${claseDeTeoriaInstance.capacidad}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseDeTeoriaInstance, field: 'centro', 'error')} required">
	<label for="centro">
		<g:message code="claseDeTeoria.centro.label" default="Centro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="centro" name="centro.id" from="${ejemplodeprimero.Centro.list()}" optionKey="id" required="" value="${claseDeTeoriaInstance?.centro?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseDeTeoriaInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="claseDeTeoria.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${claseDeTeoriaInstance.numero}" required=""/>

</div>

