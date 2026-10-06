# Proyecto Flutter - DAM2 26/27 🎓

**Proyecto académico** desarrollado como parte del ciclo formativo de Desarrollo de Aplicaciones Multiplataforma (DAM).

## 📝 Descripción
Esta aplicación es un proyecto desarrollado en **Flutter** y **Dart** para aprender y poner en práctica el desarrollo de aplicaciones móviles multiplataforma, integrando servicios en la nube a través de **Firebase**.

## ✨ Características Principales
* **Autenticación**: Registro e inicio de sesión con correo electrónico, contraseña y Google Sign-In.
* **Gestión de Perfil**: Creación y edición de perfiles de usuario, incluyendo la selección y subida de avatares comprimidos utilizando Firebase Storage.
* **Mensajería en Tiempo Real**: Sistema de chat y comunicación en tiempo real utilizando Firebase Cloud Firestore.
* **Interfaz de Usuario Personalizada**: Implementación de temas propios (`AppTheme`), barras de navegación animadas y validación de formularios.
* **Flujo de Onboarding**: Pantalla de carga ("Splash Screen") inteligente que verifica el estado de sesión del usuario antes de redirigirlo a la aplicación o al login.

## 🛠️ Tecnologías y Librerías Utilizadas
* **Framework**: [Flutter](https://flutter.dev/) (Dart)
* **Backend as a Service (BaaS)**: [Firebase](https://firebase.google.com/)
  * Firebase Authentication
  * Cloud Firestore
  * Firebase Storage
* **Paquetes destacados**:
  * `google_sign_in`: Para el inicio de sesión con cuentas de Google.
  * `flutter_image_compress` & `image_picker`: Para la captura y optimización de imágenes de perfil.
  * `animated_bottom_navigation_bar`: Para menús de navegación modernos.

## ⚙️ Instalación y Uso
Para ejecutar este proyecto en un entorno local, asegúrate de tener Flutter instalado y configurar tu propio proyecto de Firebase:

1. Clona el repositorio en tu equipo.
2. Descarga las dependencias del proyecto:
   ```bash
   flutter pub get
   ```
3. Configura las credenciales de Firebase usando [FlutterFire CLI](https://firebase.flutter.dev/docs/cli/):
   ```bash
   flutterfire configure
   ```
4. Ejecuta la aplicación en un emulador o dispositivo físico:
   ```bash
   flutter run
   ```

---
*Proyecto desarrollado durante el curso 2026/2027.*