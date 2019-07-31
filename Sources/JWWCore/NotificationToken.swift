//
//  NotificationToken.swift
//  
//
//  Created by Justin Williams on 7/31/19.
//

import Foundation

/// A notification token is a wrapper around a `Notification` listener that automatically handles the removal of the
/// observer upon deinitialization.
public final class NotificationToken: NSObject {
    /// The notification center the token is observing from.
    private let notificationCenter: NotificationCenter

    /// The observer after requesting to listen to a notification.
    private let observer: Any

    /// Initialize a new notification token.
    public init(notificationCenter: NotificationCenter = .default, token: Any) {
        self.notificationCenter = notificationCenter
        self.observer = token

        super.init()
    }

    deinit {
        notificationCenter.removeObserver(observer)
    }
}

// MARK: NotificationCenter Extensions
// ====================================
// NotificationCenter Extensions
// ====================================
public extension NotificationCenter {
    /// Wrapper for `addObserver(forName:object:queue:using:)` that returns a valid `NotificationToken`.
    func observe(name: NSNotification.Name?,
                 object obj: Any?,
                 queue: OperationQueue?,
                 using block: @escaping (Notification) -> Void) -> NotificationToken {
        let token = addObserver(forName: name, object: obj, queue: queue, using: block)
        return NotificationToken(notificationCenter: self, token: token)
    }
}

// adopted from: https://oleb.net/blog/2018/01/notificationcenter-removeobserver/
