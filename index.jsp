<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PlayStation Universe - Iniciar Sesión</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
        }

        /* --- PANTALLA DE LOGIN ESTILO FACEBOOK (DOS COLUMNAS) --- */
        #login-view {
            background-color: #f0f2f5;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.5rem;
        }

        .fb-container {
            max-width: 1050px;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 2.5rem;
        }

        .fb-left {
            flex: 1.3;
        }

        /* Imagen del login más grande y con mejor proporción */
        .login-logo-img {
            max-width: 460px;
            width: 100%;
            height: 250px;
            display: block;
            margin-bottom: 0.8rem;
            object-fit: contain;
            object-position: left center;
            transition: opacity 0.5s ease-in-out;
        }

        .fb-tagline {
            font-size: 1.6rem;
            color: #1c1e21;
            line-height: 1.3;
            margin-top: 0.5rem;
            font-weight: 400;
        }

        .fb-right {
            flex: 0.9;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .fb-card {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1), 0 8px 16px rgba(0, 0, 0, 0.1);
            padding: 1.2rem;
            width: 100%;
            max-width: 396px;
            display: flex;
            flex-direction: column;
            gap: 0.9rem;
        }

        .fb-input {
            width: 100%;
            padding: 14px 16px;
            font-size: 1rem;
            border-radius: 6px;
            border: 1px solid #dddfe2;
            outline: none;
            color: #1c1e21;
            transition: border-color 0.2s, box-shadow 0.2s;
        }

        .fb-input:focus {
            border-color: #0070d1;
            box-shadow: 0 0 0 2px #e7f3ff;
        }

        .btn-fb-login {
            background-color: #0070d1;
            border: none;
            border-radius: 6px;
            font-size: 1.2rem;
            padding: 12px;
            font-weight: 700;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.2s, transform 0.1s;
        }

        .btn-fb-login:hover {
            background-color: #005fb3;
        }

        .btn-fb-login:active {
            transform: scale(0.98);
        }

        .fb-forgot {
            color: #0070d1;
            font-size: 0.9rem;
            text-align: center;
            text-decoration: none;
            font-weight: 500;
            margin: 0.2rem 0;
        }

        .fb-forgot:hover {
            text-decoration: underline;
        }

        .fb-divider {
            border-bottom: 1px solid #dadde1;
            margin: 0.5rem 0;
        }

        .btn-fb-create {
            background-color: #42b72a;
            border: none;
            border-radius: 6px;
            font-size: 1.05rem;
            padding: 12px 16px;
            font-weight: 700;
            color: #ffffff;
            cursor: pointer;
            width: fit-content;
            margin: 0 auto;
            transition: background-color 0.2s, transform 0.1s;
        }

        .btn-fb-create:hover {
            background-color: #36a420;
        }

        .btn-fb-create:active {
            transform: scale(0.98);
        }

        .fb-subtext {
            font-size: 0.85rem;
            color: #1c1e21;
            margin-top: 1.8rem;
            text-align: center;
        }

        /* --- TIENDA PLAYSTATION --- */
        #store-view {
            display: none;
            background-color: #0b0e14;
            color: #cbd5e1;
            flex-direction: column;
            min-height: 100vh;
        }

        nav {
            background-color: #05070a;
            padding: 0.6rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #1e293b;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .nav-logo {
            font-weight: 800;
            font-size: 1.1rem;
            color: #ffffff;
            letter-spacing: 1px;
            cursor: pointer;
        }

        .nav-links {
            list-style: none;
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }

        .nav-links a {
            color: #94a3b8;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: background-color 0.2s, color 0.2s;
            display: inline-block;
        }

        .nav-links a:hover {
            background-color: #1e293b;
            color: #ffffff;
        }

        .nav-links a.active {
            background-color: #162032;
            color: #38bdf8;
        }

        .btn-logout {
            background: transparent;
            color: #ef4444;
            border: 1px solid #ef4444;
            padding: 0.4rem 0.8rem;
            font-size: 0.85rem;
            font-weight: 600;
            border-radius: 6px;
            cursor: pointer;
            margin-left: 0.5rem;
            transition: background 0.2s, color 0.2s;
        }

        .btn-logout:hover {
            background: #ef4444;
            color: white;
        }

        header {
            background: linear-gradient(180deg, #003791, #001e50);
            color: #ffffff;
            padding: 2.5rem 1rem;
            text-align: center;
            border-bottom: 3px solid #0070d1;
        }

        header h1 {
            font-size: 2.2rem;
            letter-spacing: 3px;
            text-transform: uppercase;
            font-weight: 800;
        }

        header p {
            font-size: 0.95rem;
            color: #93c5fd;
            margin-top: 0.5rem;
        }

        .ps-icons {
            margin-top: 0.8rem;
            font-size: 1.1rem;
            letter-spacing: 10px;
            color: #ffffff;
        }

        .layout-principal {
            max-width: 1250px;
            width: 95%;
            margin: 2rem auto;
            display: flex;
            gap: 1.5rem;
            flex: 1;
            align-items: flex-start;
        }

        .catalogo {
            flex: 2.8;
        }

        .card {
            background: #10141d;
            padding: 1.8rem;
            border-radius: 10px;
            border: 1px solid #1e293b;
            margin-bottom: 1.5rem;
        }

        h2 {
            color: #38bdf8;
            margin-bottom: 0.8rem;
            font-size: 1.25rem;
            font-weight: bold;
        }

        .games-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 1.2rem;
            margin-top: 1rem;
        }

        .game-item {
            background-color: #161c28;
            border: 1px solid #1e293b;
            padding: 1rem;
            border-radius: 10px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.25s ease, background-color 0.25s ease;
        }

        .game-item:hover {
            transform: translateY(-4px);
            background-color: #1a2232;
        }

        .img-container {
            width: 100%;
            height: 140px;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 0.8rem;
            border: 1px solid #212b3d;
            background-color: #0b0e14;
        }

        .game-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.4s cubic-bezier(0.25, 1, 0.5, 1);
        }

        .game-item:hover .game-img {
            transform: scale(1.08);
        }

        .genre {
            display: inline-block;
            background: #004fb0;
            color: #ffffff;
            font-size: 0.7rem;
            font-weight: 700;
            padding: 0.2rem 0.5rem;
            border-radius: 4px;
            margin-bottom: 0.6rem;
            text-transform: uppercase;
            width: fit-content;
        }

        .game-item h3 {
            font-size: 1.05rem;
            color: #ffffff;
            margin-bottom: 0.4rem;
        }

        .game-item p {
            font-size: 0.85rem;
            color: #94a3b8;
            margin-bottom: 0.8rem;
            line-height: 1.4;
        }

        .precio-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: auto;
            padding-top: 0.5rem;
            border-top: 1px solid #212b3d;
        }

        .precio {
            color: #38bdf8;
            font-weight: bold;
            font-size: 1.05rem;
        }

        .btn-agregar {
            background-color: #0070d1;
            color: white;
            border: none;
            padding: 0.45rem 0.9rem;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.8rem;
            font-weight: bold;
            transition: background 0.2s, transform 0.1s;
        }

        .btn-agregar:hover {
            background-color: #0056a3;
        }

        .btn-agregar:active {
            transform: scale(0.94);
        }

        .panel-lateral {
            flex: 1.2;
            background-color: #10141d;
            padding: 1.5rem;
            border-radius: 10px;
            border: 1px solid #1e293b;
            position: sticky;
            top: 4.5rem;
        }

        .panel-lateral h2 {
            border-bottom: 1px solid #1e293b;
            padding-bottom: 0.5rem;
            font-size: 1.1rem;
        }

        .lista-compras {
            list-style: none;
            max-height: 220px;
            overflow-y: auto;
            margin: 1rem 0;
        }

        .item-carrito {
            display: flex;
            justify-content: space-between;
            font-size: 0.85rem;
            padding: 0.55rem 0.4rem;
            border-bottom: 1px solid #1e293b;
            color: #e2e8f0;
            animation: slideIn 0.25s ease forwards;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-10px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .total-box {
            display: flex;
            justify-content: space-between;
            font-size: 1.1rem;
            font-weight: bold;
            color: #ffffff;
            margin-bottom: 1rem;
        }

        .btn-comprar {
            width: 100%;
            background-color: #059669;
            color: white;
            border: none;
            padding: 0.75rem;
            font-size: 0.95rem;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.2s, transform 0.1s;
        }

        .btn-comprar:hover {
            background-color: #047857;
        }

        .btn-comprar:active {
            transform: scale(0.97);
        }

        .btn-vaciar {
            width: 100%;
            background: transparent;
            color: #94a3b8;
            border: 1px solid #1e293b;
            padding: 0.45rem;
            margin-top: 0.5rem;
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.8rem;
            transition: background 0.2s, color 0.2s;
        }

        .btn-vaciar:hover {
            color: #ef4444;
            background-color: rgba(239, 68, 68, 0.08);
            border-color: #ef4444;
        }

        footer {
            background-color: #05070a;
            color: #64748b;
            text-align: center;
            padding: 1.2rem;
            font-size: 0.85rem;
            border-top: 1px solid #1e293b;
        }

        @media (max-width: 900px) {
            .fb-container {
                flex-direction: column;
                text-align: center;
            }
            .fb-left {
                margin-bottom: 1.5rem;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .login-logo-img {
                object-position: center;
                height: 200px;
            }
            .layout-principal {
                flex-direction: column;
            }
            .panel-lateral {
                width: 100%;
                position: static;
            }
        }
    </style>
</head>
<body>

    <!-- 1. LOGIN ESTILO FACEBOOK CON IMAGEN GRANDE EN CARRUSEL -->
    <div id="login-view">
        <div class="fb-container">
            <div class="fb-left">
                <img id="loginLogoSlider" src="IMG/PS_STORE.png" alt="PlayStation Store" class="login-logo-img">
                <p class="fb-tagline">Con&eacute;ctate con tus amigos y el universo gaming desde tu cuenta.</p>
            </div>
            <div class="fb-right">
                <form class="fb-card" onsubmit="iniciarSesion(event)">
                    <input type="text" id="loginUser" class="fb-input" placeholder="Correo electr&oacute;nico o tel&eacute;fono" required>
                    <input type="password" id="loginPass" class="fb-input" placeholder="Contrase&ntilde;a" required>
                    <button type="submit" class="btn-fb-login">Iniciar sesi&oacute;n</button>
                    <a href="#" class="fb-forgot" onclick="alert('Ingresa cualquier credencial para acceder.')">¿Olvidaste tu contrase&ntilde;a?</a>
                    <div class="fb-divider"></div>
                    <button type="button" class="btn-fb-create" onclick="alert('Función de registro demostrativa.')">Crear cuenta nueva</button>
                </form>
            </div>
        </div>
    </div>

    <!-- 2. VISTA DE LA TIENDA (CATÁLOGO COMPLETO DE 6 JUEGOS) -->
    <div id="store-view">
        <!-- NAVEGACIÓN -->
        <nav>
            <div class="nav-logo">PS STORE</div>
            <ul class="nav-links">
                <li><a href="#" class="active">Inicio</a></li>
                <li><a href="#">Productos</a></li>
                <li><a href="#">Consolas</a></li>
                <li><a href="#">Ofertas</a></li>
                <li><button class="btn-logout" onclick="cerrarSesion()">Cerrar Sesi&oacute;n</button></li>
            </ul>
        </nav>

        <!-- ENCABEZADO -->
        <header>
            <h1>PlayStation Universe</h1>
            <p>Los mejores t&iacute;tulos y exclusivos de la consola</p>
            <div class="ps-icons">&#9650; &#9679; &#10006; &#9632;</div>
        </header>

        <!-- CONTENEDOR PRINCIPAL -->
        <div class="layout-principal">
            
            <!-- CATALOGO -->
            <main class="catalogo">
                <div class="card">
                    <h2>Experiencia de Nueva Generaci&oacute;n</h2>
                    <p>Descubre mundos inmersivos, gr&aacute;ficos de alta fidelidad y la tecnolog&iacute;a del mando inal&aacute;mbrico DualSense dise&ntilde;ada para llevar el juego a otro nivel.</p>
                </div>

                <div class="card">
                    <h2>T&iacute;tulos Destacados</h2>
                    <div class="games-grid">
                        
                        <!-- 1. God of War -->
                        <div class="game-item">
                            <div>
                                <div class="img-container">
                                    <img class="game-img" src="IMG/GOD.jpg" alt="God of War Ragnarok">
                                </div>
                                <span class="genre">Acci&oacute;n / Aventura</span>
                                <h3>God of War Ragnar&ouml;k</h3>
                                <p>Acompa&ntilde;a a Kratos y Atreus en un viaje m&iacute;tico a trav&eacute;s de los Nueve Reinos.</p>
                            </div>
                            <div class="precio-box">
                                <span class="precio">S/ 249.00</span>
                                <button class="btn-agregar" onclick="agregarAlCarrito('God of War Ragnarok', 249)">Comprar</button>
                            </div>
                        </div>

                        <!-- 2. Spider-Man 2 -->
                        <div class="game-item">
                            <div>
                                <div class="img-container">
                                    <img class="game-img" src="IMG/SPIDER_2.jpg" alt="Marvel's Spider-Man 2">
                                </div>
                                <span class="genre">Mundo Abierto</span>
                                <h3>Marvel's Spider-Man 2</h3>
                                <p>Balanc&eacute;ate por Nueva York alternando entre Peter Parker y Miles Morales.</p>
                            </div>
                            <div class="precio-box">
                                <span class="precio">S/ 269.00</span>
                                <button class="btn-agregar" onclick="agregarAlCarrito('Spider-Man 2', 269)">Comprar</button>
                            </div>
                        </div>

                        <!-- 3. Horizon Forbidden West -->
                        <div class="game-item">
                            <div>
                                <div class="img-container">
                                    <img class="game-img" src="IMG/HORIZON.jpg" alt="Horizon Forbidden West">
                                </div>
                                <span class="genre">Aventura / Rol</span>
                                <h3>Horizon Forbidden West</h3>
                                <p>Explora tierras lejanas y combate m&aacute;quinas colosales junto a Aloy.</p>
                            </div>
                            <div class="precio-box">
                                <span class="precio">S/ 199.00</span>
                                <button class="btn-agregar" onclick="agregarAlCarrito('Horizon Forbidden West', 199)">Comprar</button>
                            </div>
                        </div>

                        <!-- 4. Gran Turismo 7 -->
                        <div class="game-item">
                            <div>
                                <div class="img-container">
                                    <img class="game-img" src="IMG/GRAN.jpg" alt="Gran Turismo 7">
                                </div>
                                <span class="genre">Simulaci&oacute;n / Carreras</span>
                                <h3>Gran Turismo 7</h3>
                                <p>La m&aacute;xima experiencia de conducci&oacute;n realista con cientos de veh&iacute;culos.</p>
                            </div>
                            <div class="precio-box">
                                <span class="precio">S/ 229.00</span>
                                <button class="btn-agregar" onclick="agregarAlCarrito('Gran Turismo 7', 229)">Comprar</button>
                            </div>
                        </div>

                        <!-- 5. The Last of Us Part I -->
                        <div class="game-item">
                            <div>
                                <div class="img-container">
                                    <img class="game-img" src="IMG/THE.jpg" alt="The Last of Us Part I">
                                </div>
                                <span class="genre">Acci&oacute;n / RPG</span>
                                <h3>The Last of Us Part I</h3>
                                <p>Vive la emotiva historia y los intensos encuentros de supervivencia de Joel y Ellie.</p>
                            </div>
                            <div class="precio-box">
                                <span class="precio">S/ 219.00</span>
                                <button class="btn-agregar" onclick="agregarAlCarrito('The Last of Us Part I', 219)">Comprar</button>
                            </div>
                        </div>

                        <!-- 6. Ghost of Tsushima -->
                        <div class="game-item">
                            <div>
                                <div class="img-container">
                                    <img class="game-img" src="IMG/GHOST.jpg" alt="Ghost of Tsushima">
                                </div>
                                <span class="genre">Acci&oacute;n / Sigilo</span>
                                <h3>Ghost of Tsushima</h3>
                                <p>Forja un nuevo camino como Jin Sakai para liberar a la isla de Tsushima.</p>
                            </div>
                            <div class="precio-box">
                                <span class="precio">S/ 189.00</span>
                                <button class="btn-agregar" onclick="agregarAlCarrito('Ghost of Tsushima', 189)">Comprar</button>
                            </div>
                        </div>

                    </div>
                </div>
            </main>

            <!-- CARRITO LATERAL -->
            <aside class="panel-lateral">
                <h2>Resumen de Compra</h2>
                <ul id="listaCarrito" class="lista-compras">
                    <li style="color: #64748b; font-size: 0.85rem;">No hay juegos seleccionados.</li>
                </ul>

                <div class="total-box">
                    <span>Total:</span>
                    <span id="txtTotal" style="color: #38bdf8;">S/ 0.00</span>
                </div>

                <button class="btn-comprar" onclick="procesarPago()">Confirmar Compra</button>
                <button class="btn-vaciar" onclick="vaciarCarrito()">Limpiar lista</button>
            </aside>
        </div>

        <!-- FOOTER -->
        <footer>
            &copy; 2026 PlayStation Universe &mdash; Proyecto Demostrativo
        </footer>
    </div>

    <!-- LOGICA JAVASCRIPT -->
    <script>
        // --- CAMBIO AUTOMÁTICO DE IMÁGENES DEL LOGIN ---
        const listaImagenesLogin = [
            "IMG/PS_STORE.png",
            "IMG/PSP_1.png",
            "IMG/PS.jpg",
            "IMG/PSP.jpg"
        ];
        let indiceImgActual = 0;
        const imgElemento = document.getElementById("loginLogoSlider");

        setInterval(() => {
            if (document.getElementById("login-view").style.display !== "none") {
                imgElemento.style.opacity = "0"; // Desvanecer
                setTimeout(() => {
                    indiceImgActual = (indiceImgActual + 1) % listaImagenesLogin.length;
                    imgElemento.src = listaImagenesLogin[indiceImgActual];
                    imgElemento.style.opacity = "1"; // Mostrar la nueva imagen
                }, 400);
            }
        }, 3000); // Cambia cada 3 segundos

        // Control de Vistas
        function iniciarSesion(event) {
            event.preventDefault();
            document.getElementById('login-view').style.display = 'none';
            document.getElementById('store-view').style.display = 'flex';
            document.title = "PlayStation Universe - Store";
        }

        function cerrarSesion() {
            document.getElementById('loginUser').value = '';
            document.getElementById('loginPass').value = '';
            document.getElementById('store-view').style.display = 'none';
            document.getElementById('login-view').style.display = 'flex';
            document.title = "PlayStation Universe - Iniciar Sesión";
            vaciarCarrito();
        }

        // Lógica de Carrito
        let carrito = [];
        let total = 0;

        function agregarAlCarrito(nombre, precio) {
            carrito.push({ nombre, precio });
            renderizarCarrito();
        }

        function renderizarCarrito() {
            const lista = document.getElementById('listaCarrito');
            const txtTotal = document.getElementById('txtTotal');

            if (carrito.length === 0) {
                lista.innerHTML = '<li style="color: #64748b; font-size: 0.85rem;">No hay juegos seleccionados.</li>';
                txtTotal.textContent = 'S/ 0.00';
                return;
            }

            lista.innerHTML = '';
            total = 0;

            carrito.forEach(item => {
                total += item.precio;
                const li = document.createElement('li');
                li.className = 'item-carrito';
                li.innerHTML = '<span>' + item.nombre + '</span> <strong>S/ ' + item.precio.toFixed(2) + '</strong>';
                lista.appendChild(li);
            });

            txtTotal.textContent = 'S/ ' + total.toFixed(2);
        }

        function vaciarCarrito() {
            carrito = [];
            renderizarCarrito();
        }

        function procesarPago() {
            if (carrito.length === 0) {
                alert('Selecciona al menos un juego para realizar el pedido.');
                return;
            }
            alert('¡Pedido realizado con exito!\nTotal: S/ ' + total.toFixed(2) + '\n\nGracias por tu compra.');
            vaciarCarrito();
        }
    </script>
</body>
</html>