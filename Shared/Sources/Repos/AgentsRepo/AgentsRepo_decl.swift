//
//  AgentsRepoDecl.swift
//  App
//
//  Created by Stan Potemkin on 09.03.2023.
//  Copyright © 2023 JivoSite. All rights reserved.
//

import Foundation
import JivoFoundation

protocol IAgentsRepo: AnyObject {
    func retrieve(id: Int, lookup: AgentRepoRetrievalLookup) -> JVAgent?
    func retrieveAll(listing: AgentRepoRetrievalListing) -> [JVAgent]
}
