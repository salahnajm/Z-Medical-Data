//
//  DiagnosisModel.swift
//  Medical App
//
//  Created by Salah Najm on 9/29/22.
//

import Foundation

class DiagnosisModel: ObservableObject  {
    
    @Published var constitutionalSymptoms:Set = [
        "Weight Loss",
        "Night Sweats",
        "Fatigue",
        "No Appetite",
        "Fever",
        "Chills"]
    
    @Published var eyelSymptoms:Set = [
        "Visual Changes",
        "Eye Pain",
        "Double Vision"]

    @Published var earsNoseMouthSymptoms:Set = [
        "Runny Nose",
        "Nose Bleed",
        "Sinus Pain",
        "Stuffy Ears",
        "Ringing in Ears",
        "Sore Throat",
    "Pain with Swallowing",
        "Bleeding Gums"
    ]

    @Published var heartSymptoms:Set = [
        "Chest Pain",
        "Shortness of Breath",
        "Exercise Interolerance",
        "Can't Sleep Flat",
        "Swelling in Ankles",
        "Palpitations"]
   
    @Published var LungSymptoms:Set = [
        "Cough",
        "Sputum",
        "Coughing Blood",
        "Wheezing",
        ]
    
    @Published var gastroentestinalSymptoms:Set = [
    "Blood in Stools",
    "Cant eat",
    "Vomiting",
    "Bloating",
    "Nausea",
    "Cramping",
    "Constipation",
    "Black stool",
    "Diarrhea",
    "Vomiting blood",
    "Indigestion",
    "Difficulty Swallowing",
    "Abdominal pain",
    "Weight loss"
    ]
    
    @Published var genitourinarySymptoms:Set = [
    "Heavy Menses","Cant pee","Difficulty Peeing","Painful Urination","Incontinence ","Blood in Urine","Frequent Urination","Weak Urine Stream"]
    
    @Published var femaleSymptoms:Set = [
    "Breast discharge","breast sore","breast swelling","breast pain","Irregular Menses","Frequent Menses","Vaginal Discharge","No Menses","Light Menses"]
    
    @Published var musculoskeletalSymptoms:Set = [
   "Pain", "Morning Stiffness","Joint Swelling","Decreased range of Motion","Crepitus","Arthritis"]
    
    @Published var skinSymptoms:Set = [
    "Itchy","Rashes","Lump","Eczema", "Discoloration"]

    @Published var neuroSymptoms:Set = [
    "Poor Balance","Changes in Smell","Changes in Sight","Changes in Taste","Changes in Hearing","Seizures","Faint","Cant move Part of Body","Numbness","Pains and Needles","Passing out","Speech Problems","Headache"]
    
    }
