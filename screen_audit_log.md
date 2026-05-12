# Auditoría pantallas (registro vivo)

Espacio para ir anotando qué pantalla revisamos, qué problema vio QA/diseño y qué se hizo. Cuando mandes nuevas capturas, se puede ir ampliando la tabla.

| Pantalla | Ruta / clase | Problema observado | Ajuste / decisión |
|----------|----------------|---------------------|-------------------|
| Login correo + PIN | `/loginPagenew` · `LoginPagenewWidget` | Franja amarilla/negra y mensaje **BOTTOM OVERFLOWED BY ~22px** en viewport tipo iPhone SE: el alto del vídeo/header + formulario sin altura máxima acotada para el scroll. | Se envolvió el bloque inferior (`Align` + `Padding` + `SingleChildScrollView`) en **`Expanded`** para que el área del formulario ocupe solo el espacio restante debajo del header; el contenido puede desplazarse dentro del scroll sin desbordar el `Column` raíz del `body`. |
