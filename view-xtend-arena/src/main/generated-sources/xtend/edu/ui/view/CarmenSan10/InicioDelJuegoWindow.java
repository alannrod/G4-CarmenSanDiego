package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.CasoAppModel;
import edu.ui.domain.AppModel.ResolverMisterioAppModel;
import edu.ui.view.CarmenSan10.ResolviendoMisterioWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;

@SuppressWarnings("all")
public class InicioDelJuegoWindow extends SimpleWindow<CasoAppModel> {
  public InicioDelJuegoWindow(final WindowOwner parent) {
    super(parent, new CasoAppModel());
    this.setTitle(this.getModelObject().titulo());
  }
  
  protected void addActions(final Panel mainPanel) {
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        InicioDelJuegoWindow.this.crearPanelDeInvitacion(it);
        InicioDelJuegoWindow.this.crearPanelDeDescripcion(it);
        InicioDelJuegoWindow.this.crearPanelDeOpciones(it);
      }
    };
    ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelDeInvitacion(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setText("Detective, tenemos un caso para usted!");
            it.setFontSize(11);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelDeDescripcion(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        it.setWidth(200);
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setText(InicioDelJuegoWindow.this.getModelObject().descripcion());
            it.setFontSize(11);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelDeOpciones(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
        Button _button = new Button(it);
        final Procedure1<Button> _function = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Aceptar el caso");
            it.setAsDefault();
            final Action _function = new Action() {
              public void execute() {
                CasoAppModel _modelObject = InicioDelJuegoWindow.this.getModelObject();
                final ResolverMisterioAppModel nextModel = new ResolverMisterioAppModel(_modelObject);
                final ResolviendoMisterioWindow window = new ResolviendoMisterioWindow(InicioDelJuegoWindow.this, nextModel);
                window.open();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
        Button _button_1 = new Button(it);
        final Procedure1<Button> _function_1 = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Cancelar");
            final Action _function = new Action() {
              public void execute() {
                InicioDelJuegoWindow.this.close();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
}
