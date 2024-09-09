@_exported import CBSDiff
import Foundation

extension Data {
    public static func createDiff(oldFile: URL, newFile: URL, patchFile: URL) -> Bool {
        NSData.createDiff(withOldFile: oldFile.path, newFile: newFile.path, patchFile: patchFile.path)
    }
    
    public static func applyDiff(oldFile: URL, patchFile: URL, newFile: URL) -> Bool {
        NSData.apply(withOldFile: oldFile.path, patchFile: patchFile.path, newFile: newFile.path)
    }
    
    public static func data(with data: Data, patch: Data) -> Data? {
        data.patch(patch)
    }
    
    public func patch(_ patch: Data) -> Data? {
        (self as NSData).patch(patch)
    }
}
