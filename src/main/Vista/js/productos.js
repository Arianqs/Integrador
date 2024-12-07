const productos = {
    promocional: [
        { id:1, img: '../img/3033.png', nombre: 'COMBO DOS SALADO + 2M&M OL', descripcion: '1 Canchita Gigante (Salada) + 2 Bebida (32oz) + 2 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 30.00 },
        { id:2, img: '3034.png', nombre: 'COMBO DOS DULCE + 2M&M OL', descripcion: '1 Canchita Grande (Dulce) + 2 Bebida (32oz) + 2 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 20.00 },
        { id:3, img: '3035.png', nombre: 'COMBO DOS MIX + 2M&M OL', descripcion: '1 Canchita Gigante (Mix) + 2 Bebida (32oz) + 2 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill ', precio: 35.00 },
        { id:4 , img: '3036.png', nombre: 'COMBO UNO SALADO + M&M OL', descripcion: '1 Canchita Grande (Salada) + 1 Bebida (32oz) + 1 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 35.00 },
        { id:5 , img: '3037.png', nombre: 'COMBO UNO DULCE + M&M OL', descripcion: '1 Canchita Grande (Dulce) + 1 Bebida (32oz) + 1 M&Ms. *Sabor bebida y M&Ms sujeto a stock / canchita sin refill', precio: 35.00 },
		{ id:6 , img: '2799.jpg', nombre: 'COMBO 2 SALADO + 2 DUOMÁX OL', descripcion: '1 Canchita Gigante (Salado) + 2 Bebidas (32oz) + 2 DUOMÁX. *Sabor bebida sujeto a stock / canchita sin refill', precio: 30.00 }
    ],
    cancha: [
        { id:7 , img: 'promo1.jpg', nombre: 'Promo 1', descripcion: 'Descripción promo 1', precio: 30.00 },
        { id:8 , img: 'promo2.jpg', nombre: 'Promo 2', descripcion: 'Descripción promo 2', precio: 35.00 }
    ],
    combos: [
        { id:9 , img: 'combo1.jpg', nombre: 'Combo Salado', descripcion: 'Canchita + Bebida', precio: 47.00 },
        { id:10 , img: 'combo2.jpg', nombre: 'Combo Dulce', descripcion: 'Canchita + Gaseosa', precio: 40.00 }
    ],
    bebidas: [
        { id:11 ,img: 'bebida1.jpg', nombre: 'Gaseosa', descripcion: 'Bebida de 32oz', precio: 10.00 }
    ],
    golosinas: [
        { id:12 ,img: 'golosina1.jpg', nombre: 'Chocolates', descripcion: 'Bolsa de chocolates', precio: 12.00 }
    ]
};

const productosSeleccionados = {
    promocional: [],
    cancha: [],
    combos: [],
    bebidas: [],
    golosinas: []
};

let total = 0;
let cantidadTotalProductos = 0;

// Inicializar arrays de cantidades para cada categoría
Object.keys(productos).forEach(categoria => {
    productosSeleccionados[categoria] = new Array(productos[categoria].length).fill(0);
});

function mostrarProductos(categoria) {
    const container = document.getElementById('products-grid');
    container.innerHTML = "";

    productos[categoria].forEach((producto, index) => {
        const productCard = document.createElement("div");
        productCard.className = "product-card";

        const cantidadGuardada = productosSeleccionados[categoria][index];

        productCard.innerHTML = `
            <img src="${producto.img}" alt="${producto.nombre}" class="product-img">
            <h2>${producto.nombre}</h2>
            <p>${producto.descripcion}</p>
            <p class="price">S/${producto.precio.toFixed(2)}</p>
            <div class="quantity-selector">
                <button onclick="actualizarCantidad('${categoria}', ${index}, -1)">-</button>
                <span id="${categoria}-cantidad-${index}">${cantidadGuardada}</span>
                <button onclick="actualizarCantidad('${categoria}', ${index}, 1)">+</button>
            </div>
        `;

        container.appendChild(productCard);
    });
}

function actualizarCantidad(categoria, index, cambio) {
    const cantidadElemento = document.getElementById(`${categoria}-cantidad-${index}`);
    let cantidadActual = parseInt(cantidadElemento.textContent) || 0;
    
    let nuevaCantidad = Math.max(0, cantidadActual + cambio);
    productosSeleccionados[categoria][index] = nuevaCantidad;
    cantidadElemento.textContent = nuevaCantidad;
    
    actualizarTotales();
}

function actualizarTotales() {
    let nuevoTotal = 0;
    let nuevaCantidadTotal = 0;

    Object.keys(productosSeleccionados).forEach(categoria => {
        productosSeleccionados[categoria].forEach((cantidad, index) => {
            if (cantidad > 0 && productos[categoria][index]) {
                nuevaCantidadTotal += cantidad;
                nuevoTotal += cantidad * productos[categoria][index].precio;
            }
        });
    });

    let totalSection = document.getElementById("total-section");
    if (!totalSection) {
        totalSection = document.createElement('div');
        totalSection.className = 'total-section';
        totalSection.id = 'total-section';
        totalSection.innerHTML = `
            <p>Dulcería: <span id="cantidad-total">0</span></p>
            <p id="total-value">Total: S/0.00</p>
        `;
        document.body.appendChild(totalSection);
    }

    document.getElementById("cantidad-total").textContent = nuevaCantidadTotal;
    document.getElementById("total-value").textContent = `Total: S/${nuevoTotal.toFixed(2)}`;
    
    let btnContainer = document.querySelector('.btn-continuar');
    if (!btnContainer) {
        btnContainer = document.createElement('div');
        btnContainer.className = 'btn-continuar';
        document.body.appendChild(btnContainer);
    }

    let continuarBtn = document.getElementById("continuar-btn");
    if (!continuarBtn) {
        continuarBtn = document.createElement('button');
        continuarBtn.id = "continuar-btn";
        continuarBtn.textContent = "Continuar";
        continuarBtn.onclick = continuarCompra;
        btnContainer.appendChild(continuarBtn);
    }

    continuarBtn.disabled = nuevaCantidadTotal === 0;
    continuarBtn.classList.toggle('active', nuevaCantidadTotal > 0);
    totalSection.style.display = nuevaCantidadTotal > 0 ? 'block' : 'none';
}

function obtenerProductosSeleccionados() {
    const productosParaEnviar = [];
    
    Object.keys(productosSeleccionados).forEach(categoria => {
        productosSeleccionados[categoria].forEach((cantidad, index) => {
            if (cantidad > 0 && productos[categoria][index]) {
                const producto = productos[categoria][index];
                productosParaEnviar.push({
                    id: producto.id,
                    nombre: producto.nombre,
                    cantidad: cantidad,
                    precio: producto.precio,
                    categoria: categoria  // Añadimos la categoría para mejor seguimiento
                });
            }
        });
    });
    
    return productosParaEnviar;
}

function continuarCompra() {
    try {
        const productosParaEnviar = obtenerProductosSeleccionados();
        
        if (productosParaEnviar.length === 0) {
            alert('Por favor seleccione al menos un producto antes de continuar.');
            return;
        }

        let total = productosParaEnviar.reduce((sum, item) => sum + (item.precio * item.cantidad), 0);
        
        // Crear objeto de datos
        const datosCompra = {
            total: total.toFixed(2),
            productos: productosParaEnviar
        };

        // Convertir a string y codificar
        const datosString = encodeURIComponent(JSON.stringify(datosCompra));
        
        // Redirigir con los datos
        window.location.href = `confirmarCompra.jsp?datos=${datosString}`;
    } catch (error) {
        console.error('Error al procesar la compra:', error);
        alert('Hubo un error al procesar su compra. Por favor intente nuevamente.');
    }
}

function showCategory(categoria) {
    if (productos[categoria]) {
        mostrarProductos(categoria);
    } else {
        console.error(`Categoría ${categoria} no encontrada.`);
    }
}

// Inicializar mostrando productos promocionales
mostrarProductos('promocional');