## Getting GAT items
library(dplyr)
library(readr)
library(stringr)

items <- read_csv("GAT items.csv") %>% filter(!str_detect(`[PDE] VAR_BUSNAME`, "Physical"))

cleaning <- items %>% filter(`[PDE] VAR_NAME` != "na", Construct != "consent", Construct != "date", Construct != "physical activity") %>%
  distinct(Construct, `Item Stem`, `Item Text`, `Response Values`) %>% mutate(
  good_performer =
  case_when(Construct == "bad coping (passive, emotion-based)" ~
              paste("It is not like me at all that", `Item Text`),
            Construct == "catastrophizing" ~
              paste("It is not like me at all that I usually think", `Item Text`),
            Construct == "adaptability" ~
              paste("It is very much like me that", `Item Text`),
            Construct == "character" ~
              paste("In the last four weeks I have always acted with", `Item Text`),
            Construct == "depression" ~
              paste("In the last four weeks I have not at all been bothered by the problem of", `Item Text`),
            Construct == "good coping (active, problem-focused)" ~
              paste("It is very much like me that", `Item Text`),
            Construct == "negative affect" ~
              paste("In the last four weeks I've never felt", `Item Text`),
            Construct == "optimism" ~
              paste("I strongly agree that", `Item Text`),
            Construct == "positive affect" ~
              paste("In the last four weeks I have most of the time felt", `Item Text`),
            `Response Values` == "0 = 1 or 2; 1 = 3 or 4; 2 = 5 or 6; 3 = 7 to 9; 4 = 10 or more" ~
              "On a day I drink I typically have one or two drinks",
            `Item Text` == "How often do you have a drink containing alcohol?" ~
              "I never have a drink containing alcohol",
            `Item Text` == "How often do you have six or more drinks on one occasion?" ~
              "I never have six or more drinks on one occasion",
            Construct == "family closeness" ~
              "I am very close to my family",
            `Item Text` == "How satisfied are you with your family?" ~
              "In the past four weeks I have felt extremely satisfied with my family",
            `Item Text` == "How satisfied are you with your marriage/relationship?" ~
              "In the past four weeks I have felt extremely satisfied with my marriage/relationship",
            `Item Text` == "My family supports my decision to serve in the Army." ~
              paste("I strongly agree that", `Item Text`),
            `Item Text` == "The Army meets my family's needs." ~
              paste("I strongly agree that", `Item Text`),
            `Item Text` == "The Army makes it easy for my family to do well." ~
              paste("I strongly agree that", `Item Text`),
            `Item Text` == "How many people are there who you can always count on if you have serious problems?" ~
              "There are 4 or more people I can always count on if I have serious problems",
            `Item Text` == "I have a best friend." ~
              "I do have a best friend",
            `Item Text` == "I have someone to talk to when I feel down." ~
              "I do have someone to talk to when I feel down",
            `Item Text` == "I have as much contact with friends and family members outside the Army as I want or need." ~
              "I do have as much contact with friends and family members outside the Army as I want or need.",
            `Item Text` == "How many people are there who you can always count on if you have serious problems?" ~
              "I have 4 or more people are there who you can always count on if you have serious problems",
            `Item Text` == "I believe there is a purpose for my life." ~
              paste("It is very much like me that I live my life in a way that", `Item Text`),
            `Item Text` == "I am a person of dignity and worth." ~
              paste("It is very much like me that I live my life in a way that", `Item Text`),
            `Item Text` == "My life has meaning." ~
              paste("It is very much like me that I live my life in a way that", `Item Text`),
            `Item Text` == "I believe that in some way my life is closely connected to all humanity and all the
            world." ~
              paste("It is very much like me that I live my life in a way that", `Item Text`),
            `Item Text` == "The job I am doing in the military has enduring meaning." ~
              paste("It is very much like me that I live my life in a way that", `Item Text`),
            Construct == "work engagement" ~
              paste("It is very much like me that", `Item Text`),
            Construct == "organizational trust (unit)" ~
              paste("I strongly agree that", `Item Text`),
            `Item Text` == "How often do you feel left out?" ~
              "I never feel left out",
            `Item Text` == "How often do you feel close to people?" ~
              "I feel close to people most of the time",
            `Item Text` == "How often do you feel part of a group?" ~
              "I feel part of a group most of the time",
            `Item Text` == "I spend time at interests or hobbies other than work." ~
              "I do spend time at interests or hobbies other than work",
            `Item Text` == "I believe that in some way my life is closely connected to all humanity and all the world." ~
              "It is very much like me that I believe that in some way my life is closely connected to all
              humanity and all the world"),
  bad_performer =
  case_when(Construct == "bad coping (passive, emotion-based)" ~
              paste("It is very much like me", `Item Text`),
            Construct == "catastrophizing" ~
              paste("It is very much like me that I usually think", `Item Text`),
            Construct == "adaptability" ~
              paste("It is not like me at all that", `Item Text`),
            Construct == "character" ~
              paste("In the last four weeks I have never acted with", `Item Text`),
            Construct == "depression" ~
              paste("In the last four weeks I have every day been bothered by the problem of", `Item Text`),
            Construct == "good coping (active, problem-focused)" ~
              paste("It is not like me at all that", `Item Text`),
            Construct == "negative affect" ~
              paste("In the last four weeks most of the time I've felt", `Item Text`),
            Construct == "optimism" ~
              paste("I strongly disagree that", `Item Text`),
            Construct == "positive affect" ~
              paste("In the last four weeks I have never felt", `Item Text`),
            `Response Values` == "0 = 1 or 2; 1 = 3 or 4; 2 = 5 or 6; 3 = 7 to 9; 4 = 10 or more" ~
              "On a day I drink I typically have ten or more drinks",
            `Item Text` == "How often do you have a drink containing alcohol?" ~
              "I have a drink containing 4 or more times a week",
            `Item Text` == "How often do you have six or more drinks on one occasion?" ~
              "I have six or more drinks on one occasion daily or almost daily",
            Construct == "family closeness" ~
              "I am not very close to my family",
            `Item Text` == "How satisfied are you with your family?" ~
              "In the past four weeks I have felt not at all satisfied with my family",
            `Item Text` == "How satisfied are you with your marriage/relationship?" ~
              "In the past four weeks I have felt not at all satisfied with my marriage/relationship",
            `Item Text` == "My family supports my decision to serve in the Army." ~
              paste("I strongly disagree that", `Item Text`),
            `Item Text` == "The Army meets my family's needs." ~
              paste("I strongly disagree that", `Item Text`),
            `Item Text` == "The Army makes it easy for my family to do well." ~
              paste("I strongly disagree that", `Item Text`),
            `Item Text` == "How many people are there who you can always count on if you have serious problems?" ~
              "There are no people I can always count on if I have serious problems",
            `Item Text` == "I have a best friend." ~
              "I do not have a best friend",
            `Item Text` == "I have someone to talk to when I feel down." ~
              "I do not have someone to talk to when I feel down",
            `Item Text` == "I have as much contact with friends and family members outside the Army as I want or need." ~
              "I do not have as much contact with friends and family members outside the Army as I want or need",
            `Item Text` == "How many people are there who you can always count on if you have serious problems?" ~
              "I have no people are there who you can always count on if you have serious problems",
            `Item Text` == "I believe there is a purpose for my life." ~
              paste("It is not like me at all that I live my life in a way that", `Item Text`),
            `Item Text` == "I am a person of dignity and worth." ~
              paste("It is not like me at all that I live my life in a way that", `Item Text`),
            `Item Text` == "My life has meaning." ~
              paste("It is not like me at all that I live my life in a way that", `Item Text`),
            `Item Text` == "I believe that in some way my life is closely connected to all humanity and all the
                      world." ~
              paste("It is not like me at all that I live my life in a way that", `Item Text`),
            `Item Text` == "The job I am doing in the military has enduring meaning." ~
              paste("It is not like me at all that I live my life in a way that", `Item Text`),
            Construct == "work engagement" ~
              paste("It is not like me at all that", `Item Text`),
            Construct == "organizational trust (unit)" ~
              paste("I strongly disagree that", `Item Text`),
            `Item Text` == "How often do you feel left out?" ~
              "I feel left out most of the time",
            `Item Text` == "How often do you feel close to people?" ~
              "I never feel close to people",
            `Item Text` == "How often do you feel part of a group?" ~
              "I never feel part of a group",
            `Item Text` == "I spend time at interests or hobbies other than work." ~
              "I do not spend time at interests or hobbies other than work",
            `Item Text` == "I believe that in some way my life is closely connected to all humanity and all the world." ~
              "It is not like me at all that I believe that in some way my life is closely connected to all
              humanity and all the world"))

## Decisions: Keep stems with reference to time

for(i in 1:length(constructs)) {
filtered <- cleaning %>% filter(Construct == constructs[i]) %>% mutate(Construct =  gsub("\\([^>]+\\)", "",Construct)) %>% mutate(Construct = stringr::str_trim(Construct, side = "both")) %>% mutate(Construct =  gsub(" ", "_", Construct)) %>% select(Construct, bad_performer)
write.table(filtered$bad_performer, paste0("GAT/GAT_bad_performer_",unique(filtered$Construct),".txt"), col.names = FALSE, row.names=FALSE, quote=FALSE)
}
