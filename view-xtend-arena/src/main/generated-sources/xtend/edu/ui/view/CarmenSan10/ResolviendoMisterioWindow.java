package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.ResolverMisterioAppModel;
import edu.ui.view.CarmenSan10.OrdenArrestoWindow;
import edu.ui.view.CarmenSan10.ViajarWindow;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;

@SuppressWarnings("all")
public class ResolviendoMisterioWindow extends SimpleWindow<ResolverMisterioAppModel> {
  public ResolviendoMisterioWindow(final WindowOwner parent, final ResolverMisterioAppModel model) {
    super(parent, model);
  }
  
  public void createFormPanel(final Panel mainPanel) {
    throw new Error("Unresolved compilation problems:"
      + "\nType mismatch: cannot convert from void to String");
  }
  
  public void abrir3erLugarDeInteres() {
    throw new Error("Unresolved compilation problems:"
      + "\nType mismatch: cannot convert from LugarDeInteres to LugarInteresAppModel");
  }
  
  public void abrir2erLugarDeInteres() {
    throw new Error("Unresolved compilation problems:"
      + "\nType mismatch: cannot convert from LugarDeInteres to LugarInteresAppModel");
  }
  
  protected void abrir1erLugarDeInteres() {
    throw new Error("Unresolved compilation problems:"
      + "\nType mismatch: cannot convert from LugarDeInteres to LugarInteresAppModel");
  }
  
  public Object verExpedientes() {
    return null;
  }
  
  public void abrirViajarAPais() {
    ResolverMisterioAppModel _modelObject = this.getModelObject();
    new ViajarWindow(this, _modelObject).open();
  }
  
  public void abrirOrdenDeArresto() {
    ResolverMisterioAppModel _modelObject = this.getModelObject();
    new OrdenArrestoWindow(this, _modelObject).open();
  }
  
  public void destinosFallidos(final Panel panelPrincipal) {
    final Panel panelDestinosFallidos = new Panel(panelPrincipal);
    VerticalLayout _verticalLayout = new VerticalLayout();
    panelDestinosFallidos.setLayout(_verticalLayout);
    Label _label = new Label(panelDestinosFallidos);
    _label.setText("Destinos fallidos:");
    this.tablaDePaises(panelDestinosFallidos);
  }
  
  public Object tablaDePaises(final Panel panelPrincipal) {
    return null;
  }
  
  public Label recorridoCriminal(final Panel panelPrincipal) {
    Label _xblockexpression = null;
    {
      final Panel panelRecorrido = new Panel(panelPrincipal);
      VerticalLayout _verticalLayout = new VerticalLayout();
      panelRecorrido.setLayout(_verticalLayout);
      Label _label = new Label(panelRecorrido);
      _xblockexpression = _label.setText((((((("Argentina" + "<-") + "Peru") + "<-") + "Italia") + "<-") + "Egipto"));
    }
    return _xblockexpression;
  }
  
  public Label estadoDeLaOrdenDeArresto(final Panel panel) {
    Label _label = new Label(panel);
    return _label.setText("Orden ya emitida: Carmen Sandiego");
  }
  
  public void addActions(final Panel actionsPanel) {
  }
}
