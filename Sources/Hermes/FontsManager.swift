//
//  FontsManager.swift
//  hermes-widget-ios
//
//  Created by Bezaleel Ashefor on 15/01/2023.
//

import Foundation
import UIKit
import CoreGraphics
import CoreText

class FontsManager {
    
    static var fontRegular = "TTInterfaces-Regular"
    static var fontMedium = "TTInterfaces-Medium"
    static var fontBold = "TTInterfaces-Bold"
    static var fontBlack = "TTInterfaces-Black"
    
    
    public enum FontError: Swift.Error {
       case failedToRegisterFont
    }

    func registerFont(named name: String) throws {
       guard let asset = NSDataAsset(name: "Fonts/\(name)", bundle: Bundle.module),
          let provider = CGDataProvider(data: asset.data as NSData),
          let font = CGFont(provider),
          CTFontManagerRegisterGraphicsFont(font, nil) else {
        throw FontError.failedToRegisterFont
       }
    }
    
}
