//
//  UIScreenExtension.swift
//  kit_extension
//
//  Created by wbzhan on 2025/3/20.
//

import Foundation
public struct KitScreenExtension {
    public  static var keyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            let connectedScenes = UIApplication.shared.connectedScenes
            let scene = connectedScenes.first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) ?? connectedScenes.first(where: { $0.activationState == .foregroundInactive && $0 is UIWindowScene })
            return scene
                .flatMap({ $0 as? UIWindowScene })?
                .windows
                .first(where: { $0.isKeyWindow })
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    public static var statusBarFrame: CGRect {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let statusBarFrame = windowScene.statusBarManager?.statusBarFrame {
                return statusBarFrame
            }
            return .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44.0)
        }
        return UIApplication.shared.statusBarFrame
    }
    
    static var mainBounds: CGRect {
        if #available(iOS 13.0, *) {
            for scene in UIApplication.shared.connectedScenes {
                if scene.activationState == .foregroundActive, let delegate = scene.delegate as? UIWindowSceneDelegate, let bounds = delegate.window??.bounds {
                    return bounds
                }
            }
        }
        return UIApplication.shared.windows[0].bounds
    }
}
