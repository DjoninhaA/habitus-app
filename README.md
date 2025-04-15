# Habitus

Um aplicativo Flutter para gerenciamento de hábitos.

seguem algumas imagens do app funcionando:

![image](https://github.com/user-attachments/assets/ed28a351-9163-4080-a573-0a254db5740f)
![image](https://github.com/user-attachments/assets/a4b01046-c6f3-45c0-b6c0-dcd688ab4dd4)
![image](https://github.com/user-attachments/assets/9239c864-34f1-4165-9f46-15d701db87bd)
![image](https://github.com/user-attachments/assets/b9704e5f-855a-4f58-8b8e-a09ae7c38808)
![image](https://github.com/user-attachments/assets/0374e720-0579-4d65-b32d-600de1889d0f)




## Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Flutter](https://flutter.dev/docs/get-started/install) (SDK ^3.7.0)
- [Dart](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) (para desenvolvimento Android)
- [Xcode](https://developer.apple.com/xcode/) (para desenvolvimento iOS - apenas macOS)
- [VS Code](https://code.visualstudio.com/) (opcional, mas recomendado)

## Configuração do Ambiente

1. Clone o repositório:

```bash
git clone [git@github.com:DjoninhaA/habitus-app.git]
cd habitus
```

2. Instale as dependências:

```bash
flutter pub get
```

## Executando o Projeto

### Para desenvolvimento

1. Conecte um dispositivo ou inicie um emulador

2. Execute o projeto:

```bash
flutter run
```

### Para criar uma build de release

#### Android

```bash
flutter build apk --release
```

O APK será gerado em `build/app/outputs/flutter-apk/app-release.apk`

#### iOS (apenas em macOS)

```bash
flutter build ios --release
```

Abra o Xcode e distribua através dele.

## Estrutura do Projeto

```
lib/
  ├── main.dart          # Ponto de entrada do aplicativo
  ├── models/           # Modelos de dados
  ├── screens/          # Telas do aplicativo
  └── widgets/          # Widgets reutilizáveis
```

## Dependências Principais

- Flutter SDK
- shared_preferences: ^2.2.2 - Para persistência de dados
- cupertino_icons: ^1.0.8 - Ícones iOS style
