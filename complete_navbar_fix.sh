#!/bin/bash

echo "🔧 Creando navbar con menús dropdown..."

# Crear backup
cp index.html index.html.backup.$(date +%Y%m%d_%H%M%S)
echo "✅ Backup creado"

# 1. Agregar CSS para dropdown
sed -i '/#comp-j7afc664{width:251px;height:auto;}/a\
\
/* Dropdown Menu Styles */\
.dropdown-menu {\
    position: absolute;\
    top: 100%;\
    left: 0;\
    background: white;\
    min-width: 200px;\
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);\
    border-radius: 8px;\
    opacity: 0;\
    visibility: hidden;\
    transform: translateY(-10px);\
    transition: all 0.3s ease;\
    z-index: 1000;\
    padding: 10px 0;\
}\
\
.dropdown-container {\
    position: relative;\
    display: inline-block;\
}\
\
.dropdown-container:hover .dropdown-menu {\
    opacity: 1;\
    visibility: visible;\
    transform: translateY(0);\
}\
\
.dropdown-item {\
    display: block;\
    padding: 12px 20px;\
    color: #333;\
    text-decoration: none;\
    font-size: 14px;\
    transition: background 0.2s;\
    border-bottom: 1px solid #f0f0f0;\
}\
\
.dropdown-item:last-child {\
    border-bottom: none;\
}\
\
.dropdown-item:hover {\
    background: #f8f9fa;\
    color: #000;\
}\
\
.dropdown-arrow {\
    font-size: 12px;\
    margin-left: 5px;\
    transition: transform 0.3s ease;\
}\
\
.dropdown-container:hover .dropdown-arrow {\
    transform: rotate(180deg);\
}' index.html

# 2. Modificar clases de contenedores
echo "📝 Modificando clases de contenedores..."
sed -i 's|class="comp-kdwj0q6d FubTgk"|class="dropdown-container comp-kdwj0q6d FubTgk"|g' index.html
sed -i 's|class="comp-k9n5svcw FubTgk"|class="dropdown-container comp-k9n5svcw FubTgk"|g' index.html
sed -i 's|class="comp-k9oa8w3r FubTgk"|class="dropdown-container comp-k9oa8w3r FubTgk"|g' index.html
sed -i 's|class="comp-k9pp92ue FubTgk"|class="dropdown-container comp-k9pp92ue FubTgk"|g' index.html

# 3. Agregar flechitas
echo "📝 Agregando flechitas dropdown..."
sed -i 's|<span class="l7_2fn wixui-button__label">NÚMEROS</span>|<span class="l7_2fn wixui-button__label">NÚMEROS <span class="dropdown-arrow">▼</span></span>|g' index.html
sed -i 's|<span class="l7_2fn wixui-button__label">FEATURES</span>|<span class="l7_2fn wixui-button__label">FEATURES <span class="dropdown-arrow">▼</span></span>|g' index.html
sed -i 's|<span class="l7_2fn wixui-button__label">OPINIÓN</span>|<span class="l7_2fn wixui-button__label">OPINIÓN <span class="dropdown-arrow">▼</span></span>|g' index.html
sed -i 's|<span class="l7_2fn wixui-button__label">LUCUBRACIONES</span>|<span class="l7_2fn wixui-button__label">LUCUBRACIONES <span class="dropdown-arrow">▼</span></span>|g' index.html

echo "✅ Modificaciones básicas completadas"
echo "📄 Se creó un backup en: index.html.backup.$(date +%Y%m%d_%H%M%S)"
echo ""
echo "⚠️  NOTA: Los menús dropdown deben agregarse manualmente al HTML"
echo "   Ya que sed no puede manejar inserciones complejas de múltiples líneas"
echo ""
echo "🔍 Para verificar los cambios:"
echo "   git diff index.html"
