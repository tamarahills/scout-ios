//
//  VoiceInputAssembly.swift
//  Scout
//
//  Created by Shurupov Alex on 5/20/18.
//

import Foundation
import UIKit

class VoiceInputAssembly: VoiceInputAssemblyProtocol {
    let applicationAssembly: ApplicationAssemblyProtocol

    required init(withAssembly assembly: ApplicationAssemblyProtocol) {
        self.applicationAssembly = assembly
    }

    func assemblyVoiceInputViewController() -> VoiceInputViewController {
        let voiceInputVC = self.storyboard.instantiateViewController(
            // swiftlint:disable:next force_cast
            withIdentifier: "VoiceInputViewController") as! VoiceInputViewController
        voiceInputVC.scoutClient = self.applicationAssembly.assemblyNetworkClient() as? ScoutHTTPClient
        voiceInputVC.speechService = self.applicationAssembly.assemblySpeechService() as? SpeechService

        return voiceInputVC
    }
}

// MARK: -
// MARK: Storyboard
fileprivate extension VoiceInputAssembly {
    var storyboard: UIStoryboard { return UIStoryboard(name: "VoiceInput", bundle: nil) }
}
