// En el paquete testPackage.com.web.bean
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean(name = "loginBean")
@SessionScoped
public class LoginBean {
    private String username;
    private String password;

    // Getters y Setters

    public String login() {
        if ("admin".equals(username) && "1234".equals(password)) {
            return "index?faces-redirect=true"; // redirige a index.jsp
        } else {
            // Mostrar mensaje de error (puedes usar FacesMessage)
            return null;
        }
    }

    public String logout() {
        return "login?faces-redirect=true";
    }
}
