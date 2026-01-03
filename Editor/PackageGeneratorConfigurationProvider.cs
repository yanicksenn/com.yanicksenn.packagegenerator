using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

namespace YanickSenn.PackageGenerator.Editor
{
    static class PackageGeneratorConfigurationProvider
    {
        [SettingsProvider]
        public static SettingsProvider CreateSettingsProvider()
        {
            var provider = new SettingsProvider("Project/YanickSenn/Package Generator", SettingsScope.Project)
            {
                label = "Package Generator",
                guiHandler = (searchContext) =>
                {
                    var settings = PackageGeneratorConfiguration.GetSerializedSettings();
                    settings.Update();
                    
                    EditorGUILayout.PropertyField(settings.FindProperty(nameof(PackageGeneratorConfiguration.defaultAuthorName)));
                    EditorGUILayout.PropertyField(settings.FindProperty(nameof(PackageGeneratorConfiguration.defaultAuthorEmail)));
                    EditorGUILayout.PropertyField(settings.FindProperty(nameof(PackageGeneratorConfiguration.defaultAuthorUrl)));
                    EditorGUILayout.PropertyField(settings.FindProperty(nameof(PackageGeneratorConfiguration.defaultRootNamespace)));
                    EditorGUILayout.PropertyField(settings.FindProperty(nameof(PackageGeneratorConfiguration.defaultPackageName)));

                    settings.ApplyModifiedProperties();
                },

                keywords = new HashSet<string>(new[] { "Package", "Generator", "Author", "Namespace" })
            };

            return provider;
        }
    }
}
