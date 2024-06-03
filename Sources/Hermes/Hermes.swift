//
//  Home.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

#if canImport(UIKit)
import UIKit
#endif

import SwiftUI

public struct Hermes{
    
    let fontsManager = FontsManager()
    static var publicKey = "my-fancy-public-key"
    static var widgetSlug = "my-fancy-widget-key"
    
    init() {
        try! fontsManager.registerFont(named: FontsManager.fontRegular)
        try! fontsManager.registerFont(named: FontsManager.fontBold)
        try! fontsManager.registerFont(named: FontsManager.fontBlack)
        try! fontsManager.registerFont(named: FontsManager.fontMedium)
    }
    
    
    public static func configure(with publicKey: String, with widgetSlug: String) {
        Hermes.publicKey = publicKey
        Hermes.widgetSlug = widgetSlug
    }
    
    /// (SwiftUI) The Changelog view.
    public static var view: some View {
        return ChangelogView(viewObserver: ViewObserver(), slug_id: Hermes.widgetSlug, public_key: Hermes.publicKey)
    }
    
    #if canImport(UIKit) && !os(visionOS)
    /// (UIKit) The Changelog viewcontroller.
    public static var viewController: UIViewController {
        UIHostingController(rootView: ChangelogView(viewObserver: ViewObserver(), slug_id: Hermes.widgetSlug, public_key: Hermes.publicKey))
    }
    #endif
    
    
}