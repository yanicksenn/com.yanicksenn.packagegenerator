# Package Generator
This package contains a unity package generator.

## Installation
1. Open "Package Manager"
2. Choose "Add package from git URL..."
3. Use the HTTPS URL of this repository:
```
https://github.com/yanicksenn/com.yanicksenn.packagegenerator.git#1.0.0
```
4. Click "Add"

## Features
This package provides a tool to quickly scaffold new Unity packages with a standardized structure:
* **Package Scaffolding:** Generates the complete folder structure including `Runtime`, `Editor`, and `Tests` directories.
* **Metadata Generation:** Automatically creates `package.json` with customizable metadata (version, author, dependencies).
* **Assembly Definitions:** Generates `.asmdef` files for all assemblies with appropriate references and platform settings.
* **Documentation Templates:** Creates placeholder `README.md`, `CHANGELOG.md`, and `LICENSE.md` files.
* **Configuration:** Supports a configuration asset to define default values for new packages (Author info, root namespace, etc.).

## How to Use
### Opening the Package Generator
To open the package generator window, go to the Unity menu and select `Tools > Package Generator > Create Package`.

### Configuring Defaults
The tool uses a configuration asset to pre-fill common fields.
* **Location:** The configuration is located at `Assets/Settings/PackageGeneratorConfiguration.asset`.
* **Auto-Creation:** If the configuration file does not exist, it will be automatically created when the window is opened.
* **Customization:** Select the configuration asset to modify default Author Name, Email, URL, Root Namespace, and Package Name pattern.

### Creating a Package
1. **Fill Details:** Enter the desired Package Name, Version, Display Name, and other metadata in the "Package Information" form.
2. **Validation:** The tool validates inputs (e.g., package name format `com.company.package`, version format `x.y.z`) and provides feedback.
3. **Create:** Click the "Create" button to generate the package.
   * If the package directory already exists, the tool will only create missing files.
