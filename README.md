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










