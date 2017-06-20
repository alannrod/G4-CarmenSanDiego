package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.LugarInteresAppModel;
import edu.ui.domain.AppModel.ResolverMisterioAppModel;
import edu.ui.domain.CarmenSan10.Caso;
import edu.ui.domain.CarmenSan10.LugarDeInteres;
import edu.ui.view.CarmenSan10.LugaresWindow;
import edu.ui.view.CarmenSan10.OrdenArrestoWindow;
import edu.ui.view.CarmenSan10.ViajarWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.layout.VerticalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;

@SuppressWarnings("all")
public class ResolviendoMisterioWindow extends SimpleWindow<ResolverMisterioAppModel> {
  public ResolviendoMisterioWindow(final WindowOwner parent, final ResolverMisterioAppModel model) {
    super(parent, model);
  }
  
  public void createFormPanel(final Panel mainPanel) {
    this.setTitle("Resolviendo:");
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
        Panel _panel = new Panel(it);
        final Procedure1<Panel> _function = new Procedure1<Panel>() {
          public void apply(final Panel it) {
            Label _label = new Label(it);
            _label.setText("Estás en:");
            Button _button = new Button(it);
            final Procedure1<Button> _function = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Orden De Arresto");
                final Action _function = new Action() {
                  public void execute() {
                    ResolviendoMisterioWindow.this.abrirOrdenDeArresto();
                  }
                };
                it.onClick(_function);
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
            Label _label_1 = new Label(it);
            final Procedure1<Label> _function_1 = new Procedure1<Label>() {
              public void apply(final Label it) {
                it.setFontSize(8);
                it.setText("Orden ya emitida: Carmen Sandiego");
              }
            };
            ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
            Button _button_1 = new Button(it);
            final Procedure1<Button> _function_2 = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Viajar");
                final Action _function = new Action() {
                  public void execute() {
                    ResolviendoMisterioWindow.this.abrirViajarAPais();
                  }
                };
                it.onClick(_function);
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_2);
            Button _button_2 = new Button(it);
            final Procedure1<Button> _function_3 = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Expedientes");
                final Action _function = new Action() {
                  public void execute() {
                    ResolviendoMisterioWindow.this.verExpedientes();
                  }
                };
                it.onClick(_function);
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_3);
          }
        };
        final Panel left = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
        Panel _panel_1 = new Panel(it);
        final Procedure1<Panel> _function_1 = new Procedure1<Panel>() {
          public void apply(final Panel it) {
            Label _label = new Label(it);
            _label.setText("Lugares:");
            Button _button = new Button(it);
            final Procedure1<Button> _function = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Biblioteca");
                final Action _function = new Action() {
                  public void execute() {
                    ResolviendoMisterioWindow.this.abrir1erLugarDeInteres();
                  }
                };
                it.onClick(_function);
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
            Button _button_1 = new Button(it);
            final Procedure1<Button> _function_1 = new Procedure1<Button>() {
              public void apply(final Button it) {
                it.setCaption("Club");
                final Action _function = new Action() {
                  public void execute() {
                    ResolviendoMisterioWindow.this.abrir2erLugarDeInteres();
                  }
                };
                it.onClick(_function);
              }
            };
            ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
          }
        };
        final Panel right = ObjectExtensions.<Panel>operator_doubleArrow(_panel_1, _function_1);
        Button _button = new Button(it);
        final Procedure1<Button> _function_2 = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Embajada");
            final Action _function = new Action() {
              public void execute() {
                ResolviendoMisterioWindow.this.abrir3erLugarDeInteres();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button, _function_2);
      }
    };
    final Panel generalPanel = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Label _label = new Label(generalPanel);
    _label.setText("Recorrido criminal:");
    Label _label_1 = new Label(generalPanel);
    _label_1.setText(this.getModelObject().recorridoCriminal().toString());
  }
  
  public void abrir3erLugarDeInteres() {
    LugarDeInteres _el3erLugarDeInteres = this.getModelObject().el3erLugarDeInteres();
    Caso _caso = this.getModelObject().getCaso();
    LugarInteresAppModel lugarApp = new LugarInteresAppModel(_el3erLugarDeInteres, _caso);
    new LugaresWindow(this, lugarApp).open();
  }
  
  public void abrir2erLugarDeInteres() {
    LugarDeInteres _el2doLugarDeInteres = this.getModelObject().el2doLugarDeInteres();
    Caso _caso = this.getModelObject().getCaso();
    LugarInteresAppModel lugarApp = new LugarInteresAppModel(_el2doLugarDeInteres, _caso);
    new LugaresWindow(this, lugarApp).open();
  }
  
  protected void abrir1erLugarDeInteres() {
    LugarDeInteres _el1erLugarDeInteres = this.getModelObject().el1erLugarDeInteres();
    Caso _caso = this.getModelObject().getCaso();
    LugarInteresAppModel lugarApp = new LugarInteresAppModel(_el1erLugarDeInteres, _caso);
    new LugaresWindow(this, lugarApp).open();
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
