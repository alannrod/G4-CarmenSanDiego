package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.MapamundiAppModel;
import edu.ui.domain.CarmenSan10.Caracteristicas;
import edu.ui.domain.CarmenSan10.LugarDeInteres;
import edu.ui.domain.CarmenSan10.Pais;
import edu.ui.view.CarmenSan10.EditarPaisWindows;
import edu.ui.view.CarmenSan10.NuevoPaisWindow;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.TableBuilder;
import org.uqbar.lacar.ui.model.bindings.ViewObservable;

@SuppressWarnings("all")
public class MapamundiWindow extends SimpleWindow<MapamundiAppModel> {
  public MapamundiWindow(final WindowOwner parent) {
    super(parent, new MapamundiAppModel());
    this.setTitle("Mapamundi");
  }
  
  protected void addActions(final Panel mainPanel) {
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        ColumnLayout _columnLayout = new ColumnLayout(2);
        it.setLayout(_columnLayout);
        MapamundiWindow.this.crearPanelIzquierdo(it);
        MapamundiWindow.this.crearPanelDerecho(it);
      }
    };
    ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelIzquierdo(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        MapamundiWindow.this.crearPanelDePaises(it);
        MapamundiWindow.this.crearPanelDeOpciones(it);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Column<Pais> crearPanelDePaises(final Panel panelIzq) {
    Column<Pais> _xblockexpression = null;
    {
      Table<Pais> _table = new Table<Pais>(panelIzq, Pais.class);
      final Procedure1<Table<Pais>> _function = new Procedure1<Table<Pais>>() {
        public void apply(final Table<Pais> it) {
          ViewObservable<Table<Pais>, TableBuilder<Pais>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "todosLosPaises");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "itemSeleccionado");
        }
      };
      final Table<Pais> table = ObjectExtensions.<Table<Pais>>operator_doubleArrow(_table, _function);
      Column<Pais> _column = new Column<Pais>(table);
      final Procedure1<Column<Pais>> _function_1 = new Procedure1<Column<Pais>>() {
        public void apply(final Column<Pais> it) {
          it.setTitle("Paises");
          it.setFixedSize(150);
          it.bindContentsToProperty("nombrePais");
        }
      };
      _xblockexpression = ObjectExtensions.<Column<Pais>>operator_doubleArrow(_column, _function_1);
    }
    return _xblockexpression;
  }
  
  public Panel crearPanelDeOpciones(final Panel panelIzq) {
    Panel _panel = new Panel(panelIzq);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Button _button = new Button(it);
        final Procedure1<Button> _function = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Eliminar");
            final Action _function = new Action() {
              public void execute() {
                MapamundiAppModel _modelObject = MapamundiWindow.this.getModelObject();
                _modelObject.eliminarPaisSeleccionado();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
        Button _button_1 = new Button(it);
        final Procedure1<Button> _function_1 = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Editar");
            final Action _function = new Action() {
              public void execute() {
                MapamundiWindow.this.editarPais();
              }
            };
            it.onClick(_function);
          }
        };
        ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
        Button _button_2 = new Button(it);
        final Procedure1<Button> _function_2 = new Procedure1<Button>() {
          public void apply(final Button it) {
            it.setCaption("Nuevo");
            it.setAsDefault();
            final Action _function = new Action() {
              public void execute() {
                MapamundiWindow.this.agregarNuevoPais();
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
  
  public void editarPais() {
    MapamundiAppModel _modelObject = this.getModelObject();
    Pais _itemSeleccionado = _modelObject.getItemSeleccionado();
    EditarPaisWindows _editarPaisWindows = new EditarPaisWindows(this, _itemSeleccionado);
    this.openDialog(_editarPaisWindows);
  }
  
  public void agregarNuevoPais() {
    NuevoPaisWindow _nuevoPaisWindow = new NuevoPaisWindow(this);
    this.openDialog(_nuevoPaisWindow);
  }
  
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = new Action() {
      public void execute() {
        MapamundiAppModel _modelObject = MapamundiWindow.this.getModelObject();
        _modelObject.search();
      }
    };
    dialog.onAccept(_function);
    dialog.open();
  }
  
  public Panel crearPanelDerecho(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        MapamundiWindow.this.crearPanelDeNombre(it);
        MapamundiWindow.this.crearPanelDeCaracteristicas(it);
        MapamundiWindow.this.crearPanelDeConexiones(it);
        MapamundiWindow.this.crearPanelDeLugares(it);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelDeNombre(final Panel panelDer) {
    Panel _panel = new Panel(panelDer);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setText("Nombre: ");
            it.setFontSize(11);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
        Label _label_1 = new Label(it);
        final Procedure1<Label> _function_1 = new Procedure1<Label>() {
          public void apply(final Label it) {
            ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
            ArenaXtendExtensions.operator_spaceship(_value, "itemSeleccionado.nombrePais");
            it.setFontSize(11);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Panel crearPanelDeCaracteristicas(final Panel panelDer) {
    Panel _panel = new Panel(panelDer);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setText("Caracteristicas");
            it.setFontSize(11);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
        MapamundiWindow.this.tablaDeCaracteristicas(it);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Column<Caracteristicas> tablaDeCaracteristicas(final Panel panelDer) {
    Column<Caracteristicas> _xblockexpression = null;
    {
      Table<Caracteristicas> _table = new Table<Caracteristicas>(panelDer, Caracteristicas.class);
      final Procedure1<Table<Caracteristicas>> _function = new Procedure1<Table<Caracteristicas>>() {
        public void apply(final Table<Caracteristicas> it) {
          ViewObservable<Table<Caracteristicas>, TableBuilder<Caracteristicas>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "itemSeleccionado.caracteristicaPais");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "itemSeleccionado");
        }
      };
      final Table<Caracteristicas> table = ObjectExtensions.<Table<Caracteristicas>>operator_doubleArrow(_table, _function);
      Column<Caracteristicas> _column = new Column<Caracteristicas>(table);
      final Procedure1<Column<Caracteristicas>> _function_1 = new Procedure1<Column<Caracteristicas>>() {
        public void apply(final Column<Caracteristicas> it) {
          it.setTitle("Caracteristicas");
          it.setFixedSize(150);
          it.bindContentsToProperty("nombre");
        }
      };
      _xblockexpression = ObjectExtensions.<Column<Caracteristicas>>operator_doubleArrow(_column, _function_1);
    }
    return _xblockexpression;
  }
  
  public Panel crearPanelDeConexiones(final Panel panelDer) {
    Panel _panel = new Panel(panelDer);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setText("Conexiones");
            it.setFontSize(11);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
        MapamundiWindow.this.tablaDeConexiones(it);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Column<Pais> tablaDeConexiones(final Panel panelDer) {
    Column<Pais> _xblockexpression = null;
    {
      Table<Pais> _table = new Table<Pais>(panelDer, Pais.class);
      final Procedure1<Table<Pais>> _function = new Procedure1<Table<Pais>>() {
        public void apply(final Table<Pais> it) {
          ViewObservable<Table<Pais>, TableBuilder<Pais>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "itemSeleccionado.paisesConexionAerea");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "itemSeleccionado");
        }
      };
      final Table<Pais> table = ObjectExtensions.<Table<Pais>>operator_doubleArrow(_table, _function);
      Column<Pais> _column = new Column<Pais>(table);
      final Procedure1<Column<Pais>> _function_1 = new Procedure1<Column<Pais>>() {
        public void apply(final Column<Pais> it) {
          it.setTitle("Conexiones");
          it.setFixedSize(150);
          it.bindContentsToProperty("nombrePais");
        }
      };
      _xblockexpression = ObjectExtensions.<Column<Pais>>operator_doubleArrow(_column, _function_1);
    }
    return _xblockexpression;
  }
  
  public Panel crearPanelDeLugares(final Panel panelDer) {
    Panel _panel = new Panel(panelDer);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        Label _label = new Label(it);
        final Procedure1<Label> _function = new Procedure1<Label>() {
          public void apply(final Label it) {
            it.setText("Lugares de Interes");
            it.setFontSize(11);
          }
        };
        ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
        MapamundiWindow.this.tablaDeLugares(it);
      }
    };
    return ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
  }
  
  public Column<LugarDeInteres> tablaDeLugares(final Panel panelDer) {
    Column<LugarDeInteres> _xblockexpression = null;
    {
      Table<LugarDeInteres> _table = new Table<LugarDeInteres>(panelDer, LugarDeInteres.class);
      final Procedure1<Table<LugarDeInteres>> _function = new Procedure1<Table<LugarDeInteres>>() {
        public void apply(final Table<LugarDeInteres> it) {
          ViewObservable<Table<LugarDeInteres>, TableBuilder<LugarDeInteres>> _items = it.items();
          ArenaXtendExtensions.operator_spaceship(_items, "itemSeleccionado.lugares");
          ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
          ArenaXtendExtensions.operator_spaceship(_value, "itemSeleccionado");
        }
      };
      final Table<LugarDeInteres> table = ObjectExtensions.<Table<LugarDeInteres>>operator_doubleArrow(_table, _function);
      Column<LugarDeInteres> _column = new Column<LugarDeInteres>(table);
      final Procedure1<Column<LugarDeInteres>> _function_1 = new Procedure1<Column<LugarDeInteres>>() {
        public void apply(final Column<LugarDeInteres> it) {
          it.setTitle("Lugares");
          it.setFixedSize(150);
          it.bindContentsToProperty("nombreLugar");
        }
      };
      _xblockexpression = ObjectExtensions.<Column<LugarDeInteres>>operator_doubleArrow(_column, _function_1);
    }
    return _xblockexpression;
  }
}
