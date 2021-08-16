//
//  File.swift
//  File
//
//  Created by Torghast on 8/16/21.
//

import UIKit

@available(iOS 10.0, *)
public class TapticEngineUtils {
    
    private static var currentStyle = UIImpactFeedbackGenerator.FeedbackStyle.light
    private static var tapticEngine = UIImpactFeedbackGenerator(style: currentStyle)
    private static let notiticationFeedbackEngine = UINotificationFeedbackGenerator()
    
    public static var tapticEngineEnabled = true
    
    public final class func feedback(style: UnclearFeedbackStyle) {
        if !tapticEngineEnabled { return }
        prepare(style: style)
        switch style {
        case .impact:
            tapticEngine.impactOccurred()
            tapticEngine.prepare()
            break
        case .notification(let style):
            notiticationFeedbackEngine.notificationOccurred(style)
            break
        }
    }
    
    public final class func prepare(style: UnclearFeedbackStyle) {
        if !tapticEngineEnabled { return }
        switch style {
        case .impact(let style):
            if currentStyle != style {
                tapticEngine = UIImpactFeedbackGenerator(style: style)
                tapticEngine.prepare()
            }
            break
        case .notification:
            notiticationFeedbackEngine.prepare()
            break
        }
    }
}

public enum UnclearFeedbackStyle {
    case impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
    case notification(style: UINotificationFeedbackGenerator.FeedbackType)
}

