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

public class Hermes{
    
    let fontsManager = FontsManager()
    static var publicKey = "my-fancy-public-key"
    static var widgetSlug = "my-fancy-widget-key"
    static var colorTheme = ColorTheme.AUTO
    
    public static let shared = Hermes()
    
    private init() {}
    
    func registerAllFonts(){
        try! fontsManager.registerFont(named: FontsManager.fontRegular)
        try! fontsManager.registerFont(named: FontsManager.fontBold)
        try! fontsManager.registerFont(named: FontsManager.fontBlack)
        try! fontsManager.registerFont(named: FontsManager.fontMedium)
    }
    
    
    public func configure(publicKey: String, widgetSlug: String) {
        Hermes.publicKey = publicKey
        Hermes.widgetSlug = widgetSlug
        registerAllFonts()
    }
    
    /// (SwiftUI) The Changelog view.
    public var view: some View {
        return ChangelogView(viewObserver: ViewObserver(), slug_id: Hermes.widgetSlug, public_key: Hermes.publicKey)
            .preferredColorScheme(Hermes.colorTheme == .AUTO ? .none : Hermes.colorTheme == .LIGHT ? .light : .dark)
    }
    
    #if canImport(UIKit) && !os(visionOS)
    /// (UIKit) The Changelog viewcontroller.
    public var viewController: UIViewController {
        UIHostingController(rootView: ChangelogView(viewObserver: ViewObserver(), slug_id: Hermes.widgetSlug, public_key: Hermes.publicKey).preferredColorScheme(Hermes.colorTheme == .AUTO ? .none : Hermes.colorTheme == .LIGHT ? .light : .dark))
    }
    #endif
    
    public func colorTheme(theme: ColorTheme){
        Hermes.colorTheme = theme
    }
    
    
}
