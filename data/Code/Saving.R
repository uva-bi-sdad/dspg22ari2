# Saving all RDS objects for Website #
####################################################################### SAVING
# Save objects ---------
saveRDS(themes, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/themes.RDS")
saveRDS(themes_detailed, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/themes_detailed.RDS")
saveRDS(top_terms_rename, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/top_terms_rename.RDS")
saveRDS(desc_tf_idf, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/desc_tf_idf.RDS")
saveRDS(cooccurence, file= "/home/jme6bk/github/dspg22ari2/src/web/RDS/cooccurence.RDS")

#Things that need to be saved
# - codes
# - top_terms_rename
# - desc_tf_idf
# - cooccurence

####################################################################### SAVING

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

Examples <- c("Leaders can display character by completing tasks on time and modeling standards for performance, personal appearance,
              physical fitness, and ethics. They can also display character by modeling sound judgement and reasoning, determination,
              persistence, and patience", "Leader development is a continuous lifelong learning process beginning with pre-appointment
              training and education.", "We all have an important job to do, necessary to the unit’s missions. Soldiers throughout the
              Army perform the duties of medics, infantrymen, cooks, truck drivers, mechanics, legal clerks, aviators, and other occupations.
              We bring fuel to the tanks, scout for the enemy, listen to the enemy’s signals, and close in and defeat the enemy.
              We defend against air attacks, ensure Soldiers are paid accordingly, and process awards to recognize other Soldier’s
              accomplishments. As important as individual Soldier tasks are, we all know that these efforts support a team and that the
              whole is greater than the sum of its parts. Every team has a leader, and that leader is responsible for what the team does
              or fails to do. That is why obeying orders is the critical essence of discipline.", "Variation in upbringing, culture,
              religious belief, and tradition is reflected among those who choose to serve in the Army. Such diversity provides many
              benefits for a force globally engaged around the world. Good leaders value this diversity of outlook and experience and
              must treat all individuals with the inherent dignity and respect due every person.", "Misunderstands or fails to perceive
              nonverbal cues. Ideas not well organized or easily understandable. Speaks without considering listener interest.
              Information dissemination is inconsistent or untimely.", "High performance teams demonstrate mental agility (see ADRP 6-22)
              in their willingness to approach problems from different viewpoints and to hold and work on opposing ideas until identifying
              the best solution", "Shared vision exists when members of the team have a common understanding of the following: The overall
              mission or objective. Goals and sub-goals of the mission. Strategies for reaching those goals. Team members’ strengths and weaknesses.
              Values and preferences of the team as a whole and among the individual members. The roles each member will play and want.
              The big picture (such as how this particular mission contributes to a larger purpose).", "The team-building approach addresses
              the interaction and relationships among team members essential to collaboration and critical to high performance.
              It accelerates collaboration by allowing the team members to further develop qualities of shared vision, trust, competence,
              and confidence among team members. It is a streamlined approach designed to break through barriers and boundaries that stagnate
              team development.", "The general responsibilities of a Soldier are as follows: Obey the lawful orders of NCOs and Officers.
              Treat others with dignity and respect. Complete each task to the very best degree possible and not just to standard.
              Maintain a military appearance. Maintain individual physical fitness standards and readiness. Maintain individual equipment
              and clothing to standard.", "Exemplifies a positive attitude and expectations for a productive work environment.
              Conveys a priority for development within the organization. Encourages innovative, critical, and creative thought.
              Leverages lessons learned to improve organization.", "Projects self-confidence and inspires confidence in others.
              Models composure, an outward calm, and control over emotions in adverse situations. Manages personal stress, and remains
              supportive of stress in others.", "Demonstrates expert-level proficiency with technical aspects of job. Demonstrates understanding
              of joint, cultural and geopolitical knowledge. Conveys knowledge of technical, technological, and tactical systems to
              subordinates and others.", "Communication frequency was negatively related to both ROI and sales growth, contrary to what had
              been hypothesized. Smith et al. (1994) suggested that perhaps communication frequency is indicative of high levels of conflict
              in the group, and that the time spent on group maintenance detracts from performance.", "Models a flexible mindset and anticipates
              changing conditions. Engages in multiple approaches when assessing, conceptualizing, and evaluating a course of action.", "The success of
              the U.S. Army is related directly to the quality of the professional relationships between its Soldiers, NCOs, and officers.
              The relationship between an individual Soldier, team, squad, and platoon with their NCO/officer is the cornerstone of our Army.
              When that bond forms, it can have the single most important impact on unit effectiveness and efficiency. Conversely, if that bond is broken,
              it can have a devastating impact on morale, esprit de corps, readiness, and mission accomplishment.", "The pride, esprit, and ethos
              required of Soldiers as members of the Profession of Arms may require them to sacrifice themselves willingly to preserve the Nation,
              accomplish the mission, or protect the lives of fellow Soldiers.", "The questioning creates dialogue, which improves awareness and
              leads to a higher degree of actionable understanding. Through the dialogue, the team develops shared understanding and trust.
              When coaching a team exercise: Frame initial questions to clarify the task and the situation. There will often be disagreements on both.
              Find common ground. Try to get the team to come to agreement on one issue. Build to another agreement. When there is disagreement,
              try to get at the specifics of what is disagreed upon, before building to said Agreement.", "Character is comprised of a person’s
              moral and ethical qualities, helps determine what is right, and gives a leader motivation to do what is appropriate, regardless of
              the circumstances or consequences. It determines who people are, how they act, helps determine right from wrong, and choose what is right.")

themes_detailed <- data.frame(Code, Type, Definition, Examples)



