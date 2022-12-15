import Foundation
import BeaconCore
import BeaconBlockchainTezos
import BeaconClientWallet
import BeaconTransportP2PMatrix

class BeaconApiController {
    
    private static func exampleTezosAccount(network: Tezos.Network) throws -> Tezos.Account {
        try Tezos.Account(
            publicKey: "edpktpzo8UZieYaJZgCHP6M6hKHPdWBSNqxvmEt6dwWRgxDh1EAFw9",
            address: "tz1aRfseTZNQjV8GdNTU8RfG9c5y5B2eL1QE",
            network: network
        )
    }

}
