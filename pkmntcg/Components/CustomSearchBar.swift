//
//  CustomSearchBar.swift
//  pkmntcg
//
//  Created by blanca.a.fernandez on 15/09/2026.
//
import SwiftUI

struct CustomSearchBar: View {
  
  @Binding var searchText: String
  var action: () -> Void
  
  var body: some View {
    TextField("Buscar...", text: $searchText)
      .padding(10)
      .background(Color(.systemGray6))
      .cornerRadius(10)
      .padding(.horizontal)
      .onSubmit {action() }
  }
}
