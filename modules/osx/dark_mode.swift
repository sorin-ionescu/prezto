import Foundation

if #available(OSX 10.14, *) {
    let darkMode = UserDefaults.standard.string(forKey: "AppleInterfaceStyle")
    
    if darkMode == "Dark" {
        exit(0)
    }
    else {
        exit(1)
    }
}

print("OS not supported, sorry")
exit(2)
