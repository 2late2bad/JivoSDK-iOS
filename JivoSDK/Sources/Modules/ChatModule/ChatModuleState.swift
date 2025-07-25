//  
//  ChatModuleState.swift
//  Pods
//
//  Created by Stan Potemkin on 11.08.2022.
//

import Foundation
import UIKit

enum ChatModuleInputUpdate {
    case update(SdkChatReplyControl.Update)
//    case enable
//    case disable(placeholder: String)
    case fill(text: String, attachments: [PickedAttachmentObject])
//    case updateText(String)
    case updateAttachment(PickedAttachmentObject)
    case failedAttachments
    case shakeAttachments
//    case validationStatus(Bool)
}

enum SdkChatModuleLicenseState {
    case undefined // when we haven't received the license data yet
    case unlicensed
    case licensed // demo- or pro-license
}

final class ChatModuleState {
    let photoRequestReason = UUID()
    let uiConfig: SdkChatModuleVisualConfig
    var authorizationState: SessionAuthorizationState
    var recentStartupMode: SdkSessionManagerStartupMode
    
    var licenseState = SdkChatModuleLicenseState.undefined
    var activeAgents = [ChatModuleAgent]()
    var selectedMessageMeta: (sender: JVSenderType, deliveryStatus: JVMessageDelivery)?
    
    var placeholderForInput = String()
    var inputText = String()
    
    var pauseReasons = PauseReason.none
    struct PauseReason: OptionSet {
        let rawValue: Int
        init(rawValue: Int) { self.rawValue = rawValue }
        static let none = Self.init(rawValue: 0 << 0)
        static let inactiveApp = Self.init(rawValue: 1 << 0)
        static let unfocusedView = Self.init(rawValue: 1 << 1)
    }
    
    init(uiConfig: SdkChatModuleVisualConfig, authorizationState: SessionAuthorizationState, recentStartupMode: SdkSessionManagerStartupMode) {
        self.uiConfig = uiConfig
        self.authorizationState = authorizationState
        self.recentStartupMode = recentStartupMode
        
        inputText = uiConfig.inputPrefill
        
        if UIApplication.shared.applicationState.jv_isOnscreen {
            pauseReasons = .none
        }
        else {
            pauseReasons = .inactiveApp
        }
    }
}
