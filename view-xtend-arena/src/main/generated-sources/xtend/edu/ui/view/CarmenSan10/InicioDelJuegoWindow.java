package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.ResolverMisterioAppModel;
import edu.ui.domain.CarmenSan10.Caso;
import edu.ui.view.CarmenSan10.ResolviendoMisterioWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;

@SuppressWarnings("all")
public class InicioDelJuegoWindow extends SimpleWindow<Caso> {
  public InicioDelJuegoWindow(final WindowOwner parent, final Caso model) {
    super(parent, model);
  }
  
  public void createFormPanel(final Panel mainPanel) {
    this.setTitle("Robo del Faraón");
    final Panel panelDelCaso = new Panel(mainPanel);
    VerticalLayout _verticalLayout = new VerticalLayout();
    panelDelCaso.setLayout(_verticalLayout);
    Label _label = new Label(panelDelCaso);
    _label.setText("Detective, tenemos un caso para usted!");
    final Panel detalleDelCaso = new Panel(panelDelCaso);
    VerticalLayout _verticalLayout_1 = new VerticalLayout();
    detalleDelCaso.setLayout(_verticalLayout_1);
    Label _label_1 = new Label(detalleDelCaso);
    _label_1.setText("A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del bla bla bla");
  }
  
  public void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Aceptar el caso");
        final Action _function = new Action() {
          public void execute() {
            InicioDelJuegoWindow.this.resolverMisterio();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
  }
  
  public void resolverMisterio() {
    ResolverMisterioAppModel _resolverMisterioAppModel = new ResolverMisterioAppModel();
    new ResolviendoMisterioWindow(this, _resolverMisterioAppModel).open();
  }
}
