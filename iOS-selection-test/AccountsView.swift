//
//  AccountsView.swift
//  iOS-selection-test
//
//  Created by Igor Squadra on 09/12/22.
//

import SwiftUI

struct AccountsView: View {
    @StateObject var viewModel: AccountsViewVM
    
    var body: some View {
        NavigationView {
            switch viewModel.status {
            case .error:
                RetryView(
                    description: "Accounts are not accessible",
                    buttonText: "Tap to retry",
                    onTap: viewModel.loadData
                ).navigationTitle("Accounts")
            case .loading:
                LoadingView(
                    description: "Loading Accounts..."
                ).navigationTitle("Accounts")
            case .loaded:
                accountsList
                    .alert(viewModel.paymentAlertType?.title ?? "Wrong payment type", isPresented: $viewModel.showingPaymentAlert, actions: {
                        Button("Cancel", role: .cancel, action: {})
                        Button("OK", action: {})
                    }, message: {
                        Text("This is just an empty alert with name of the type of the payment to be created.")
                    })
                    .navigationTitle("Accounts")
            }
        }
    }
}

// MARK: - Views

extension AccountsView {
    
    @ViewBuilder
    var accountsList: some View {
        List {
            ForEach(viewModel.accounts ?? [], id: \.id) { account in
                VStack(alignment: .leading) {
                    HStack {
                        Text(account.accountNumber)
                            .font(.system(size: Config.FontSize.big))
                            .fontWeight(.bold)
                        Spacer()
                        AmountView(currency: account.currency, amount: account.amount)
                    }
                    if let name = account.name {
                        Text(name)
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(
                                maxWidth: UIScreen.main.bounds.width * 0.4,
                                alignment: .leading
                            )
                            .foregroundColor(Config.Colors.grey)
                    }
                    HStack {
                        ForEach(account.paymentTypes, id: \.hashValue) { paymentType in
                            PaymentButtonView(
                                color: paymentType.color,
                                text: paymentType.title) {
                                    viewModel.createPayment(paymentType)
                                }
                        }
                    }
                }
            }
        }.listStyle(.plain)
    }
}


struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView(
            viewModel: AccountsViewVM(
                interactor: InteractorImpl(
                    dataSource: RemoteDataSourceImpl()
                )
            )
        )
    }
}
