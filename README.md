# Habitus

Um aplicativo Flutter para gerenciamento de hábitos.

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
