package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.LugarInteresAppModel;
import edu.ui.domain.AppModel.ResolverMisterioAppModel;
import edu.ui.domain.CarmenSan10.Caso;
import edu.ui.domain.CarmenSan10.Detective;
import edu.ui.domain.CarmenSan10.Expediente;
import edu.ui.domain.CarmenSan10.LugarDeInteres;
import edu.ui.domain.CarmenSan10.Pais;
import edu.ui.view.CarmenSan10.ExpedienteWindow;
import edu.ui.view.CarmenSan10.LugaresWindow;
import edu.ui.view.CarmenSan10.OrdenArrestoWindow;
import edu.ui.view.CarmenSan10.ViajarWindow;
import java.util.List;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class ResolviendoMisterioWindow extends SimpleWindow<ResolverMisterioAppModel> {
  public ResolviendoMisterioWindow(final WindowOwner parent, final ResolverMisterioAppModel model) {
    super(parent, model);
    String _tituloDelMisterio = this.tituloDelMisterio();
    this.setTitle(_tituloDelMisterio);
  }
  
  public String tituloDelMisterio() {
    ResolverMisterioAppModel _modelObject = this.getModelObject();
    Caso _caso = _modelObject.getCaso();
    String _objetoDelRobo = _caso.getObjetoDelRobo();
    return "Resolviendo: ".concat(_objetoDelRobo);
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
                OrdenArrestoWindow _ordenArrestoWindow = new OrdenArrestoWindow(ResolviendoMisterioWindow.this, _modelObject);
                _ordenArrestoWindow.open();
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
                ViajarWindow _viajarWindow = new ViajarWindow(ResolviendoMisterioWindow.this, _modelObject);
                _viajarWindow.open();
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
                ResolverMisterioAppModel _modelObject = ResolviendoMisterioWindow.this.getModelObject();
                Expediente _expediente = _modelObject.getExpediente();
                ExpedienteWindow _expedienteWindow = new ExpedienteWindow(ResolviendoMisterioWindow.this, _expediente);
                _expedienteWindow.open();
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
            ResolverMisterioAppModel _modelObject = ResolviendoMisterioWindow.this.getModelObject();
            Detective _detective = _modelObject.getDetective();
            String _nombreDelPaisActual = _detective.nombreDelPaisActual();
            String _upperCase = _nombreDelPaisActual.toUpperCase();
            it.setText(_upperCase);
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
            ResolverMisterioAppModel _modelObject = ResolviendoMisterioWindow.this.getModelObject();
            Detective _detective = _modelObject.getDetective();
            String _ordenDeArresto = _detective.getOrdenDeArresto();
            String _concat = "Orden ya emitida: ".concat(_ordenDeArresto);
            it.setText(_concat);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelDerecho(final Panel panel) {
    Panel _xblockexpression = null;
    {
      ResolverMisterioAppModel _modelObject = this.getModelObject();
      Detective _detective = _modelObject.getDetective();
      Pais _ubicacionActual = _detective.ubicacionActual();
      final List<LugarDeInteres> losLugares = _ubicacionActual.getLugares();
      Panel _panel = new Panel(panel);
      final Procedure1<Panel> _function = new Procedure1<Panel>() {
        public void apply(final Panel it) {
          Label _label = new Label(it);
          final Procedure1<Label> _function = new Procedure1<Label>() {
            public void apply(final Label it) {
              it.setFontSize(10);
              it.setText("Lugares");
            }
          };
          ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
          LugarDeInteres _get = losLugares.get(0);
          ResolviendoMisterioWindow.this.botonLugar(it, _get);
          LugarDeInteres _get_1 = losLugares.get(1);
          ResolviendoMisterioWindow.this.botonLugar(it, _get_1);
          LugarDeInteres _get_2 = losLugares.get(2);
          ResolviendoMisterioWindow.this.botonLugar(it, _get_2);
        }
      };
      _xblockexpression = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    }
    return _xblockexpression;
  }
  
  public Panel botonLugar(final Panel panel, final LugarDeInteres interes) {
    Panel _panel = new Panel(panel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Button _button = new Button(it);
        final Procedure1<Button> _function = new Procedure1<Button>() {
          public void apply(final Button it) {
            String _nombreLugar = interes.getNombreLugar();
            it.setCaption(_nombreLugar);
            final Action _function = new Action() {
              public void execute() {
                ResolverMisterioAppModel _modelObject = ResolviendoMisterioWindow.this.getModelObject();
                Caso _caso = _modelObject.getCaso();
                ResolverMisterioAppModel _modelObject_1 = ResolviendoMisterioWindow.this.getModelObject();
                Detective _detective = _modelObject_1.getDetective();
                LugarInteresAppModel lugarApp = new LugarInteresAppModel(interes, _caso, _detective);
                LugaresWindow _lugaresWindow = new LugaresWindow(ResolviendoMisterioWindow.this, lugarApp);
                _lugaresWindow.open();
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
  
  public Panel crearPanelInformacion(final Panel panel) {
    Panel _panel = new Panel(panel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setFontSize(10);
            it.setText("Recorrido criminal:");
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
        ResolviendoMisterioWindow.this.imprimirRecorrido(it);
        Label _label_1 = new Label(it);
        final Procedure1<Label> _function_1 = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setFontSize(10);
            it.setText("Destinos fallidos:");
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
        ResolviendoMisterioWindow.this.tablaDeDestinos(it);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel imprimirRecorrido(final Panel panel) {
    Panel _xblockexpression = null;
    {
      ResolverMisterioAppModel _modelObject = this.getModelObject();
      Detective _detective = _modelObject.getDetective();
      final List<Pais> pavis = _detective.paisesVisitados();
      final String reco = "";
      for (final Pais p : pavis) {
        {
          String _upperCase = p.nombrePais.toUpperCase();
          reco.concat(_upperCase);
          reco.concat(" <- ");
        }
      }
      Panel _panel = new Panel(panel);
      final Procedure1<Panel> _function = new Procedure1<Panel>() {
        public void apply(final Panel it) {
          Label _label = new Label(it);
          final Procedure1<Label> _function = new Procedure1<Label>() {
            public void apply(final Label it) {
              it.setFontSize(10);
              it.setText(reco);
            }
          };
          ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
        }
      };
      _xblockexpression = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    }
    return _xblockexpression;
  }
  
  public Column<Pais> tablaDeDestinos(final Panel panel) {
    Column<Pais> _xblockexpression = null;
    {
      Table<Pais> _table = new Table<Pais>(panel, Pais.class);
      final Procedure1<Table<Pais>> _function = new Procedure1<Table<Pais>>() {
        public void apply(final Table<Pais> it) {
          ViewObservable<Table<Pais>, TableBuilder<Pais>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "paisesFallidos");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "paisSeleccionado");
        }
      };
      final Table<Pais> table = ObjectExtensions.<Table<Pais>>operator_doubleArrow(_table, _function);
      Column<Pais> _column = new Column<Pais>(table);
      final Procedure1<Column<Pais>> _function_1 = new Procedure1<Column<Pais>>() {
        public void apply(final Column<Pais> it) {
          it.setTitle("Pais");
          it.setFixedSize(150);
          it.bindContentsToProperty("nombrePais");
        }
      };
      _xblockexpression = ObjectExtensions.<Column<Pais>>operator_doubleArrow(_column, _function_1);
    }
    return _xblockexpression;
  }
}
