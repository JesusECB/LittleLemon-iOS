import SwiftUI

// MARK: ‑ Hex initializer
extension Color {
    /// Create a SwiftUI `Color` from a hexadecimal color string.
    /// - Parameter hex: Accepts `#RRGGBB`, `RRGGBB`, `#AARRGGBB` or `AARRGGBB`.
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hexString.count {
        case 8: // AARRGGBB
            (a, r, g, b) = ((int & 0xFF000000) >> 24, (int & 0x00FF0000) >> 16, (int & 0x0000FF00) >> 8, int & 0x000000FF)
        case 6: // RRGGBB
            (a, r, g, b) = (255, (int & 0xFF0000) >> 16, (int & 0x00FF00) >> 8, int & 0x0000FF)
        default:
            (a, r, g, b) = (255, 0, 0, 0) // fallback to black
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }

    // MARK: ‑ Brand Palette (exact hex values del Style Guide / imagen "Permissible colors")
    static let llGreenDark  = Color(hex: "#495E57") // primary green
    static let llGreenLight = Color(hex: "#71807B") // lighter green (alt)
    static let llYellow     = Color(hex: "#F4CE14") // accent
    static let llPeach      = Color(hex: "#EE9972")
    static let llLightPeach = Color(hex: "#FBDABB")
    static let llGrayLight  = Color(hex: "#AFAFAF") // light gray from permissible list
    static let llOffWhite   = Color(hex: "#EDEFEE") // off‑white from style guide
    static let llGrayDark   = Color(hex: "#333333")
    static let llWhite      = Color.white
}
