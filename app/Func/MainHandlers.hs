
    -- -- let testDiagnosis = [Diagnosis "g1" [Symptoms "ali", Symptoms "aba", Symptoms "asa"] ["proced", "proced", "proced"] ["drug", "drug"], 
    -- --                     Diagnosis "g2" [Symptoms "nun", Symptoms "sus"] ["proced", "proced", "proced"] ["drug", "drug"], 
    -- --                     Diagnosis "g3" [Symptoms "ali", Symptoms "asa", Symptoms "ogo"] ["proced", "proced", "proced"] ["drug", "drug"],
    -- --                     Diagnosis "g4" [Symptoms "n7", Symptoms "n8", Symptoms "n1"] ["proced", "proced", "proced"] ["drug", "drug"], 
    -- --                     Diagnosis "g5" [Symptoms "2n", Symptoms "3n"] ["proced", "proced", "proced"] ["drug", "drug"], 
    -- --                     Diagnosis "g6" [Symptoms "ali", Symptoms "n5", Symptoms "n6"] ["proced", "proced", "proced"] ["drug", "drug"]]


    -- let testSymptom = [Symptoms  "ali", Symptoms  "aba"] 

    -- -- print(show(findDiagnos arr testSymptom))

    
        let testDiagnosis = [Diagnosis "Fungal infection" [Symptoms "itching", Symptoms "skinrash", Symptoms "patches"] ["Taking pills", "Applying ointments"] ["clotrimazole", "miconazole", "ketoconazole"], 
                        Diagnosis "Allergy" [Symptoms "shivering", Symptoms "chills", Symptoms "continuoussneezing"] ["Taking pills", "Applying ointments", "Inhalation"] ["Cetirizine", "Desloratadine", "Levocetirizine"],
                        Diagnosis "GERD" [Symptoms "stomachpain", Symptoms "vomiting", Symptoms "cough"] ["Taking pills", "Injections"] ["Esomeprazole", "lansoprazole", "Omeprazole"],
                        Diagnosis "Peptic ulcer diseae" [Symptoms "vomiting", Symptoms "indigestion", Symptoms "abdominalpain"] ["Taking pills", "Injections"] ["Omeprazole", "Esomeprazole", "lansoprazole"],
                        Diagnosis "Diabetes" [Symptoms "fatigue", Symptoms "weightloss", Symptoms "lethargy", Symptoms "obesity"] ["Injections", "Sugar control"] ["Glimepiride", "Glipizide"],
                        Diagnosis "Gastroenteritis" [Symptoms "vomiting", Symptoms "sunkeneyes", Symptoms "dehydration", Symptoms "diarrhoea"] ["Taking pills", "Injections"] ["Loperamide", "Kaopectate"],
                        Diagnosis "Bronchial Asthma" [Symptoms "fatigue", Symptoms "cough", Symptoms "highfever", Symptoms "breathlessness"] ["Injections", "Drop counter"] ["Flovent HFA", "Pulmicort Respules", "Xhance"],
                        Diagnosis "Migraine" [Symptoms "indigestion", Symptoms "headache", Symptoms "stiffneck", Symptoms "depression"] ["Taking pills", "Sun less", "Noize less"] ["Sumatriptan", "Rizatriptan"],
                        Diagnosis "Jaundice" [Symptoms "itching", Symptoms "vomiting", Symptoms "fatigue", Symptoms "yellowishskin", Symptoms "darkurine"] ["Injections", "Drop counter"] ["Cholestyramine", "Colestipol"],
                        Diagnosis "Malaria" [Symptoms "chills", Symptoms "vomiting", Symptoms "highfever", Symptoms "sweating", Symptoms "headache", Symptoms "nausea"] ["Injections", "Drop counter"] ["Chloroquine", "Mefloquine", "Proguanil"],
                        Diagnosis "Chicken pox" [Symptoms "itching", Symptoms "skinrash", Symptoms "fatigue", Symptoms "lethargy", Symptoms "highfever", Symptoms "malaise"] ["Injections", "Taking pills"] ["Acyclovir", "Zovirax"],
                        Diagnosis "Dengue" [Symptoms "chills", Symptoms "jointpain", Symptoms "nausea", Symptoms "highfever"] ["Injections", "Taking pills", "Drop counter"] ["Acetaminophen", "Aspirin"], 
                        Diagnosis "Typhoid" [Symptoms "chills", Symptoms "constipation", Symptoms "vomiting"] ["Taking pills", "Drop counter"] ["Ciprofloxacin", "Azithromycin"],
                        Diagnosis "Tuberculosis" [Symptoms "cough", Symptoms "fatigue", Symptoms "sweating", Symptoms "lossofappetite" ] ["Injections", "Drop counter"] ["Isoniazid", "Pyrazinamide", "Rifampin"],
                        Diagnosis "Common Cold" [Symptoms "continuoussneezing", Symptoms "cough", Symptoms "fatigue", Symptoms "headache", Symptoms "phlegm"] ["Taking pills", "Inhalation"] ["Pseudoephedrine", "Phenylephrine nasal "],
                        Diagnosis "Pneumonia" [Symptoms "chills", Symptoms "fatigue", Symptoms "cough", Symptoms "breathlessness", Symptoms "chestpain"] ["Taking pills", "Inhalation", "Drop counter"] ["Cleocin", "Acticlate", "Zithromax"],
                        Diagnosis "Heart attack" [Symptoms "vomiting", Symptoms "breathlessness", Symptoms "chestpain"] ["Defibrillation", "Injections", "Drop counter"] ["Thrombolytics", "Pain relievers", "ACE inhibitors"],
                        Diagnosis "Varicose veins" [Symptoms "fatigue", Symptoms "cramps", Symptoms "bruising", Symptoms "swollenlegs"] ["Surgery", "Drop counter", "Injections"] ["Polidocanol", "Asclera", "Sotradecol"],
                        Diagnosis "Osteoarthristis" [Symptoms "neckpain", Symptoms "kneepain", Symptoms "swellingjoints", Symptoms "painfulwalking"] ["Surgery", "Injections", "Taking pills"] ["Acetaminophen", "Duloxetine"],
                        Diagnosis "Arthritis" [Symptoms "muscleweakness", Symptoms "stiffneck", Symptoms "movementstiffness"] ["Surgery", "Taking pills", "Applying ointments"] ["Counterirritants", "Steroids", "NSAIDs"],
                        Diagnosis "Acne" [Symptoms "skinrash", Symptoms "blackheads", Symptoms "pusfilledpimples"] ["Applying ointments", "Taking pills"] ["Tetracycline", "Macrolide"],
                        Diagnosis "Hepatitis A" [Symptoms "jointpain", Symptoms "vomiting", Symptoms "darkurine", Symptoms "abdominalpain"] ["Taking pills", "Injections", "Drop counter"] ["GamaSTAN S/D", "Immune globulin intramuscular"],
                        Diagnosis "Hepatitis B" [Symptoms "itching", Symptoms "fatigue", Symptoms "lethargy", Symptoms "yellowishskin"] ["Taking pills", "Injections", "Drop counter"] ["Entecavir", "Adefovir"], 
                        Diagnosis "Hepatitis C" [Symptoms "fatigue", Symptoms "familyhistory", Symptoms "yellowingofeyes"] ["Taking pills", "Injections", "Drop counter"] ["Elbasvir", "Grazoprevir"],
                        Diagnosis "Hepatitis D" [Symptoms "jointpain", Symptoms "vomiting", Symptoms "fatigue", Symptoms "yellowishskin"] ["Taking pills", "Injections", "Drop counter"] ["Pegylated interferon alpha", "Sofosbuvir"],
                        Diagnosis "Hepatitis E" [Symptoms "jointpain", Symptoms "fatigue", Symptoms "highfever", Symptoms "fluidoverload"] ["Taking pills", "Injections", "Drop counter"] ["Ribavirin monotherapy", "HEV"],
                        Diagnosis "Dimorphic hemmorhoids" [Symptoms "constipation", Symptoms "painduringbowelmovements", Symptoms "bloodystool", Symptoms "obesity"] ["Taking pills", "Applying ointments"] ["Anecream5 Cream", "Anti-Itch Clear Lotion"],
                        Diagnosis "Hypothyroidism" [Symptoms "fatigue", Symptoms "weightgain", Symptoms "coldhandsandfeets", Symptoms "moodswings"] ["Taking pills", "Injections"] ["levothyroxine", "Synthroid"],
                        Diagnosis "Vertigo" [Symptoms "vomiting", Symptoms "headache", Symptoms "nausea", Symptoms "spinningmovements"] ["Taking pills", "Drop counter"] ["Phenergan", "Antivert", "Dramamine II"]]



    -- fatigue, cough
    -- writeFile "./app/txt/diags.txt" (show testDiagnosis)
    
    -- -- print(show(gradator diags testSymptom))

    -- -- print(show(actDiag))

    -- let str = "cough head ace cold"

    -- let res = composerIn str

    -- -- contents :: String <- readFile "./app/txt/diags.txt"
    -- -- let arr :: [Diagnosis] = read contents

    -- -- let diags = findDiagnos testDiagnosis testSymptom
    -- -- print(show(gradator diags testSymptom))
    -- -- let sortedDiag = sortBy sortGT (gradator diags testSymptom) 
    -- -- let actDiag = head sortedDiag
    -- -- let foo = composerOut actDiag
    --     -- print(show(res, actDiag, foo))
    -- -- writeFile "./app/txt/diags.txt" (show testDiagnosis)
    --     -- putStr foo