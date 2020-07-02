import UIKit

/// https://www.ramshandilya.com/blog/design-system-colors/

/// * Single source of truth - one place to add/update colors
/// * Semantic naming - The names shouldn't change even when the app undergoes a rebranding.
/// * No custom colors in XIBs and Storyboards.
/// * Lose custom helper initializers - those initializers for hex or hsb values
/// * We could even go all the way and disable calling any UIColors outside of our defined colors.

enum Color: String, CaseIterable {
    //Base Colors
    case primary = "Primary"
    case error = "Error"

    // Text Colors
    case textPrimary = "Text Primary"
    case textSecondary = "Text Secondary"

    //Background Colors
    case backgroundPrimary = "Background Primary"
    case backgroundSecondary = "Background Secondary"

    //Action Text Colors
    case actionTextPrimary = "Action Text Primary"
    case actionTextOnColor = "Action Text On Color"
}

extension UIColor {
    convenience init(color: Color) {
        self.init(named: color.rawValue)!
    }
}

UIColor(color: .textPrimary)
