# com.yanicksenn.packagegenerator
URL: https://github.com/yanicksenn/com.yanicksenn.packagegenerator.git

![Version](https://img.shields.io/badge/version-1.0.6-blue)
![Unity Version](https://img.shields.io/badge/unity-6000.0+-lightgrey)

**com.yanicksenn.packagegenerator** is a Tool for Unity that automates the scaffolding of new Unity packages, ensuring consistent folder structures, assembly definitions, and metadata configuration.

## 📦 Installation

### via Git URL
Open the Unity Package Manager, click the "+" icon, select "Add package from git URL...", and paste:

```
https://github.com/yanicksenn/com.yanicksenn.packagegenerator.git#1.0.6
```

## ✨ Features

- **Package Scaffolding:** Generates a standardized directory structure including `Runtime`, `Editor`, and `Tests` folders, along with essential files like `package.json`, `README.md`, and correctly configured `.asmdef` files.
- **Configuration Management:** persist default settings for author details, namespaces, and package naming conventions via a ScriptableObject integrated into Project Settings.

## 🚀 Usage

### ⚙️ Package Creator Window

The package generation interface allows users to input package details, validates the input against naming conventions, and generates the file structure. It can be accessed via `Tools/Package Generator/Create Package` or programmatically.

```csharp
using YanickSenn.PackageGenerator.Editor;

// Programmatically open the Package Creator window
PackageCreatorWindow.ShowWindow();
```

### ⚙️ Configuration Management

The tool uses a `ScriptableObject` to store default values for package generation. You can access and modify these settings via code to enforce standards across your project.

```csharp
using UnityEditor;
using YanickSenn.PackageGenerator.Editor;

// Retrieve or create the settings asset
var settings = PackageGeneratorConfiguration.GetOrCreateSettings();

// Read or modify default configuration values
settings.defaultAuthorName = "New Author Name";
settings.defaultRootNamespace = "My.Custom.Namespace";
settings.defaultPackageName = "com.my.package";

// Save changes to the asset
EditorUtility.SetDirty(settings);
AssetDatabase.SaveAssets();
```

## 🔧 Requirements

* **Unity Version:** 6000.0 or higher
* **Dependencies:**
* com.yanicksenn.utils