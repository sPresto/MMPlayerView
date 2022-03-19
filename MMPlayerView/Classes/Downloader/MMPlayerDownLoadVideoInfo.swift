//
//  MMPlayerDownLoadVideoInfo.swift
//  MMPlayerView
//
//  Created by Millman on 2018/11/15.
//

import Foundation

public enum VideoType: Int, Codable {
    case mp4 = 0
    case hls
}

public struct MMPlayerDownLoadVideoInfo: Codable, Equatable {
    public let url: URL
    public let type: VideoType
    public let fileName: String
    public let fileSubPath: String

    public var localURL: URL {
        get {
            URL(fileURLWithPath: VideoBasePath)
                .appendingPathComponent(fileSubPath)
                .appendingPathComponent(convrtFileName)
        }
    }

    private var convrtFileName: String {
        var name = fileName.isEmpty ? url.absoluteString.base64 : fileName
        switch type {
        case .hls:
            break
        case .mp4:
            name += ".mp4"
        }

        return name
    }

    public static func == (lhs: MMPlayerDownLoadVideoInfo, rhs: MMPlayerDownLoadVideoInfo) -> Bool {
        return lhs.url == rhs.url &&
            lhs.type == rhs.type &&
            lhs.fileName == rhs.fileName &&
            lhs.fileSubPath == rhs.fileSubPath
    }
}
