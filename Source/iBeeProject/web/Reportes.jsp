<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : reporteEstadoSanitario
    Created on : 07-mar-2010, 14:32:32
    Author     : farias.facundo
-->

<jsp:root version="2.1" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:ice="http://www.icesoft.com/icefaces/component"
          xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:jr="http://jasperreportjsf.sf.net/tld/jasperreports-jsf-1_0.tld">
    <jsp:directive.page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"/>
    <f:view>
        <html id="outputHtml1">

            <!-- Encabezado -->

            <head id="outputHead1">
                <jsp:directive.include file="styles.jspf"/>

                <title>iBee Project</title>

                <f:verbatim>
                    <![CDATA[
                    <script type="text/javascript" src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAbSzQ9VpZQwenDnv2GOzjYBS0mfbAkUOhKCwVmgIpLk6yLG9CCBReWtkTVanbYdV5orUhEeUGOvaLsA">
                    </script>
                    ]]>
                </f:verbatim>

            </head>

            <!-- Cuerpo -->

            <body id="outputBody1" style="-rave-layout: grid">
                <!-- Menu + Cabecera -->
                <ice:form id="body">
                    <ice:panelCollapsible expanded="true" id="formBackupDB"
                                          style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%;width:98%"
                                          >
                        <f:facet name="header">
                            <ice:panelGroup>
                                <ice:outputText id="formHeaderReport" value="Reportes"/>
                            </ice:panelGroup>
                        </f:facet>
                        <ice:panelGroup >
                            <table class="abm" width="100%">
                                <tr>
                                    <td class="title">
                                        <ice:outputText value="Seleccione el formato de Salida: "/>
                                    </td>
                                    <td class="title">
                                        <ice:selectOneMenu value="#{Reportes.selection}" partialSubmit="true">
                                            <f:selectItem itemValue="application/pdf" itemLabel="ReportViewer"/>
                                            <f:selectItem itemValue="text/html" itemLabel="HTML"/>
                                        </ice:selectOneMenu>
                                    </td>
                                    <td class="extension"></td>
                                </tr><tr>
                                    <td class="title">
                                        <ice:outputText value="Seleccione el Reporte que desea ejecutar: "/>
                                    </td>
                                    <td>
                                        <ice:selectOneRadio value="#{Reportes.reporte}" partialSubmit="true">
                                                <f:selectItem itemValue="reporteClimaPorApiar.jasper" itemLabel="Reporte de Clima Por Apiar"/>
                                                <f:selectItem itemValue="reporteEstadoSanitario.jasper" itemLabel="Reporte de Estado Sanitario"/>
                                                <f:selectItem itemValue="reporteActividades.jasper" itemLabel="Reporte de Actividades"/>
                                                <f:selectItem itemValue="reporteTareas.jasper" itemLabel="Reporte de Tareas"/>
                                                <f:selectItem itemValue="reporteAlarmas.jasper" itemLabel="Reporte de Alarmas"/>
                                                <f:selectItem itemValue="reporteProduccionPorClima.jasper" itemLabel="Reporte de Producción por Clima"/>
                                                <f:selectItem itemValue="reporteProduccionPorEnfermedad.jasper" itemLabel="Reporte de Producción por Enfermedad"/>
                                        </ice:selectOneRadio>
                                    </td>
                                    <td class="extension"></td>
                                </tr><tr>
                                    <td class="title"></td>
                                    <td></td>
                                    <td class="extension">
                                        <ice:commandButton value="Ver Reporte" action="#{Reportes.buscarReporte}" />
                                    </td>
                                </tr>
                            </table>
                        </ice:panelGroup>
                    </ice:panelCollapsible>
                </ice:form>

                <!-- Pie de Pagina -->
                <div>
                    <ice:panelGrid id="bottom" style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%" width="98%;">
                        <jsp:directive.include file="pieDePagina.jspf"/>
                    </ice:panelGrid>
                </div>

                <!-- Ventana Popup (Reutilizable) -->

            </body>
        </html>
    </f:view>
</jsp:root>
