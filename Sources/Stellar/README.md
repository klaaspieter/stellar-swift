# Stellar Swift

A Stellar client for Swift

## Installation

TBD

## Usage

Get an account by it's id.
```swift
let network = Network.test
network.getAccount(id: "...") { result in
  switch result {
    case .success(let account):
      print("balances: \(account.balances)")

    case .failure(let error):
      print("error: \(error)")
  }
}

```
