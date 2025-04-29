public void actualizarUsuarios(UsuariosDTO dto) {
   
    // Verificar si la contraseña ha sido proporcionada para actualizar
    if (dto.getPassword() != null && !dto.getPassword().isEmpty()) {
        // Hashear la nueva contraseña
        String hashedPassword = HashUtil.sha256(dto.getPassword());
        // Sobrescribir la contraseña en el DTO con el hash
        dto.setPassword(hashedPassword);
    }

    // Ejecutar la actualización en la base de datos
    getJdbcTemplate().update(
        actualizaUsuarios,
        new Object[] {
            dto.getPaterno(),
            dto.getMaterno(),
            dto.getNombre(),
            dto.getCorreo(),
            dto.getId_jefe(),
            dto.getPassword(), // Aquí se usará la contraseña hasheada (si se modificó) o la existente
            dto.getNivel(),
            dto.getId_usuario()
        },
        new int[] {
            Types.VARCHAR,
            Types.VARCHAR,
            Types.VARCHAR,
            Types.VARCHAR,
            Types.INTEGER,
            Types.VARCHAR,
            Types.VARCHAR,
            Types.INTEGER
        }
    );

    Utilierias.setsetMessage("Registro actualizado !");
}