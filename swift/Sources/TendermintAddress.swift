// Copyright © 2017-2019 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

import Foundation

public final class TendermintAddress {

    public static func == (lhs: TendermintAddress, rhs: TendermintAddress) -> Bool {
        return TWTendermintAddressEqual(lhs.rawValue, rhs.rawValue)
    }

    public static func isValidString(string: String) -> Bool {
        let stringString = TWStringCreateWithNSString(string)
        defer {
            TWStringDelete(stringString)
        }
        return TWTendermintAddressIsValidString(stringString)
    }

    public var description: String {
        return TWStringNSString(TWTendermintAddressDescription(rawValue))
    }

    public var hrp: HRP {
        return HRP(rawValue: TWTendermintAddressHRP(rawValue).rawValue)!
    }

    public var keyHash: Data {
        return TWDataNSData(TWTendermintAddressKeyHash(rawValue))
    }

    let rawValue: OpaquePointer

    init(rawValue: OpaquePointer) {
        self.rawValue = rawValue
    }

    public init?(string: String) {
        let stringString = TWStringCreateWithNSString(string)
        defer {
            TWStringDelete(stringString)
        }
        guard let rawValue = TWTendermintAddressCreateWithString(stringString) else {
            return nil
        }
        self.rawValue = rawValue
    }

    public init?(hrp: HRP, keyHash: Data) {
        let keyHashData = TWDataCreateWithNSData(keyHash)
        defer {
            TWDataDelete(keyHashData)
        }
        guard let rawValue = TWTendermintAddressCreateWithKeyHash(TWHRP(rawValue: hrp.rawValue), keyHashData) else {
            return nil
        }
        self.rawValue = rawValue
    }

    public init?(hrp: HRP, publicKey: PublicKeySecp256k1) {
        guard let rawValue = TWTendermintAddressCreateWithPublicKey(TWHRP(rawValue: hrp.rawValue), publicKey.rawValue) else {
            return nil
        }
        self.rawValue = rawValue
    }

    deinit {
        TWTendermintAddressDelete(rawValue)
    }

}
