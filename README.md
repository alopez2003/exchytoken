# Programación de Exchange y token ERC-20 por Alberto López Gutiérrez

Continuando con el Sprint 2, nos adentramos a la programación de una ICO y de una DEX, se me ha hecho sumamente interesante el tema, muchas gracias por el aprendizaje compartido!!!

Si se quiere consultar el Sprint 1, anexo la [liga](https://github.com/alopez2003/solidity1) al mismo

NOTA: Desde que inicié este master, no ha existido un grupo, siempre hemos entregado mis compañeros y yo el trabajo de forma individual, me parece que sólo ha habido un grupo. En mi caso continuaré con la entrega individual. Muchas gracias!!

## Sprint 2

Lo siguiente fue desplegado en un Ubuntu LTS 22.04, lo primero que hice fue instalar Node.js en el ubuntu, recurrí directamente a las herramientas de Ubuntu (APT) donde instale nodejs y también npm. Esto derivado del Sprint 1, continuamos con la misma máquina.

Derivado que en el Sprint 1, sólo ocupamos un sólo contrato "Notarization.sol", y en este desplegaremos dos contratos, fuimos al directorio donde se encuentran los scripts, en mi caso "/home/gethnode2/solidity1/Hardhat/scripts" y creamos dos archivos diferentes a partir del primero, uno con la finalidad de ejecutar el contrato de ICO y otro el contrato de DEX, se les llamó deployico.ts y deploydex.ts respectivamente

![image](https://github.com/alopez2003/exchytoken/assets/67942268/339595d2-9273-44a1-96aa-46e05bb1a7ad)

Y al igual modificamos el contenido de cada uno de los archivos deploy

deployico.ts

![image](https://github.com/alopez2003/exchytoken/assets/67942268/26006634-ed2e-4391-a828-52dd07924f60)

deploydex.ts

![image](https://github.com/alopez2003/exchytoken/assets/67942268/cd3456bd-ec63-4f30-82be-9e039a9cf612)


### Implementación de un nuevo token (Initial Coin Offering, ICO)

Tal y como vimos, derivado del archivo de deploy "deployICO.ts" hace una llamada hacia los Smart Contracts, mismos que podemos ver en este mismo GitHub.

Comenzaremos con el llamado "ICO.sol", donde lo que hacemos, es mintear, o lanzar un nuevo token, en este caso uno llamado "Chilango" y que tendrá como abreviatura "CHIL", para esto modificamos el archivo "ICO.sol" que sacamos de la documentación de Open Zeppelin, y que con la revisión en clase, pudimos ver su ejecución.

![image](https://github.com/alopez2003/exchytoken/assets/67942268/e6572033-ef90-4979-a553-ff5bed6fddbf)

Se planea hacer la ejecución sobre la red testnet de BNB, por lo que primero invocaremos sobre Hardhat un clean y luego un compile

![image](https://github.com/alopez2003/exchytoken/assets/67942268/13f4402d-f7c6-4404-8efa-5d829c2f5bae)

_NOTA: Aprendí a la mala que los nombres de los contratos invocados deben ser iguales a los que se invocan en el script, compilaba el Hardhat pero al momento de llamar al deploy marcaba un error HH700 :D_

#### Mint

Podemos ver que fue creado el contrato en el BSC Scan haciendo la búsqueda por la address pública 0xb62806e9Ae935d616C983374FfC91903C719a5D1, que es a la que le estamos desplegando el contrato, y vemos que fue creado hace pocos minutos.

![image](https://github.com/alopez2003/exchytoken/assets/67942268/4a8a35c6-6615-49b6-a58f-8492a4de3a77)

anexo la liga del address y del contrato

Address:
https://testnet.bscscan.com/address/0xb62806e9Ae935d616C983374FfC91903C719a5D1

Transacción:
https://testnet.bscscan.com/tx/0x99e9a7f1d721cd8d5f5032217458d3c635ae5169647bd005fc46434692df2b2d

Contrato:
https://testnet.bscscan.com/token/0x96665d6e7c49a6285123fecf0db3b9f6a010605f?a=0xb62806e9ae935d616c983374ffc91903c719a5d1

Para agregar a Metamask, vemos inicialmente que tenemos BNB de pruebas en la cuenta, pero no tenemos el token

.![image](https://github.com/alopez2003/exchytoken/assets/67942268/a6285d1a-d466-4412-96d7-c533531fd94e)

Lo que hacemos es introducir manualmente el token con el número de contrato

![image](https://github.com/alopez2003/exchytoken/assets/67942268/0add7718-9531-42af-8c29-7c4921683829)

Vemos que la dirección tiene algunos tokens, vamos a agregar más

![image](https://github.com/alopez2003/exchytoken/assets/67942268/802324cf-203b-424e-86a6-7a668f6cd92c)


![image](https://github.com/alopez2003/exchytoken/assets/67942268/d5f0303f-853f-4c1a-ae4e-e65579dce30f)

Vemos un tercer contrato desplegado

![image](https://github.com/alopez2003/exchytoken/assets/67942268/5ea133fe-f470-4684-94a7-4036909414df)

Importamos con el nuevo contrato

![image](https://github.com/alopez2003/exchytoken/assets/67942268/80931650-2262-4561-8785-aabac9084702)

y listo, vemos 10,000,000 de tokens de CHIL

![image](https://github.com/alopez2003/exchytoken/assets/67942268/7c2a9bec-3f75-4bdb-bcd5-0ce592193bef)



### Verificación

Si revisamos el BSC Scan del contrato, podremos ver que está en bytecode, entonces procederemos a verificar el contrato

https://testnet.bscscan.com/address/0x89313f72f28c104130a33ae1be3cabab32e7353f#code


Si vamos a la revisión del archivo "hardhat.config.ts" vemos que tiene la versión del compilador 0.8.1

![image](https://github.com/alopez2003/exchytoken/assets/67942268/7210f96e-1d83-4191-a624-271ccbb665a9)

Sin embargo tenemos dependencias en el código, entonces ocupamos la función de Hardhat "npx hardhat flatten" y nos regresa un código ya integrado:

![image](https://github.com/alopez2003/exchytoken/assets/67942268/d868bb70-70c3-4589-aeb4-4253ae02beda)

Y ese archivo será el que subamos a la plataforma

Primero damos click en Verify and Publish dentro de BSC Scan

![image](https://github.com/alopez2003/exchytoken/assets/67942268/d6f2a25b-eccb-45e4-a2dc-a9c2e5152001)

Llenamos los campos establecidos

![image](https://github.com/alopez2003/exchytoken/assets/67942268/7d9d06ee-fc65-4f2c-8d8d-4370e4b34372)

Pegamos el código y damos click en Verify and Publish

![image](https://github.com/alopez2003/exchytoken/assets/67942268/036ba894-0a9e-4278-a244-0d7331bf058a)

Tuvimos un error por lo que empezamos de nuevo

![image](https://github.com/alopez2003/exchytoken/assets/67942268/11b04500-2b7c-4506-9a68-6a576878a1bc)


Esta vez lo hicimos desde Remix, nos marcó algunos errores y lo realizamos con el compilador 0.8.24

Se creó un nuevo contrato, trabajaremos por ahora con este

![image](https://github.com/alopez2003/exchytoken/assets/67942268/8d329b65-35a4-4fe8-a35d-7f8c64d98574)

https://testnet.bscscan.com/tx/0x37a5fcbf8ceb558e1a37a1b52c9a644bf8f4b08eaec1d8cbd264601528add75d

https://testnet.bscscan.com/address/0x6349e0f0fd22477001eaa1ed0da2e10063464f9b

Comenzamos nuevamente el proceso de verificación con el archivo flattened y el compilador actualizado

![image](https://github.com/alopez2003/exchytoken/assets/67942268/eb7625d2-e3cd-4c46-b0ad-c695e0cf7fe1)

![image](https://github.com/alopez2003/exchytoken/assets/67942268/461df2f6-3d29-4ff5-bf3e-90d97172dab6)

![image](https://github.com/alopez2003/exchytoken/assets/67942268/2956000d-532a-4a2b-9a46-d2b604b40891)

Vemos que ya está verificado el contrato

![image](https://github.com/alopez2003/exchytoken/assets/67942268/f7a500f3-2f78-44ad-af21-f864b8253fe6)

Podemos verlo ya creado en la direccion creado con su nombre

![image](https://github.com/alopez2003/exchytoken/assets/67942268/7fee031e-f581-4564-9a72-d0bbf6c68298)

Pudiendo ver todos sus atributos

https://testnet.bscscan.com/token/0x6349e0f0fd22477001eaa1ed0da2e10063464f9b?a=0xb62806e9ae935d616c983374ffc91903c719a5d1#code

![image](https://github.com/alopez2003/exchytoken/assets/67942268/15de8bb2-7da9-4bf3-9c9c-94d0bbd45e90)

![image](https://github.com/alopez2003/exchytoken/assets/67942268/4d355e41-d7d0-4c51-a27b-a051122cdf1c)

_Nota: La función de Mint la realizamos desde un inicio, no la contiene este smart contract, veamos las funciones transfer, approve y transferFrom, para la parte de burn, verificaremos si es posible hacerlo enviando algunos tokens hacia la dirección 0x_




### Smart Contract para implementación de un DEX (Exchange descentralizado)

Para este caso, ocuparemos también Remix debido a que es la forma que encontramos para verificar el contrato.

NOTA: Había pegado ya varias capturas de pantalla verificando el contrato, sin embargo se fue a pantalla azul la computadora antes de poder guardar el archivo en github, pondré algunas respecto a la verificación del contrato con las imagenes que pueda rescatar


















