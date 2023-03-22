//
//  TestProtobufApp.swift
//  TestProtobuf
//
//  Created by chenmu on 2023/3/21.
//

import SwiftUI
import SubProtobuf
import SwiftProtobuf

@main
struct TestProtobufApp: App {
    let areq = AsyncRequest()
    let req = SyncRequest()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    init() {
        let configuration = Configuration.with { c in
          c.documentDirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].path
        }

        let _: ConfigureResponse = try! logicCall(.configure(.with {
          $0.config = configuration
          // this will clear the cache if we start from simulator
          #if targetEnvironment(simulator)
            $0.debug = true
          #endif
        }))
    }
}

