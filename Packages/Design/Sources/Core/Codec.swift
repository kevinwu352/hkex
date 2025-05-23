//
//  Codec.swift
//  Design
//
//  Created by Kevin Wu on 4/6/25.
//

import Foundation

public func pathmk(_ trail: String, _ uid: String?, _ dir: FileManager.SearchPathDirectory = .documentDirectory) -> String {
    let base = NSSearchPathForDirectoriesInDomains(dir, .userDomainMask, true).first ?? ""
    if let uid = uid, !uid.isEmpty {
        return base.addedPathSeg(["Users", uid].joined(separator: "/")).addedPathSeg(trail)
    } else {
        return base.addedPathSeg(trail)
    }
}
public extension String {
    func addedPathSeg(_ seg: String) -> String {
        guard !seg.isEmpty else { return self }
        if hasSuffix("/") && seg.hasPrefix("/") {
            return self + seg.dropFirst()
        } else if !hasSuffix("/") && !seg.hasPrefix("/") {
            return self + "/" + seg
        } else {
            return self + seg
        }
    }
}
public func path_create_dir(_ path: String?) {
    guard let path = path, !path.isEmpty else { return }
    if !FileManager.default.fileExists(atPath: path, isDirectory: nil) {
        try? FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
    }
}
public func path_create_file(_ path: String?) {
    guard let path = path, !path.isEmpty else { return }
    let dir = (path as NSString).deletingLastPathComponent
    if !FileManager.default.fileExists(atPath: dir, isDirectory: nil) {
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
    }
    if !FileManager.default.fileExists(atPath: path, isDirectory: nil) {
        FileManager.default.createFile(atPath: path, contents: nil, attributes: nil)
    }
}
public func path_delete(_ path: String?) {
    guard let path = path, !path.isEmpty else { return }
    try? FileManager.default.removeItem(atPath: path)
}

public func data_read(_ path: String?) -> Data? {
    if let path = path, !path.isEmpty {
        return try? Data(contentsOf: URL(fileURLWithPath: path))
    }
    return nil
}
public func data_write(_ data: Data?, _ path: String?) {
    if let path = path, !path.isEmpty {
        let dir = (path as NSString).deletingLastPathComponent
        if !FileManager.default.fileExists(atPath: dir, isDirectory: nil) {
            try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true, attributes: nil)
        }
        try? data?.write(to: URL(fileURLWithPath: path))
    }
}

public func json_encode(_ json: Any?, _ options: JSONSerialization.WritingOptions = []) -> Data? {
    if let json = json, JSONSerialization.isValidJSONObject(json) {
        return try? JSONSerialization.data(withJSONObject: json, options: options)
    } else {
        return nil
    }
}
public func json_decode(_ data: Data?, _ options: JSONSerialization.ReadingOptions = []) -> Any? {
    if let data = data, !data.isEmpty {
        return json_standardize(try? JSONSerialization.jsonObject(with: data, options: options))
    } else {
        return nil
    }
}
public func json_standardize(_ json: Any?) -> Any? {
    if let array = json as? [Any] {
        return array.compactMap { json_standardize($0) }
    } else if let object = json as? [String: Any] {
        return object.compactMapValues { json_standardize($0) }
    } else if let number = json as? NSNumber {
        if number.isBool {
            return json as? Bool
        } else if number.isInt {
            return json as? Int
        } else if number.isDouble {
            return json as? Double
        }
    } else if let string = json as? String {
        return string
    }
    return nil
}
// bool as NSNumber   : is bool/int
// int as NSNumber    : is int
// double as NSNumber : is double
private extension NSNumber {
    var isBool: Bool {
        CFGetTypeID(self) == CFBooleanGetTypeID()
    }
    var isInt: Bool {
        [
            CFNumberType.sInt8Type,
            CFNumberType.sInt16Type,
            CFNumberType.sInt32Type,
            CFNumberType.sInt64Type,
            CFNumberType.intType,
            CFNumberType.longType,
            CFNumberType.longLongType,
            CFNumberType.nsIntegerType,
            CFNumberType.charType,
            CFNumberType.shortType
        ].contains(CFNumberGetType(self))
    }
    var isDouble: Bool {
        [
            CFNumberType.float32Type,
            CFNumberType.float64Type,
            CFNumberType.floatType,
            CFNumberType.doubleType,
            CFNumberType.cgFloatType
        ].contains(CFNumberGetType(self))
    }
}
