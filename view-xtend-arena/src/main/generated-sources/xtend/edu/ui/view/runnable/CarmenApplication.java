package edu.ui.view.runnable;

import edu.ui.view.CarmenSan10.MenuWindow;
import edu.ui.view.runnable.CarmenBootstrap;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;

@SuppressWarnings("all")
public class CarmenApplication extends Application {
  public CarmenApplication(final CarmenBootstrap bootstrap) {
    super(bootstrap);
  }
  
  public Window<?> createMainWindow() {
    return new MenuWindow(this);
  }
  
  /**
   * cada ves que quieran probar su(s) ventana(s) vengan y cambien aqui
   * tanto en el createMainWindow como en main y denle run en .star
   */
  public static void main(final String[] args) {
    CarmenBootstrap _carmenBootstrap = new CarmenBootstrap();
    new CarmenApplication(_carmenBootstrap).start();
  }
}
