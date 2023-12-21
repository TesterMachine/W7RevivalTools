# W7RevivalTools
![banner](https://github.com/TesterMachine/W7RevivalTools/blob/main/Assets/images/banner.png)

## English:
Tools and Utilities to keep Windows 7 running.

**Welcome.**

_Windows 7 is currently being abandoned by many users, this due to the lack of compatibility with current programs 2023-2024, Microsoft already announced the [end of support for Windows 7](https://support.microsoft.com/en-us/windows/windows-7-support-ended-on-january-14-2020-b75d4580-2cc7-895a-2c9c-1466d9a53962) on January 14, 2020, but it continued to work and receive updates thanks to the ESU (Extended Security Updates) updates but it has been announced the end of these updates and the [life cycle of Windows 7](https://learn.microsoft.com/en-us/lifecycle/products/windows-7) on January 10, 2023 by microsoft._

_Many programs and online services are abandoning Windows 7 one of them is [Google Drive](https://support.google.com/drive/thread/191968670/windows-7-will-not-be-supported-as-of-feb-does-this-mean-google-drive-will-no-longer-work-on-win-7?hl=en#:~:text=Google%20Drive%20will%20not%20be,may%20not%20work%20at%20all.) for Windows 7 and also the problem with the root certificates that are expiring._

_when not receiving updates in the root certificates, the system cannot access the internet correctly, showing errors of “The date and time are not correct” when trying to enter your preferred websites._

**Windows 7 can still be used today, as there is still software that is compatible with Windows 7 and some developers have not abandoned it yet.**

The current problems with Windows 7 regarding web browsing in its entirety are because the root certificates are not updated and also because there are no compatible browsers or the developers do not provide the version compatible with Windows 7.

For this there is already a solution.

To make Windows 7 work properly with several current programs and browsers, you have to meet certain requirements:

Have the system updated: it is necessary that Windows 7 has the latest updates because they include the most important ones such as the support of SHA-2 which is required in several programs and browsers, If your system is not updated you can use [SimplixUpdatePack7R2](https://blog.simplix.info/updatepack7r2/) which provides the latest updates free of junk such as telemetry and unnecessary processor checks.

Have internet connection: it is necessary to have internet connection so as to update the root certificates and also be able to browse on the web (obviously).

Have installed [Visual C++](https://github.com/abbodi1406/vcredist/releases/latest), [DirectX](https://github.com/stdin82/htfx/releases/download/v0.0.2/DirectX_Redist_Repack_x86_x64.zip) and [Net Framework 4.8](https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe) All at their latest available version. (You can download and install them by clicking on the names of each program and they will take you to the download link).

Once having in mind these requirements you can perform the following actions:

* To update the certificates go to [Root Certs](https://github.com/TesterMachine/W7RevivalTools/tree/main/Root%20Certs) and follow the instructions to update the certificates automatically, using tools that will allow you to update the certificates using the Windows Update server.

* For Web Browsers Compatible with Windows 7 go to [Browsers](https://github.com/TesterMachine/W7RevivalTools/tree/main/Browsers) where the list of browsers compatible with Windows 7 + the download link from their official site or github repository is shared.

If you are not an expert user you can use instead the [Win7 Revival Tool Script](https://github.com/TesterMachine/W7RevivalTools/releases/latest), a batch script that you only have to select what you want to do update root certificates or Install Compatible Browsers.

## Español:
Herramientas y Utilidades para mantener en funcionamiento Windows 7.

**Bienvenido.** 

_Windows 7 Actualmente esta siendo ya abandonado por muchos usuarios, esto por la falta de compatibilidad con Programas Actuales 2023-2024, Microsoft ya anuncio el [fin de soporte para Windows 7](https://support.microsoft.com/es-es/windows/el-soporte-de-windows-7-finalizó-el-14-de-enero-de-2020-b75d4580-2cc7-895a-2c9c-1466d9a53962) el 14 de enero del 2020, pero continuaba funcionando y recibiendo actualizaciones gracias a las actualizaciones ESU (Actualizaciones De Seguridad Extendidas) pero ya ha sido anunciado el fin de estas actualizaciones y el [ciclo de vida de Windows 7](https://learn.microsoft.com/es-es/lifecycle/products/windows-7) el 10 de enero del 2023 por parte de microsoft._

_Ya muchos programas y servicios Online estan abandonando Windows 7 uno de ellos es [Google Drive](https://support.google.com/drive/thread/191968670/windows-7-will-not-be-supported-as-of-feb-does-this-mean-google-drive-will-no-longer-work-on-win-7?hl=en#:~:text=Google%20Drive%20will%20not%20be,may%20not%20work%20at%20all.) para Windows 7 y tambien la falla con los certificados raiz que estan siendo caducados._

_al no recibir actualizaciones en los certificados raiz, el sistema no logra acceder correctamente a internet, mostrando errores de "La fecha y hora no es correcta" al querer ingresar a los sitios web de tu preferencia._

**Windows 7 se puede seguir usando actualmente, ya que aun hay software que es compatible con Windows 7 y algunos desarrolladores no lo abandonan aun.**

_Los problemas actuales con Windows 7 referentes a la navegacion web en su totalidad son por que los certificados raiz no estan actualizados y tambien por no haber navegadores compatibles o que los desarrolladores no proporcionan la version compatible con Windows 7._

_Para esto existe ya una solucion._

Para que Windows 7 pueda seguir funcionando correctamente con varios programas actuales y navegadores hay que cumplir ciertos requisitos:

*	Tener el sistema actualizado: es necesario que Windows 7 tenga las últimas actualizaciones ya que se incluyen las más importantes como el soporte de SHA-2 que es requerido en varios programas y navegadores, Si tu sistema no está actualizado puedes usar [SimplixUpdatePack7R2](https://blog.simplix.info/updatepack7r2/) el cual proporciona las actualizaciones más recientes libres de basura como telemetría y verificaciones innecesarias de procesador.

* Tener conexión a internet: es necesario tener conexión a internet para así actualizar los certificados raíz y también poder navegar en la web (obviamente).

* Tener Instalado los [Visual C++](https://github.com/abbodi1406/vcredist/releases/latest), [DirectX](https://github.com/stdin82/htfx/releases/download/v0.0.2/DirectX_Redist_Repack_x86_x64.zip) y [Net Framework 4.8](https://download.visualstudio.microsoft.com/download/pr/2d6bb6b2-226a-4baa-bdec-798822606ff1/8494001c276a4b96804cde7829c04d7f/ndp48-x86-x64-allos-enu.exe) Todos a su última versión disponible. _(Puedes descargarlos e instalarlos dando clic en los nombres de cada programa y te llevaran al link de descarga)._

Una vez teniendo en cuenta estos requisitos puedes realizar las siguientes acciones:


* Para Actualizar los certificados dirigete a [Root Certs](https://github.com/TesterMachine/W7RevivalTools/tree/main/Root%20Certs) y sigue las instrucciones para actualizar los certificados de forma automatica, usando herramientas que permitiran actualizar los certificados usando el servidor de Windows Update.

* Para los Navegadores Web Compatibles con Windows 7 dirigete a [Browsers](https://github.com/TesterMachine/W7RevivalTools/tree/main/Browsers) donde se comparten la lista de navegadores compatibles con Windows 7 + el link de descarga desde su sitio oficial o repositorio github.

_Si no eres un usuario experto puedes usar en su lugar el script [Win7 Revival Tool Script](https://github.com/TesterMachine/W7RevivalTools/releases/latest), un script batch que solo debes selecionar lo que quieras hacer; actualizar certificados raiz o Instalar Navegadores Compatibles._
