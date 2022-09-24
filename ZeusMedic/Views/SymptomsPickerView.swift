//
//  SymptomsPickerView.swift
//  ZeusMedic
//
//  Created by Salah Najm on 9/23/22.
//

import SwiftUI

struct SymptomsPickerView: View {
    
    //Constitutional
    @State  var weightLoss:Bool = false
    @State  var nightSweats:Bool = false
    @State  var fatigue:Bool = false
    @State  var noAppetite:Bool = false
    @State  var fever:Bool = false
    @State  var chills:Bool = false
    
    //Eyes
    @State  var visualChanges:Bool = false
    @State  var headaches:Bool = false
    @State  var eyePain:Bool = false
    @State  var doubleVision:Bool = false
    
    //Ears, nose, mouth, and throat
    @State  var runnyNose:Bool = false
    @State  var noseBleed:Bool = false
    @State  var sinusPain:Bool = false
    @State  var stuffyEars:Bool = false
    @State  var RingingInEars:Bool = false
    @State  var soreThroat:Bool = false
    @State  var painWithSwallowing:Bool = false
    @State  var bleedingGums:Bool = false
    
    //Heart
    @State  var chestPains:Bool = false
    @State  var shortnessOfBreath:Bool = false
    @State  var exerciseIntolerance:Bool = false
    @State  var cantSleepFlat:Bool = false
    @State  var swellingInAnkles:Bool = false
    @State  var palpitations:Bool = false
    
    //Lungs
    @State  var cough:Bool = false
    @State  var sputum:Bool = false
    @State  var coughingBlood:Bool = false
    @State  var wheezing:Bool = false
    
    //Gastroentestinal
    @State  var abdominalPain:Bool = false
    @State  var difficultySwallowing:Bool = false
    
