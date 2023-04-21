//
//  JVAgentStatus+Access.swift
//  App
//
//  Created by Stan Potemkin on 22.01.2023.
//  Copyright © 2023 JivoSite. All rights reserved.
//

import Foundation

extension JVAgentStatus {
    public var statusID: Int {
        return Int(m_id)
    }
    
    public var title: String {
        return m_title.jv_orEmpty
    }
    
    public var emoji: String {
        return m_emoji.jv_orEmpty.jv_convertToEmojis()
    }
    
    public var position: Int {
        return Int(m_position)
    }
}
