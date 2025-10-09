# Ideas para mostrar el entorno de Python en la terminal

A continuación tienes varias propuestas para resaltar el entorno virtual de Python en el prompt de Starship. Todas son compatibles con tu configuración actual (sin módulos de Git) y se pueden activar copiando el bloque deseado en `config/starship.toml`.

## 1. Indicador compacto como prefijo

Muestra el nombre del entorno justo antes del prompt con un emoji y un color distintivo.

```toml
format = """
$python$username@$hostname:$directory ❯
"""

[python]
format = "[🐍 $virtualenv]($style) "
style = "bold green"
```

**Cuándo usarlo:** cuando quieras un recordatorio visible, pero sin paréntesis ni texto adicional. Ideal si sueles tener espacios cortos en la terminal.

## 2. Bloque resaltado con fondo

Convierte el entorno en una "badge" usando un color de fondo para que destaque incluso en prompts largos.

```toml
format = """
$python$username@$hostname:$directory ❯
"""

[python]
format = "[ $virtualenv ](bold white bg:#1c7c54) "
```

**Cuándo usarlo:** cuando trabajas con varios entornos y necesitas detectar rápidamente cuál está activo. La etiqueta con fondo reduce el riesgo de confusiones.

## 3. Mostrar el entorno en el prompt derecho

Libera espacio en el lado izquierdo y coloca el entorno en `right_format`, de forma similar a como lo hacen algunos temas de Zsh.

```toml
format = """
$username@$hostname:$directory ❯
"""
right_format = "$python"

[python]
format = "[($virtualenv)]($style)"
style = "bold green"
```

**Cuándo usarlo:** si prefieres mantener el prompt principal limpio y sólo echar un vistazo a la derecha cuando quieras saber el entorno activo.

## 4. Mostrar versión de Python con el entorno

Incluye tanto el nombre del entorno como la versión de Python para recordar rápidamente la combinación.

```toml
format = """
$python$username@$hostname:$directory ❯
"""

[python]
format = "[🐍 $virtualenv @ $python_version]($style) "
style = "bold green"
python_binary = "python"
disabled = false
```

**Cuándo usarlo:** si trabajas con múltiples versiones de Python y quieres validar que estás usando la correcta en cada entorno.

---

Puedes combinar estas ideas o ajustarlas (colores, símbolos, posición) según tus preferencias. Si quieres probar varias rápidamente, guarda cada bloque en tu `starship.toml`, comenta los que no estés usando y cambia entre ellos con un editor o `sed`.
