//: [Previous](@previous)

import UIKit

/// https://www.ramshandilya.com/blog/design-system-typography/
enum Font: String {
    case regular = "AvenirNext-Regular"
    case demiBold = "AvenirNext-DemiBold"
    case medium = "AvenirNext-Medium"
    case heavy = "AvenirNext-Heavy"
    
    var name: String {
        return self.rawValue
    }
}

struct FontDescription {
    let font: Font
    let size: CGFloat
    let style: UIFont.TextStyle
}


enum TextStyle {
    case display1 //32pt, Demibold
    case display2 //28pt, Demibold
    case display3 //20pt, Demibold
    case display4 //16pt, Demibold
    case display5 //14pt, Demibold

    case paragraph //16pt, Regular
    case paragraphSmall //14pt, Regular

    case link //16pt, Demibold
    case buttonBig //16pt, Medium
    case buttonSmall //14pt, Medium
}


extension TextStyle {
    private var fontDescription: FontDescription {
        switch self {
        case .display1:
            return FontDescription(font: .demiBold, size: 32, style: .largeTitle)
        case .display2:
            return FontDescription(font: .demiBold, size: 28, style: .title1)
        case .display3:
            return FontDescription(font: .demiBold, size: 20, style: .title2)
        case .display4:
            return FontDescription(font: .demiBold, size: 16, style: .headline)
        case .display5:
            return FontDescription(font: .demiBold, size: 14, style: .subheadline)
        case .paragraph:
            return FontDescription(font: .regular, size: 16, style: .body)
        case .paragraphSmall:
            return FontDescription(font: .regular, size: 14, style: .caption1)
        case .link:
            return FontDescription(font: .demiBold, size: 16, style: .callout)
        case .buttonBig:
            return FontDescription(font: .medium, size: 16, style: .callout)
        case .buttonSmall:
            return FontDescription(font: .medium, size: 14, style: .callout)
        }
    }
}

extension TextStyle {
    var font: UIFont {
        guard let font = UIFont(name: fontDescription.font.name, size: fontDescription.size) else {
            return UIFont.preferredFont(forTextStyle: fontDescription.style)
        }

        let fontMetrics = UIFontMetrics(forTextStyle: fontDescription.style)
        return fontMetrics.scaledFont(for: font)
    }
}

let label = UILabel()
label.font = TextStyle.buttonBig.font
