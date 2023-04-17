//
//  JVClientCustomField.swift
//  App
//
//  Created by Stan Potemkin on 25.01.2023.
//  Copyright © 2023 JivoSite. All rights reserved.
//

import Foundation

@objc(JVClientCustomField)
public class JVClientCustomField: JVDatabaseModel {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        m_content = String()
    }
    
    public override func apply(context: JVIDatabaseContext, change: JVDatabaseModelChange) {
        super.apply(context: context, change: change)
        performApply(context: context, environment: context.environment, change: change)
    }
}
