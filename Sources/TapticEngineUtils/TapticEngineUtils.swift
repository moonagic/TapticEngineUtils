//
//  TapticEngineUtils.swift
//  TapticEngineUtils
//
//  Created by Torghast on 8/16/21.
//
#if canImport(UIKit)
import UIKit
#endif

@available(iOS 10.0, *)
public class TapticEngineUtils {
    
    public enum UnclearFeedbackStyle {
        case impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
        case notification(style: UINotificationFeedbackGenerator.FeedbackType)
    }
    
    private static var currentStyle = UIImpactFeedbackGenerator.FeedbackStyle.light
    private static var tapticEngine = UIImpactFeedbackGenerator(style: currentStyle)
    private static let notificationFeedbackEngine = UINotificationFeedbackGenerator()
    
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
            notificationFeedbackEngine.notificationOccurred(style)
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
            notificationFeedbackEngine.prepare()
            break
        }
    }
}



