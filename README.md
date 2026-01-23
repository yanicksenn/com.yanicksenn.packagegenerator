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

- **Package Scaffolding:** Generates a standardized directory structure including `Runtime`, `Editor`, and `Tests` folders, along with `package.json`, `README.md`, `CHANGELOG.md`, and `LICENSE.md`.
- **Metadata Configuration:** Provides a configurable settings provider (accessible via Project Settings) to define default values for author name, email, URL, root namespace, and package naming patterns.
- **Assembly Definition Generation:** Automatically creates `.asmdef` files for Runtime, Editor, and Test assemblies with appropriate platform constraints, references (e.g., `nunit.framework`), and define constraints.

## 🚀 Usage

### ⚙️ Package Creation Interface

The primary functionality is accessed via an Editor Window which validates user input (using Regex for versions and namespaces) and creates the physical package files. While typically accessed via the Unity Menu (`Tools/Package Generator/Create Package`), it can be triggered programmatically.

```csharp
using YanickSenn.PackageGenerator.Editor;

// Programmatically open the Package Creator window
PackageCreatorWindow.ShowWindow();
```

### ⚙️ Managing Configuration

The tool persists default values (such as Author Name or Root Namespace) in a ScriptableObject. You can access or modify these defaults via code to enforce specific standards across your team or project.

```csharp
using UnityEditor;
using YanickSenn.PackageGenerator.Editor;

// Retrieve or create the settings asset
var settings = PackageGeneratorConfiguration.GetOrCreateSettings();

// Read or modify default configuration values
string currentNamespace = settings.defaultRootNamespace;
settings.defaultAuthorName = "New Author Name";
settings.defaultPackageName = "com.new.standard";

// Save changes to the asset
EditorUtility.SetDirty(settings);
AssetDatabase.SaveAssets();
```

## 🔧 Requirements

* **Unity Version:** 6000.0 or higher
* **Dependencies:**
* com.yanicksenn.utils