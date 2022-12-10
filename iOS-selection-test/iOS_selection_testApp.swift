//
//  iOS_selection_testApp.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import SwiftUI

@main
struct iOS_selection_testApp: App {
    private let dataSource = RemoteDataSourceImpl()
    
    var body: some Scene {
        WindowGroup {
            AccountsView(
                viewModel: AccountsViewVM(
                    interactor: InteractorImpl(dataSource: dataSource)
                )
            )
        }
    }
}
