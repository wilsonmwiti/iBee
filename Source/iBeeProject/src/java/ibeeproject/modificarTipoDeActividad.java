/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ibeeproject;

import com.sun.rave.web.ui.appbase.AbstractFragmentBean;
import ibeeproject.model.actividad.TipoActividad;
import ibeeproject.model.actividad.TipoTarea;
import ibeeproject.persistencia.GestorTipoActividad;
import javax.faces.FacesException;
import javax.faces.component.UIParameter;

/**
 * <p>Fragment bean that corresponds to a similarly named JSP page
 * fragment.  This class contains component definitions (and initialization
 * code) for all components that you have defined on this fragment, as well as
 * lifecycle methods and event handlers where you may add behavior
 * to respond to incoming events.</p>
 *
 * @version modificarTipoDeActividad.java
 * @version Created on 21-sep-2009, 19:57:45
 * @author farias.facundo
 */
public class modificarTipoDeActividad extends AbstractFragmentBean {
    // <editor-fold defaultstate="collapsed" desc="Managed Component Definition">

    private TipoActividad tipoActividad;
    private UIParameter parametro;

    /**
     * <p>Automatically managed component initialization. <strong>WARNING:</strong>
     * This method is automatically generated, so any user-specified code inserted
     * here is subject to being replaced.</p>
     */
    private void _init() throws Exception {
    }
    // </editor-fold>

    public modificarTipoDeActividad() {
    }

    /**
     * <p>Callback method that is called whenever a page containing
     * this page fragment is navigated to, either directly via a URL,
     * or indirectly via page navigation.  Override this method to acquire
     * resources that will be needed for event handlers and lifecycle methods.</p>
     * 
     * <p>The default implementation does nothing.</p>
     */
    @Override
    public void init() {
        // Perform initializations inherited from our superclass
        super.init();
        // Perform application initialization that must complete
        // *before* managed components are initialized
        // TODO - add your own initialiation code here


        // <editor-fold defaultstate="collapsed" desc="Visual-Web-managed Component Initialization">
        // Initialize automatically managed components
        // *Note* - this logic should NOT be modified
        try {
            _init();
        } catch (Exception e) {
            log("Page1 Initialization Failure", e);
            throw e instanceof FacesException ? (FacesException) e : new FacesException(e);
        }

    // </editor-fold>
    // Perform application initialization that must complete
    // *after* managed components are initialized
    // TODO - add your own initialization code here
    }

    /**
     * <p>Callback method that is called after rendering is completed for
     * this request, if <code>init()</code> was called.  Override this
     * method to release resources acquired in the <code>init()</code>
     * resources that will be needed for event handlers and lifecycle methods.</p>
     * 
     * <p>The default implementation does nothing.</p>
     */
    @Override
    public void destroy() {
    }

    /**
     * @return the tipoActividad
     */
    public TipoActividad getTipoActividad() {
        return tipoActividad;
    }

    /**
     * @param tipoActividad the tipoActividad to set
     */
    public void setTipoActividad(TipoActividad tipoActividad) {
        this.tipoActividad = tipoActividad;
    }

    /**
     * @return the parametro
     */
    public UIParameter getParametro() {
        return parametro;
    }

    /**
     * @param parametro the parametro to set
     */
    public void setParametro(UIParameter parametro) {
        this.parametro = parametro;
    }

    public String agregarTipoTarea() {
        this.getTipoActividad().getTipoTareas().add(new TipoTarea());
        return null;
    }

    public String agregarDatoRecoleccion() {
        // Hago visible la ventana
        ModalPopupDatoRecoleccion pop = (ModalPopupDatoRecoleccion) getBean("ModalPopupDatoRecoleccion");
        pop.getPanelPopup1Bean().setShowModalPanel(true);
        pop.getPanelPopup1().setVisible(true);
        pop.getPanelPopup1().setRendered(true);

        // Configuro el Popup
        pop.setTitle("Configure los datos que desea recolectar");
        pop.setearTamaño(575, 275);
        pop.setCodigoTipoActividad(this.getTipoActividad().getCodigo());
        TipoTarea tipoTarea = (TipoTarea) this.getParametro().getValue();
        pop.setCodigoTipoTarea(tipoTarea.getCodigo());
        pop.setDatoRecoleccion(tipoTarea.getDetalleTipoTarea());
        pop.setReadOnly(true);
        return null;
    }

    public String eliminarTipoTarea() {
        this.getTipoActividad().getTipoTareas().remove(this.getParametro().getValue());
        return null;
    }

    public String actionAceptar() {
        // Acepta

        try {
            // inserto el tipo de actividad
            GestorTipoActividad gestorTpoAct = new GestorTipoActividad();
            gestorTpoAct.updateUno(tipoActividad);
        } catch (Exception ex) {
            // TODO
            ex.printStackTrace();
            System.out.print("Error en la inserción BD: ManagedBean modificarTipoDeActividad");
        }
        consultarTiposDeActividad consultar = (consultarTiposDeActividad) getBean("consultarTiposDeActividad");
        consultar.updateTable();
        consultar.queryAll_action();
        return "tipoDeActividad";
    }

    public String actionCancelar() {
        // Cancela
        consultarTiposDeActividad consultar = (consultarTiposDeActividad) getBean("consultarTiposDeActividad");
        consultar.updateTable();
        consultar.queryAll_action();
        return "tipoDeActividad";
    }
}
