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
    
    public static var tapticEngineEnabled = true
    
    public final class func feedback(style: UnclearFeedbackStyle) {
        if !tapticEngineEnabled { return }
        switch style {
        case .impact(let style):
            prepare(style: style)
            UINotificationFeedbackGenerator().notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.success)
            tapticEngine.impactOccurred()
            tapticEngine.prepare()
            break
        case .notification(let style):
            UINotificationFeedbackGenerator().notificationOccurred(style)
            break
        }
        
    }
    
    public final class func prepare(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if currentStyle != style {
            tapticEngine = UIImpactFeedbackGenerator(style: style)
            tapticEngine.prepare()
        }
    }
}

public enum UnclearFeedbackStyle {
    case impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
    case notification(style: UINotificationFeedbackGenerator.FeedbackType)
}

