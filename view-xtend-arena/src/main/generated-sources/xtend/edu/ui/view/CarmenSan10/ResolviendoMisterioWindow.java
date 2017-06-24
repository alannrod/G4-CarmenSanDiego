package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.LugarInteresAppModel;
import edu.ui.domain.AppModel.ResolverMisterioAppModel;
import edu.ui.domain.CarmenSan10.Caso;
import edu.ui.domain.CarmenSan10.Expediente;
import edu.ui.domain.CarmenSan10.LugarDeInteres;
import edu.ui.view.CarmenSan10.ExpedienteWindow;
import edu.ui.view.CarmenSan10.LugaresWindow;
import edu.ui.view.CarmenSan10.OrdenArrestoWindow;
import edu.ui.view.CarmenSan10.ViajarWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.layout.ColumnLayout;
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
    this.setTitle(this.tituloDelMisterio());
  }
  
  public String tituloDelMisterio() {
    return "Resolviendo: ".concat(this.getModelObject().getCaso().getObjetoDelRobo());
  }
  
  protected void addActions(final Panel mainPanel) {
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ResolviendoMisterioWindow.this.crearPanelTareas(it);
        ResolviendoMisterioWindow.this.crearPanelInformacion(it);
      }
    };
    ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelTareas(final Panel panel) {
    Panel _panel = new Panel(panel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
        ResolviendoMisterioWindow.this.crearPanelIzquierdo(it);
        ResolviendoMisterioWindow.this.crearPanelDerecho(it);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelIzquierdo(final Panel panelIzq) {
    Panel _panel = new Panel(panelIzq);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ResolviendoMisterioWindow.this.infoPais(it);
        Button _button = new Button(it);
        final Procedure1<Button> _function = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Orden De Arresto");
            final Action _function = new Action() {
              public void execute() {
                ResolverMisterioAppModel _modelObject = ResolviendoMisterioWindow.this.getModelObject();
                new OrdenArrestoWindow(ResolviendoMisterioWindow.this, _modelObject).open();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
        ResolviendoMisterioWindow.this.infoOrden(it);
        Button _button_1 = new Button(it);
        final Procedure1<Button> _function_1 = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Viajar");
            final Action _function = new Action() {
              public void execute() {
                ResolverMisterioAppModel _modelObject = ResolviendoMisterioWindow.this.getModelObject();
                new ViajarWindow(ResolviendoMisterioWindow.this, _modelObject).open();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
        Button _button_2 = new Button(it);
        final Procedure1<Button> _function_2 = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Expedientes");
            final Action _function = new Action() {
              public void execute() {
                Expediente _expediente = ResolviendoMisterioWindow.this.getModelObject().getExpediente();
                new ExpedienteWindow(ResolviendoMisterioWindow.this, _expediente).open();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel infoPais(final Panel panel) {
    Panel _panel = new Panel(panel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setFontSize(10);
            it.setText("Estas en: ");
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
        Label _label_1 = new Label(it);
        final Procedure1<Label> _function_1 = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setFontSize(12);
            it.setText(ResolviendoMisterioWindow.this.getModelObject().getDetective().nombreDelPaisActual().toUpperCase());
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel infoOrden(final Panel panel) {
    Panel _panel = new Panel(panel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setFontSize(10);
            it.setText("Orden ya emitida: ".concat(ResolviendoMisterioWindow.this.getModelObject().getDetective().getOrdenDeArresto()));
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelDerecho(final Panel panel) {
    Panel _panel = new Panel(panel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setFontSize(10);
            it.setText("Lugares0");
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel botonLugar(final Panel panel, final LugarDeInteres interes) {
    Panel _panel = new Panel(panel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Button _button = new Button(it);
        final Procedure1<Button> _function = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption(interes.getNombreLugar());
            final Action _function = new Action() {
              public void execute() {
                Caso _caso = ResolviendoMisterioWindow.this.getModelObject().getCaso();
                LugarInteresAppModel lugarApp = new LugarInteresAppModel(interes, _caso);
                new LugaresWindow(ResolviendoMisterioWindow.this, lugarApp).open();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Object crearPanelInformacion(final Panel panel) {
    return null;
  }
}
