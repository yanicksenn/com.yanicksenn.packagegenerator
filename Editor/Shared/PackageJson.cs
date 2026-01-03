using System;
using System.Collections.Generic;

namespace YanickSenn.PackageGenerator.Editor.Shared {

    [Serializable]
    public class PackageJson {
        public string name;
        public string version;
        public string displayName;
        public string description;
        public string unity;
        public string unityRelease;
        public Author author;
        public Dictionary<string, string> dependencies;
    }
        
    [Serializable]
    public class Author {
        public string name;
        public string email;
        public string url;
    }
}
