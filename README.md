# RxSwiftFlux

RxSwiftFlux is an implementation of [Facebook's Flux architecture](https://facebook.github.io/flux/) using reactive programing for swift.

- Type of an action's payload is inferred from the type of its action.
- The control flow using reactive programing with Rxswift

# Requirements

- Swift 3.0 or later
- iOS 9.0 or later

## Installation

#### [Carthage](https://github.com/Carthage/Carthage)

- Insert `github "cam-hop/RxSwiftFlux"` to your Cartfile.
- Run `carthage update`.

#### [CocoaPods](https://cocoapods.org/)

- To be support soon

## Usage

### Step 1: Define Action

- Assign type that represents a result object to Payload `typealiase`.
- Assign type that represents a error object to ErrorType `typealiase` for the error case.
- Define `invoke` to dispatching action to stores.
- You can call api request here.

```swift
final class SubcriberAction {
    class Fetch : Action {
        typealias Payload = [SubcriberModel]
        typealias ErrorType = Error
        func invoke(dispatcher: Dispatcher) {
            // You can use api request here, refer to RxSwiftFluxDemo for ex
            let subcribers = [
               SubcriberModel(title: "Subcriber", ...)
            ]
            dispatcher.dispatch(self, result: subcribers)
        }
    }
}
```


### Step 2: Define Store and register action to dispatch

- Define one singleton and variables to hold result (or error) from dispatcher which will be observed from view
- Register any subscribe action callback to dispatcher.
- 

```swift
final class SubcriberStore {
    static let shared = SubcriberStore()
    var subcribers = Variable<[SubcriberModel]>([])
    
    private init() {
        let fetchToken = ActionCreator.dispatcher.register(type: SubcriberAction.Fetch.self)
        guard let subcriberSbj = ActionCreator.dispatcher.dispatchSbj(type: SubcriberAction.Fetch.self, dispatchToken: fetchToken) as? DispatchSubject<SubcriberAction.Fetch.Payload> else {
            return
        }
        
        subcriberSbj.subscribe(onNext: { [unowned self] subcribers in
            self.subcribers.value = subcribers
        })
        .addDisposableTo(disposeBag)
        
    }
}
```

### Step 3: Subscribe store at View

- Observe store variables to know state changed.
- Get result from store's variables

```swift
let subcriberStore: SubcriberStore = .shared
subcriberStore.subcribers.asObservable()
            .subscribe(onNext: { [unowned self] elements in
                self.subcribers.value = elements
                self.tableView?.reloadData()
            })
            .addDisposableTo(rx_disposeBag)
```

### Step 4: Create and invoke Action by ActionCreator

```swift
ActionCreator.invoke(SubcriberAction.Fetch())
``` 
