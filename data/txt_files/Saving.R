# Saving all RDS objects for Website #

#Things that need to be saved
# - codes
# - top_terms_rename
# - desc_tf_idf
# - cooccurence

# Codes
Code <- c("Qualities of a Leader", "Leader development", "Organizational Trust",
          "Diversity in Team", "Negative Qualities", "Team Succes", "Shared Vision",
          "Team Building", "Responsibility", "Cooperation", "Influence", "Intellectual Effciency",
          "Negation of Positive Qualities", "Adaptability", "Team Orientation",
          "Commitment to Serve", "Communication", "Integrity")
Type <- c("A Priori","A Priori", "A Priori", "Emergent", "Emergent", "A Priori", "Emergent", "A Priori",
          "A Priori", "Emergent", "Emergent", "A Priori", "Emergent", "A Priori", "A Priori", "A Priori",
          "A Priori", "Emergent" )
Definition <- c("Specifies a characteristic that is important to being a good leader. Clearly connects this quality to success in leadership.
                Code is always paired with specific qualities.","Deliberate, continuous, and progressive process, founded in Army Values,
                that grows others into competent, committed, professional leaders of character.", "Assesses three dimensions of organizational trust: ability,
                benevolence, and integrity. Encapsulates trust in the broader organization of the Army, not in a particular individual. Other terms
                include culture of trust includes indoctrination.", "Differences in team members in areas such as background, religion, race,
                socioeconomic status, or areas of expertise. Includes diversity in skill and background.", "If paired with a code, it talks about
                that other code in a bad way. If on its own, it describes a negative quality or behavior like over drinking.",
                "Describe what it means to be a successful team or how team success may be measured.", "Common and clear goals and vision
                that members of a team identify with and uphold. This is on a smaller level, for example your unit knows exactly what your expected
                outcome is.", "Actions or processes that encourage members to work together.", "Individuals are dependable, reliable, and make
                every effort to keep their promises.", "Measures agreeableness, trust, skepticism and suspicion; the extent an individual is
                easy or difficult to get along with. Includes cohesion.", "Having an effect or influence on another person or organization.",
                "Measures a person’s ability to analyze and process information, astuteness or obtuseness. For innovation, use this & adaptability
                Includes efficiency in skill.", "This makes any positive quality negative. It must also be selected with a positive quality.
                For example, if a passage described poor communication, you would select this and then communication.", "Assesses the ability
                to alter one's course, and perceived cognitive flexibility. For innovation, use this & intellectual efficiency.",
                "Measures a person’s tendency to prefer working in teams and make people work together better.",
                "Measures a person’s level of identification with the military and their strength of desire to serve their country.",
                "Exchange of information between individuals. Includes verbal and non-verbal.",
                "Having honest and strong moral principles.")
themes <- data.frame(Code, Type, Definition)

detaileddf

####################################################################### SAVING
# Save objects ---------
saveRDS(themes, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/themes.RDS")
saveRDS(top_terms_rename, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/top_terms_rename.RDS")
saveRDS(desc_tf_idf, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/desc_tf_idf.RDS")
saveRDS(cooccurence, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/cooccurence.RDS")


