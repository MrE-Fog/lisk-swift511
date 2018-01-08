//
//  LiskTestCase.swift
//  LiskTests
//
//  Created by Andrew Barba on 12/27/17.
//  Copyright © 2017 Andrew Barba. All rights reserved.
//

import XCTest
@testable import Lisk

class LiskTestCase: XCTestCase {

    let mainNetClient = APIClient.mainnet

    let testNetClient = APIClient.testnet

    let mainPeerClient = APIClient(options: .init(ssl: false, node: .init(hostname: "lisk0.abarba.me")))

    let andrewAddress = "14987768355736502769L"
    let andrewPublicKey = "f33f878dc7e7177f60f3dcfef842b1cc3c947c3910eee6e8ecd33b9e1a7f38d7"

    let exampleSecret = "song ordinary prosper bridge habit blanket cheap report option never slim carry"
    let exampleAddress = "5549607903333983622L"
    let examplePublicKey = "1ee2381045434c0b9a964cbe7f853e1d2a72de0d979881e661e5278ea6c40a48"

    let testAddress = "6836577435110752844L"
    let testSecret = "prepare ketchup absorb bonus during glare accuse napkin cause hurdle sausage hurt"

    @discardableResult
    func tryRequest<R>(_ block: (@escaping (Response<R>) -> Void) -> Void) -> R {
        let expectation = XCTestExpectation()

        var result: R?

        block() { response in
            switch response {
            case .success(let r):
                result = r
            case .error(let error):
                XCTFail(error.message)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        return result!
    }

    @discardableResult
    func tryRequestError<R>(_ block: (@escaping (Response<R>) -> Void) -> Void) -> APIResponseError {
        let expectation = XCTestExpectation()
        var error: APIResponseError?
        block() { response in
            switch response {
            case .success:
                XCTFail("Expected an error response, request was succeeded")
            case .error(let _error):
                error = _error
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
        return error!
    }
}
