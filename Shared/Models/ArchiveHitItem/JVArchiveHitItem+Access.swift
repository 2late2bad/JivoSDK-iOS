//
//  JVArchiveHitItem+Access.swift
//  App
//
//  Created by Stan Potemkin on 23.01.2023.
//  Copyright © 2023 JivoSite. All rights reserved.
//

import Foundation

extension JVArchiveHitItem {
    var agents: [JVAgent] {
        if let allObjects = m_agents?.allObjects as? [JVAgent] {
            return allObjects
        }
        else {
            return Array()
        }
    }
    
    var chat: JVChat? {
        return m_chat
    }
    
    var duration: TimeInterval {
        return TimeInterval(m_duration)
    }
}
