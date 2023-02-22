//
//  conditions.swift
//  Medical App
//
//  Created by Salah Najm on 9/30/22.
//

import Foundation

class Conditions:Identifiable, Decodable, Comparable {
    
    //To sort results in order
   
    static func == (lhs: Conditions, rhs: Conditions) -> Bool {
    
        return lhs.conditionScore == rhs.conditionScore
    }
    
    static func < (lhs: Conditions, rhs: Conditions) -> Bool {
        if lhs.conditionScore != rhs.conditionScore {
        }
            return lhs.conditionScore ?? 0 < rhs.conditionScore ?? 0
    }
    
    var conditionScore:Int?
    
    var id:Int?
    var condition:String?
    var description:String?
    var image:String?
    var duration1:Int?
    var duration2:Int?
    var duration3:Int?
    var age1:Int?
    var age2:Int?
    var age3:Int?
    var male:Int?
    var female:Int?
    var weightLoss:Int?
    var nightSweats:Int?
    var fatigue:Int?
    var noAppetite:Int?
    var fever:Int?
    var chills:Int?
    var visualChanges:Int?
    var headaches:Int?
    var eyePain:Int?
    var doubleVision:Int?
    var runnyNose:Int?
    var noseBleed:Int?
    var sinusPain:Int?
    var stuffyEars:Int?
    var ringingInEars:Int?
    var soreThroat:Int?
    var painWithSwallowing:Int?
    var bleedingGums:Int?
    var chestPain:Int?
    var shortnessOfBreath:Int?
    var exerciseIntolerance:Int?
    var cantSleep:Int?
    var swellingInAnkles:Int?
    var palpitations:Int?
    var cough:Int?
    var sputum:Int?
    var coughingBlood:Int?
    var wheezing:Int?
    var bloodInStools:Int?
    var cantEat:Int?
    var vomiting:Int?
    var bloating:Int?
    var nausea:Int?
    var cramping:Int?
    var constipation:Int?
    var blackStools:Int?
    var diarrhea:Int?
    var vomitingBlood:Int?
    var indigestion:Int?
    var difficultySwallowing:Int?
    var abdominalPain:Int?
    var heavyMenses:Int?
    var cantPee:Int?
    var difficultyPeeing:Int?
    var incontinence:Int?
    var bloodInUrine:Int?
    var frequentUrination:Int?
    var weakUrineStream:Int?
    var poorBalance:Int?
    var changesInSmell:Int?
    var changesInSight:Int?
    var changesInTaste:Int?
    var changesInHearing:Int?
    var seizures:Int?
    var faint:Int?
    var cantMovePartOfBody:Int?
    var numbness:Int?
    var painsAndNeedles:Int?
    var passingOut:Int?
    var speechProblems:Int?
    var breastDischarge:Int?
    var breastSore:Int?
    var breastSwelling:Int?
    var breastPain:Int?
    var irregularMenses:Int?
    var frequentMenses:Int?
    var vaginalDischarge:Int?
    var noMenses:Int?
    var lightMenses:Int?
    var itchy:Int?
    var rashes:Int?
    var lump:Int?
    var eczema:Int?
    var discoloration:Int?
    var pain:Int?
    var morningStiffness:Int?
    var jointSwelling:Int?
    var decreasedRangeOfMotion:Int?
    var crepitus:Int?
    var arthritis:Int?
    
}
