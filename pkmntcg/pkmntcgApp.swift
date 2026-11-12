//
//  pkmntcgApp.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 15/09/2026.
//

import SwiftUI
import CoreData

@main
struct pkmntcgApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          //TODO: crear splash
          let useCasesFactory = UseCasesFactory(tcgDexRepository: TCGDexRepository())
          let viewModelFactory = ViewModelFactory(useCasesFactory: useCasesFactory)
          SearchView(viewModel: viewModelFactory.makeSearchViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
