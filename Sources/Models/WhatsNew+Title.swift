import SwiftUI

// MARK: - WhatsNew+Title

public extension WhatsNew {
    
    /// The WhatsNew Title
    struct Title {
        
        // MARK: Properties
        
        /// A closure that produces the Title View
        public let view: () -> AnyView
        
        // MARK: Initializer
        
        /// Creates a new instance of `WhatsNew.Title`
        /// - Parameters:
        ///   - view: A ViewBuilder closure that produces a Title View
        public init<Title: View>(
            @ViewBuilder
            view: @escaping () -> Title
        ) {
            self.view = { .init(view()) }
        }
        
    }
    
}

// MARK: - Title+init(text:)

public extension WhatsNew.Title {
    
    /// Creates a new instance of `WhatsNew.Title`
    /// - Parameters:
    ///   - text: The text to display as the title
    ///   - foregroundColor: The foreground color. Default value `.primary`
    init(
        text: String,
        foregroundColor: Color = .primary
    ) {
        self.init {
            SwiftUI.Text(text)
            .font(.largeTitle.bold())
            .foregroundColor(foregroundColor)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
        }
    }

}

// MARK: - ExpressibleByStringLiteral

extension WhatsNew.Title: ExpressibleByStringLiteral {
    
    /// Creates a new instance of `WhatsNew.Title`
    /// - Parameter value: The String literal value
    public init(
        stringLiteral value: String
    ) {
        self.init(
            text: .init(value)
        )
    }
    
}
