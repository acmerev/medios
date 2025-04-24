package testPackage.com.bean;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import testPackage.com.dao.UsuariosDAO;
import testPackage.com.model.User;
import javax.faces.component.html.HtmlInputHidden;
import java.io.Serializable;

@Component
@ManagedBean
@ViewScoped
public class AdminVerificationBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private String username;
    private String password;
    private HtmlInputHidden userIdToEdit;

    @Autowired
    private UsuariosDAO usuariosDAO; // Asegúrate de tener tu DAO configurado

    public String verifyAdmin() {
        if (userIdToEdit == null || userIdToEdit.getValue() == null) {
            FacesContext.getCurrentInstance().addMessage(null, new javax.faces.application.FacesMessage(javax.faces.application.FacesMessage.SEVERITY_ERROR, "Error: No se especificó el usuario a editar.", null));
            return null;
        }

        // Convertir el valor del HtmlInputHidden a Long (o el tipo de tu ID de usuario)
        Long userId = null;
        try {
            userId = Long.parseLong(userIdToEdit.getValue().toString());
        } catch (NumberFormatException e) {
            FacesContext.getCurrentInstance().addMessage(null, new javax.faces.application.FacesMessage(javax.faces.application.FacesMessage.SEVERITY_ERROR, "Error: ID de usuario inválido.", null));
            return null;
        }

        User admin = usuariosDAO.findAdminByUsernameAndPassword(username, password); // Implementa este método en tu DAO

        if (admin != null) {
            // Almacenar autorización temporal en la sesión
            HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
            session.setAttribute("adminAuthorizedForEdit_" + userId, true);
            return "editarUsuario.xhtml?faces-redirect=true&userId=" + userId; // Redirigir al formulario de edición
        } else {
            FacesContext.getCurrentInstance().addMessage(null, new javax.faces.application.FacesMessage(javax.faces.application.FacesMessage.SEVERITY_ERROR, "Credenciales de administrador incorrectas.", null));
            return null;
        }
    }

    // Getters y setters

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public HtmlInputHidden getUserIdToEdit() {
        return userIdToEdit;
    }

    public void setUserIdToEdit(HtmlInputHidden userIdToEdit) {
        this.userIdToEdit = userIdToEdit;
    }

    public UsuariosDAO getUsuariosDAO() {
        return usuariosDAO;
    }

    public void setUsuariosDAO(UsuariosDAO usuariosDAO) {
        this.usuariosDAO = usuariosDAO;
    }
}