    var body: some View {
        
        
        GeometryReader { geo in
            ScrollView {
                VStack{
                    
                    Text("Select Symptoms")
                        .font(Font.titleText)
                    Group {
                        // Constitutional
                        HStack {
                            
                            Image(systemName: "thermometer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:30)
                                .padding(30)
                                .tint(Color("icons-secondary"))
                            
                            VStack {
                                
                                //    Weight loss    nightSweats    fatigue            noAppetite    fever    chills
                                HStack {
                                    Button {
                                        
                                        weightLoss.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Weight loss")
                                            .foregroundColor(!weightLoss ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        nightSweats.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Night sweats")
                                            .foregroundColor(!nightSweats ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        fatigue.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Fatigue")
                                            .foregroundColor(!fatigue ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        noAppetite.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "No Appetite")
                                            .foregroundColor(!noAppetite ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                }
                                HStack {
                                    Button {
                                        
                                        fever.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Fever")
                                            .foregroundColor(!fever ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        chills.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Chills")
                                            .foregroundColor(!chills ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                        
                                        
                                    }
                                }
                            }
                            
                        }
                        
                        Divider()
                        
                        // Eyes
                        HStack {
                            
                            Image(systemName: "eye")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:20)
                                .padding(30)
                                .tint(Color("icons-secondary"))
                            
                            
                            //  Eyes: Visual changes    Headaches    eye pain    double vision
                            
                            
                            Button {
                                
                                visualChanges.toggle()
                                
                            } label: {
                                BoxButtonZM(label: "Visual changes")
                                    .foregroundColor(!visualChanges ? Color("icons-input"): Color("bubble-secondary"))
                                    .frame(width: geo.size.width/6, height: geo.size.width/7)
                            }
                            Button {
                                
                                headaches.toggle()
                                
                            } label: {
                                BoxButtonZM(label: "Headache")
                                    .foregroundColor(!headaches ? Color("icons-input"): Color("bubble-secondary"))
                                    .frame(width: geo.size.width/6, height: geo.size.width/7)
                            }
                            Button {
                                
                                eyePain.toggle()
                                
                            } label: {
                                BoxButtonZM(label: "Eye pain")
                                    .foregroundColor(!eyePain ? Color("icons-input"): Color("bubble-secondary"))
                                    .frame(width: geo.size.width/6, height: geo.size.width/7)
                            }
                            Button {
                                
                                doubleVision.toggle()
                                
                            } label: {
                                BoxButtonZM(label: "double vision")
                                    .foregroundColor(!doubleVision ? Color("icons-input"): Color("bubble-secondary"))
                                    .frame(width: geo.size.width/6, height: geo.size.width/7)
                            }
                            
                            
                            
                        }
                        
                        Divider()
                        
                        // Ear, Nose and Throat
                        HStack {
                            
                            Image(systemName: "nose")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:30)
                                .padding(30)
                                .tint(Color("icons-secondary"))
                            
                            VStack {
                                
                                //Ears, nose, mouth, and throat: Runny nose    Nose bleed    Sinus pain    Stuffy ears    ringing in ears    gingival bleed   sore throat    pain with swallowing
                                
                                HStack {
                                    Button {
                                        
                                        runnyNose.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Runny nose")
                                            .foregroundColor(!runnyNose ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        noseBleed.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Nose bleed")
                                            .foregroundColor(!noseBleed ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        sinusPain.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Sinus pain")
                                            .foregroundColor(!sinusPain ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        stuffyEars.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Stuffy ears")
                                            .foregroundColor(!stuffyEars ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                }
                                HStack {
                                    Button {
                                        
                                        RingingInEars.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Ringing in ears")
                                            .foregroundColor(!RingingInEars ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        bleedingGums.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Bleeding gums")
                                            .foregroundColor(!bleedingGums ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                        
                                        
                                    }
                                    Button {
                                        
                                        soreThroat.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Sore throat")
                                            .foregroundColor(!soreThroat ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                        
                                        
                                    }
                                    Button {
                                        
                                        painWithSwallowing.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Pain with swallowing")
                                            .foregroundColor(!painWithSwallowing ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                        
                                        
                                    }
                                }
                            }
                            
                        }
                        
                        Divider()
                        
                        // Heart
                        HStack {
                            
                            Image(systemName: "heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:30)
                                .padding(30)
                                .tint(Color("icons-secondary"))
                            
                            VStack {
                                
                                HStack {
                                    Button {
                                        
                                        chestPains.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Chest pain")
                                            .foregroundColor(!chestPains ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        shortnessOfBreath.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Shortness of breath")
                                            .foregroundColor(!shortnessOfBreath ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        exerciseIntolerance.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Can't Exercise")
                                            .foregroundColor(!exerciseIntolerance ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        cantSleepFlat.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Can't sleep flat")
                                            .foregroundColor(!cantSleepFlat ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                }
                                HStack {
                                    Button {
                                        
                                        swellingInAnkles.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Swelling in ankles")
                                            .foregroundColor(!swellingInAnkles ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        palpitations.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Palpitations")
                                            .foregroundColor(!palpitations ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                        
                                    }
                                    
                                }
                            }
                            
                        }
                        
                        Divider()
                        
                        // Lungs
                        HStack {
                            
                            Image(systemName: "lungs")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:30)
                                .padding(30)
                                .tint(Color("icons-secondary"))
                            
                            VStack {
                                
                                HStack {
                                    Button {
                                        
                                        sputum.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Sputum")
                                            .foregroundColor(!sputum ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        coughingBlood.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Coughing blood")
                                            .foregroundColor(!coughingBlood ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        cough.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Cough")
                                            .foregroundColor(!cough ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    Button {
                                        
                                        shortnessOfBreath.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Shortness of breath")
                                            .foregroundColor(!shortnessOfBreath ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                }
                                HStack {
                                    Button {
                                        
                                        wheezing.toggle()
                                        
                                    } label: {
                                        BoxButtonZM(label: "Wheezing")
                                            .foregroundColor(!wheezing ? Color("icons-input"): Color("bubble-secondary"))
                                            .frame(width: geo.size.width/6, height: geo.size.width/7)
                                    }
                                    
                                }
                            }
                            
                        }
                    }
                    
                    Divider()
                    
                    // Gastroentestinal
                    
                    //Abdominal pain  Difficulty swallowing    indigestion    Bloating    Cramping    Can't eat    diarrhea    constipation    nausea    vomiting    blood in stools    vomiting blood    Black smelly stool
                    HStack {
                        
                        Image(systemName: "lungs")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height:30)
                            .padding(30)
                            .tint(Color("icons-secondary"))
                        
                        VStack {
                            
                            HStack {
                                Button {
                                    
                                    abdominalPain.toggle()
                                    
                                } label: {
                                    BoxButtonZM(label: "Abdominal Pain")
                                        .foregroundColor(!abdominalPain ? Color("icons-input"): Color("bubble-secondary"))
                                        .frame(width: geo.size.width/6, height: geo.size.width/7)
                                }
                                Button {
                                    
                                    difficultySwallowing.toggle()
                                    
                                } label: {
                                    BoxButtonZM(label: "Difficulty swallowing")
                                        .foregroundColor(!difficultySwallowing ? Color("icons-input"): Color("bubble-secondary"))
                                        .frame(width: geo.size.width/6, height: geo.size.width/7)
                                }
                                Button {
                                    
                                    cough.toggle()
                                    
                                } label: {
                                    BoxButtonZM(label: "Cough")
                                        .foregroundColor(!cough ? Color("icons-input"): Color("bubble-secondary"))
                                        .frame(width: geo.size.width/6, height: geo.size.width/7)
                                }
                                Button {
                                    
                                    shortnessOfBreath.toggle()
                                    
                                } label: {
                                    BoxButtonZM(label: "Shortness of breath")
                                        .foregroundColor(!shortnessOfBreath ? Color("icons-input"): Color("bubble-secondary"))
                                        .frame(width: geo.size.width/6, height: geo.size.width/7)
                                }
                            }
                            HStack {
                                Button {
                                    
                                    wheezing.toggle()
                                    
                                } label: {
                                    BoxButtonZM(label: "Wheezing")
                                        .foregroundColor(!wheezing ? Color("icons-input"): Color("bubble-secondary"))
                                        .frame(width: geo.size.width/6, height: geo.size.width/7)
                                }
                                
                            }
                        }
                        
                    }
                    
                    Divider()
                    
               
                    
                    //   Gastrointestinal
                    
                    //Skin: itchy    rashes    lump    eczema    nodules    discoloration
                    
                    //  Genitourinary
                    
                    //  Musculoskeletal
                    
                    // Skin
                    
                    // Neurologic
                    
                    // Psychiatric
                    
                    //   Endocrine
                    
                    // Hematologic/lymphatic
                    
                    //Allergic/immunologic
                    
                    
                    
                }
                    
                    Button {
                        //Action
                        
                        
                    } label: {
                        ButtonZM(buttonText: "Submit")
                        
                    }.padding(.horizontal)
                    
                    
                }
                .font(Font.caption)
                
            
        }
        
    }
    
}


struct SymptomsPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsPickerView()
    }
}
