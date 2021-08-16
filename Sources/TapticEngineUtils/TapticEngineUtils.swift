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
    
    public final class func feedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if !tapticEngineEnabled { return }
        prepare(style: style)
        tapticEngine.impactOccurred()
        tapticEngine.prepare()
    }
    
    public final class func prepare(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        if currentStyle != style {
            tapticEngine = UIImpactFeedbackGenerator(style: style)
            tapticEngine.prepare()
        }
    }
}
