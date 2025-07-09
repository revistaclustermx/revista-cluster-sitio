#!/bin/bash

echo "📝 Insertando menús dropdown..."

# Función para insertar después de una línea específica
insert_after_line() {
    local line_num=$1
    local content="$2"
    local temp_file="temp_insert.txt"
    
    # Crear archivo temporal con el contenido a insertar
    echo "$content" > "$temp_file"
    
    # Insertar después de la línea especificada
    sed -i "${line_num}r $temp_file" index.html
    
    # Limpiar archivo temporal
    rm "$temp_file"
}

# Buscar las líneas exactas de cada botón
NUMEROS_LINE=$(grep -n 'NÚMEROS.*dropdown-arrow.*</span></a></div>' index.html | cut -d: -f1)
FEATURES_LINE=$(grep -n 'FEATURES.*dropdown-arrow.*</span></a></div>' index.html | cut -d: -f1)
OPINION_LINE=$(grep -n 'OPINIÓN.*dropdown-arrow.*</span></a></div>' index.html | cut -d: -f1)
LUCUB_LINE=$(grep -n 'LUCUBRACIONES.*dropdown-arrow.*</span></a></div>' index.html | cut -d: -f1)

echo "Líneas encontradas:"
echo "NÚMEROS: $NUMEROS_LINE"
echo "FEATURES: $FEATURES_LINE"
echo "OPINIÓN: $OPINION_LINE"
echo "LUCUBRACIONES: $LUCUB_LINE"

# Menú para NÚMEROS
if [ ! -z "$NUMEROS_LINE" ]; then
    echo "Insertando menú NÚMEROS en línea $NUMEROS_LINE"
    insert_after_line $NUMEROS_LINE '<div class="dropdown-menu">
    <a href="/no-8.html" class="dropdown-item">Número 8 (Actual)</a>
    <a href="/numeros" class="dropdown-item">Números Anteriores</a>
    <a href="/1000-palabras" class="dropdown-item">+ 1000 Palabras</a>
</div>'
fi

# Necesitamos recalcular las líneas después de cada inserción
# Menú para FEATURES
FEATURES_LINE=$(grep -n 'FEATURES.*dropdown-arrow.*</span></a></div>' index.html | cut -d: -f1)
if [ ! -z "$FEATURES_LINE" ]; then
    echo "Insertando menú FEATURES en línea $FEATURES_LINE"
    insert_after_line $FEATURES_LINE '<div class="dropdown-menu">
    <a href="/tentempie" class="dropdown-item">Features Generales</a>
    <a href="/copia-de-retrospectivas" class="dropdown-item">Menú de la Semana</a>
    <a href="/copia-de-entrevistas" class="dropdown-item">Ensayo</a>
    <a href="/copia-de-ensayo-1" class="dropdown-item">Narrativa</a>
    <a href="/post/" class="dropdown-item">Todos los Posts</a>
</div>'
fi

# Menú para OPINIÓN
OPINION_LINE=$(grep -n 'OPINIÓN.*dropdown-arrow.*</span></a></div>' index.html | cut -d: -f1)
if [ ! -z "$OPINION_LINE" ]; then
    echo "Insertando menú OPINIÓN en línea $OPINION_LINE"
    insert_after_line $OPINION_LINE '<div class="dropdown-menu">
    <a href="/copia-de-features" class="dropdown-item">Opinión General</a>
    <a href="/entrevistas-salteadas" class="dropdown-item">Entrevistas</a>
    <a href="/copia-de-ensayo" class="dropdown-item">Reseñas</a>
    <a href="/copia-de-resenas" class="dropdown-item">Listas</a>
</div>'
fi

# Menú para LUCUBRACIONES
LUCUB_LINE=$(grep -n 'LUCUBRACIONES.*dropdown-arrow.*</span></a></div>' index.html | cut -d: -f1)
if [ ! -z "$LUCUB_LINE" ]; then
    echo "Insertando menú LUCUBRACIONES en línea $LUCUB_LINE"
    insert_after_line $LUCUB_LINE '<div class="dropdown-menu">
    <a href="/copia-de-opinion" class="dropdown-item">Lucubraciones</a>
    <a href="/copia-de-narrativa" class="dropdown-item">Poesía</a>
    <a href="/copia-de-entrevistas-salteadas" class="dropdown-item">Retrospectivas</a>
    <a href="/nosotrxs" class="dropdown-item">Nosotrxs</a>
    <a href="/escribe-con-nosotrxs" class="dropdown-item">¡Colabora!</a>
</div>'
fi

echo "✅ Menús dropdown insertados!"
