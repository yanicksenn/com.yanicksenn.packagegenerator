using UnityEditor;
using UnityEngine;

namespace YanickSenn.PackageGenerator.Editor
{
    [CreateAssetMenu(fileName = "PackageGeneratorConfiguration", menuName = "Package Generator/Configuration")]
    public class PackageGeneratorConfiguration : ScriptableObject
    {
        public const string SettingsPath = "Assets/Settings/PackageGeneratorConfiguration.asset";

        [Header("Package Defaults")]
        [Tooltip("The default author name for new packages.")]
        public string defaultAuthorName = "Company Name";
        [Tooltip("The default author email for new packages.")]
        public string defaultAuthorEmail = "support@company.com";
        [Tooltip("The default author URL for new packages.")]
        public string defaultAuthorUrl = "https://www.company.com";
        [Tooltip("The default root namespace for new packages.")]
        public string defaultRootNamespace = "MyPackage";
        [Tooltip("The default package name for new packages.")]
        public string defaultPackageName = "com.company.newpackage";

        public static PackageGeneratorConfiguration GetOrCreateSettings()
        {
            var settings = AssetDatabase.LoadAssetAtPath<PackageGeneratorConfiguration>(SettingsPath);
            if (settings == null)
            {
                FileUtils.CreateDirectoryIfNeeded("Assets/Settings");
                
                settings = CreateInstance<PackageGeneratorConfiguration>();
                settings.defaultAuthorName = "John Doe";
                settings.defaultAuthorEmail = "jdoe@gmail.com";
                settings.defaultAuthorUrl = "https://www.johndoe.com";
                settings.defaultRootNamespace = "JohnDoe";
                settings.defaultPackageName = "com.johndoe.newpackage";
                
                AssetDatabase.CreateAsset(settings, SettingsPath);
                AssetDatabase.SaveAssets();
            }
            return settings;
        }

        public static SerializedObject GetSerializedSettings()
        {
            return new SerializedObject(GetOrCreateSettings());
        }
    }
}