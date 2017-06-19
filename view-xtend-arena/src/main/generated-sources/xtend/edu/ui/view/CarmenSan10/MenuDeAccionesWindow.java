package edu.ui.view.CarmenSan10;

import edu.ui.domain.AppModel.CarmenSandiegoAppModel;
import edu.ui.domain.CarmenSan10.ACME;
import edu.ui.domain.CarmenSan10.Caso;
import edu.ui.domain.CarmenSan10.Mapamundi;
import edu.ui.view.CarmenSan10.ExpedienteMenuDeAccionesView;
import edu.ui.view.CarmenSan10.InicioDelJuegoWindow;
import edu.ui.view.CarmenSan10.MapamundiWindow;
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
public class MenuDeAccionesWindow extends SimpleWindow<CarmenSandiegoAppModel> {
  /**
   * esta es la primer ventana que me aparece cuando inicio el juego,
   * la hice extender de detective, ya que son comportamientos basicos de un detective
   */
  public MenuDeAccionesWindow(final WindowOwner parent) {
    super(parent, new CarmenSandiegoAppModel(new Mapamundi(), new ACME()));
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("¿Donde esta Carmen Sandiego?");
    this.setTaskDescription("");
    super.createMainTemplate(mainPanel);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel _panel = new Panel(mainPanel);
    final Procedure1<Panel> _function = new Procedure1<Panel>() {
      public void apply(final Panel it) {
        HorizontalLayout _horizontalLayout = new HorizontalLayout();
        it.setLayout(_horizontalLayout);
      }
    };
    final Panel panelDelFormulario = ObjectExtensions.<Panel>operator_doubleArrow(_panel, _function);
    Label _label = new Label(panelDelFormulario);
    final Procedure1<Label> _function_1 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("¿Qué haremos ahora Detective?");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label, _function_1);
  }
  
  protected void addActions(final Panel actionsPanel) {
    Button _button = new Button(actionsPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Resolver Misterio");
        final Action _function = new Action() {
          public void execute() {
            MenuDeAccionesWindow.this.iniciarJuego();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
    Button _button_1 = new Button(actionsPanel);
    final Procedure1<Button> _function_1 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Mapamundi");
        final Action _function = new Action() {
          public void execute() {
            MenuDeAccionesWindow.this.mapamundi();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_1, _function_1);
    Button _button_2 = new Button(actionsPanel);
    final Procedure1<Button> _function_2 = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("Expedientes");
        final Action _function = new Action() {
          public void execute() {
            MenuDeAccionesWindow.this.expediente();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button_2, _function_2);
  }
  
  public void iniciarJuego() {
    Caso _caso = new Caso();
    new InicioDelJuegoWindow(this, _caso).open();
  }
  
  public void mapamundi() {
    new MapamundiWindow(this).open();
  }
  
  public void expediente() {
    new ExpedienteMenuDeAccionesView(this).open();
  }
}
