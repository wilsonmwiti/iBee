<?xml version="1.0" encoding="UTF-8"?>
<!-- 
    Document   : Cargos
    Created on : 06/03/2010, 14:58:54
    Author     : burni.matias
-->

<jsp:root version="2.1" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" xmlns:ice="http://www.icesoft.com/icefaces/component" xmlns:jsp="http://java.sun.com/JSP/Page">
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
                <ice:form id="form1" style="top:6%; left:1%; right:1%; position:absolute">
                    <jsp:directive.include file="./Header.jspf"/>
                </ice:form>
                <jsp:directive.include file="cabecera.jspf"/>

                <!-- Mapa (Panel Izquierdo) -->
                <ice:panelGrid cellspacing="0px" columnClasses="columna1, columna2" columns="2" styleClass="tablaPrincipal">
                    <ice:column >
                        <ice:form>
                            <ice:panelGroup style="vertical-align: top;" >
                                <ice:panelCollapsible expanded="true" id="Mapa" toggleOnClick="false">
                                    <f:facet name="header">
                                        <ice:panelGroup>
                                            <ice:outputText id="formHeaderMap" value="Mapa"/>
                                        </ice:panelGroup>
                                    </f:facet>
                                    <jsp:directive.include file="googleMap.jspf"/>
                                </ice:panelCollapsible>
                            </ice:panelGroup>
                        </ice:form>
                    </ice:column>

                    <!-- Fragments correspondientes a las acciones de ABM -->
                    <ice:column >
                        <ice:form rendered="#{Cargos.consultar}">
                            <ice:panelCollapsible expanded="true" id="formConsultarPanelCargos">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderCargos" value="Cargos"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <ice:panelGroup style="vertical-align: top;">
                                    <jsp:directive.include file="consultarCargo.jspf"/>
                                </ice:panelGroup>
                            </ice:panelCollapsible>
                        </ice:form>
                        <ice:form id="agregar" rendered="#{Cargos.agregar}">
                            <ice:panelCollapsible expanded="true" id="formAgregarPanelCargos">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderCargos" value="Cargos"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <ice:panelGroup style="vertical-align: top;">
                                    <jsp:directive.include file="agregarCargo.jspf"/>
                                </ice:panelGroup>
                            </ice:panelCollapsible>
                        </ice:form>
                        <ice:form rendered="#{Cargos.modificar}">
                            <ice:panelCollapsible expanded="true" id="formModificarPanelCargos">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderCargos" value="Cargos"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <ice:panelGroup style="vertical-align: top;">
                                    <jsp:directive.include file="modificarCargo.jspf"/>
                                </ice:panelGroup>
                            </ice:panelCollapsible>
                        </ice:form>
                        <ice:form id="eliminar" rendered="#{Cargos.eliminar}">
                            <ice:panelCollapsible expanded="true" id="formEliminarPanelCargos">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderCargos" value="Cargos"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <ice:panelGroup style="vertical-align: top;">
                                    <jsp:directive.include file="eliminarCargo.jspf"/>
                                </ice:panelGroup>
                            </ice:panelCollapsible>
                        </ice:form>
                        <ice:form rendered="#{Cargos.consultarAll}">
                            <ice:panelCollapsible expanded="true" id="formConsultarAllPanelCargos">
                                <f:facet name="header">
                                    <ice:panelGroup>
                                        <ice:outputText id="formHeaderCargos" value="Cargos"/>
                                    </ice:panelGroup>
                                </f:facet>
                                <ice:panelGroup style="vertical-align: top;">
                                    <jsp:directive.include file="consultarCargos.jspf"/>
                                </ice:panelGroup>
                            </ice:panelCollapsible>
                        </ice:form>
                    </ice:column>
                </ice:panelGrid>

                <!-- Pie de Pagina -->
                <div>
                    <ice:panelGrid id="bottom" style="position:relative;border-style: solid;border-width: 1px; border-color: #EEEEEE; left:1%" width="98%;">
                        <jsp:directive.include file="pieDePagina.jspf"/>
                    </ice:panelGrid>
                </div>

                <!-- Ventana Popup (Reutilizable) -->
                <jsp:directive.include file="ModalPopup.jspf"/>

            </body>
        </html>
    </f:view>
</jsp:root>
