@testable import BSDiffSwift
import CryptoKit
import Foundation
import XCTest

final class BSDiffSwiftTests: XCTestCase {
    func testExample() throws {
        let bundle = Bundle.module
        let oldTextFile = try XCTUnwrap(bundle.url(forResource: "bsdiff_old", withExtension: "txt"))
        let patchFile = try XCTUnwrap(bundle.url(forResource: "bsdiff_patch", withExtension: "patch"))
        let expectedNewTextFile = try XCTUnwrap(bundle.url(forResource: "bsdiff_new", withExtension: "txt"))
        
        let newTextFile = FileManager.default.temporaryDirectory.appendingPathComponent("bsdiff_new_result.txt")
        let patchResult = Data.applyDiff(oldFile: oldTextFile, patchFile: patchFile, newFile: newTextFile)
        
        guard patchResult else {
            XCTFail("Failed to apply patch")
            return
        }
        let md5 = try newTextFile.md5String
        let expectedMD5 = try expectedNewTextFile.md5String
        XCTAssertEqual(md5, expectedMD5)
    }
}

extension URL {
    var md5String: String {
        get throws {
            let data = try Data(contentsOf: self)
            let md5Digest = Insecure.MD5.hash(data: data)
            let md5String = md5Digest.map { String(format: "%02hhx", $0) }.joined()
            return md5String
        }
    }
}
