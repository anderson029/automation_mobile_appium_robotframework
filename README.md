
# Configuração para Automação Mobile com Appium e RobotFramework

Este guia fornece os passos necessários para configurar um ambiente de automação mobile utilizando Appium e RobotFramework.

## Ferramentas Necessárias

- **Python 3**
- **Visual Studio Code (VS Code)**
- **Android Studio**
- **Adicionar a variável `ANDROID_HOME` no PATH do Windows:**
  `C:\Users\<Seu usuário>\AppData\Local\Android\Sdk`
- **Java 8**
  - Adicionar a variável `JAVA_HOME` no PATH do Windows
- **Node.js**
- **Appium Desktop**
  - Pode ser instalado via Node.js
- **Appium Inspector**
  - Download: [Appium Inspector Releases](https://github.com/appium/appium-inspector/releases)
  - Obs.: No campo "Remote Path", informar o WebDriver: `/wd/hub`

## Instalação do Appium via Node.js

Execute os seguintes comandos no terminal para instalar o Appium e ferramentas auxiliares:

```bash
npm install appium -g
npm install appium-doctor -g
```

## Verificar o Servidor do Appium

Inicie o servidor com o comando:

```bash
appium
```

Realize um diagnóstico para verificar a configuração do Appium para Android:

```bash
appium-doctor --android
```

## Configuração do Appium Inspector

Após abrir o Android Studio e configurar o emulador, instale o Appium Inspector. Configure os capabilities para o emulador Android no seguinte formato:

```json
{
  "platformName": "Android",
  "platformVersion": "15",
  "deviceName": "Emulator",
  "automationName": "UIAutomator2",
  "app": "caminho_do_apk",
  "udid": "emulator-xpto",
  "newCommandTimeout": 3600,
  "connectHardwareKeyboard": true
}
```

## Verificar o ID do Emulador

Use o comando abaixo para verificar o ID do dispositivo em linha:

```bash
adb devices
```

## Instalação do RobotFramework

O `pip` é o gerenciador de pacotes do Python. Use-o para instalar o RobotFramework:

```bash
pip install robotframework
```

## Instalar a Biblioteca do Appium para RobotFramework

Consulte a documentação oficial [aqui](https://github.com/robotframework/AppiumLibrary). Para instalar a biblioteca, execute:

```bash
pip install --upgrade robotframework-appiumlibrary
```

## Extensão para VS Code

Instale a extensão **Robot Framework Language Server** no VS Code para auxiliar na escrita de código.

## Executando a Automação

Para rodar os testes, utilize o comando:

```bash
robot -d caminho_da_pasta_results arquivo.robot
```

### Opções de Execução

- **Executar por tags:**

```bash
robot -i tag_desejada -d caminho_da_pasta_results arquivo.robot
```

- **Ignorar tags:**

```bash
robot -e tag_a_ignorar -d caminho_da_pasta_results arquivo.robot
```

### Exemplo de Execução

```bash
robot -d C:\automation\automation_mobile_appium_robotframework\results -i login tests\login.robot
```

