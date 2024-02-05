final Map<String, String> questionsAndHints = {
  // Previous questions and hints...
  "Name": "Your full name as per official records.",
  "Date of Birth": "Your date of birth in the format 'Month Day, Year'.",
  "Place of Birth": "The city or place where you were born.",
  "Nationality": "Your nationality or citizenship.",
  "Gender": "Your gender identity, e.g., Male, Female, Non-binary.",
  "Marital Status":
      "Your current marital status, e.g., Single, Married, Divorced.",
  "Number of Dependents": "The number of people financially dependent on you.",
  "Education Level": "Your highest level of education achieved.",
  "Field of Study": "The field or major you studied in during your education.",
  "Current Job Title": "Your current job title or role at your workplace.",
  "Industry": "The industry or sector in which your current job is based.",
  "Years of Experience":
      "The total number of years of professional experience you have.",
  "Languages Spoken":
      "Languages you are proficient in, e.g., English, Spanish.",
  "Professional Skills":
      "Key skills or competencies relevant to your profession.",
  "Hobbies": "Your hobbies and leisure activities you enjoy.",
  "Favorite Book": "The title of your favorite book and its author.",
  "Favorite Movie": "The title of your favorite movie.",
  "Favorite Music Genre": "Your preferred music genre, e.g., Rock, Pop, Jazz.",
  "Favorite Food": "Your favorite type of cuisine or specific dish.",
  "Dietary Restrictions":
      "Any dietary restrictions or food allergies you have.",
  "Exercise Habits":
      "How often you engage in physical exercise, e.g., 'Gym 3 times a week'.",
  "Favorite Sports": "Your favorite sports or physical activities.",
  "Favorite Travel Destinations": "Places you love to visit for vacations.",
  "Places Lived": "List of places or cities you have lived in.",
  "Dream Vacation": "Your ideal vacation destination or experience.",
  "Favorite Artist": "Your favorite artist or painter.",
  "Favorite Band": "The name of your favorite musical band or group.",
  "Political Views":
      "Your political beliefs or views, e.g., Liberal, Conservative.",
  "Religious Views": "Your religious beliefs or views.",
  "Volunteering Interests":
      "Areas or causes you are interested in for volunteering.",
  "Environmental Concerns":
      "Specific environmental issues you are concerned about.",
  "Personal Values":
      "Values that are important to you, e.g., 'Honesty, Integrity'.",
  "Learning Interests":
      "Areas of interest for learning, e.g., 'Machine Learning'.",
  "Recent Books Read": "The titles of books you've read recently.",
  "Favorite TV Shows": "Your favorite TV shows or series.",
  "Favorite Podcasts": "The names of your favorite podcasts.",
  "Technology Interests": "Specific areas of interest within technology.",
  "Apps You Can't Live Without": "Apps you rely on in your daily life.",
  "Favorite Video Games": "Your favorite video games or gaming franchises.",
  "Musical Instruments Played": "Any musical instruments you can play.",
  "Artistic Talents":
      "Your talents or skills in the arts, e.g., drawing, painting.",
  "Writing Experience":
      "Your experience in writing, such as blogs or short stories.",
  "Public Speaking Experience":
      "Your experience with public speaking, e.g., Toastmasters or conferences.",
  "Leadership Experience": "Instances where you have held leadership roles.",
  "Mentoring Experience": "Your experience as a mentor, if any.",
  "Entrepreneurial Experience":
      "Any experience in starting or running a business.",
  "Investment Experience":
      "Your experience with investments, including stocks or cryptocurrency.",
  "Personal Finance Management":
      "How you manage your personal finances, e.g., budgeting.",
  "Favorite Cuisine": "Your preferred type of cuisine or dishes.",
  "Cooking Skills": "Your proficiency in cooking, e.g., beginner or expert.",
  "Favorite Restaurants": "Names of your favorite restaurants or eateries.",
  "Allergies": "Any allergies or food sensitivities you have.",
  "Health and Wellness Practices":
      "Practices you follow for health and wellness.",
  "Stress Management Techniques":
      "Techniques you use to manage stress, e.g., running or reading.",
  "Favorite Authors": "Names of your favorite authors.",
  "Inspirational Figures": "People who inspire you or you look up to.",
  "Major Life Influences":
      "Key individuals or experiences that have influenced your life.",
  "Favorite Historical Period": "Your favorite historical era or period.",
  "Interest in Arts":
      "Your interest in various forms of art, e.g., painting or sculpture.",
  "Favorite Museums": "Names of your favorite museums.",
  "Volunteer Experience": "Details about your past volunteer experiences.",
  "Favorite Comics": "Your favorite comic book universes or series.",
  "Board Games Preference":
      "Your preference for board games, e.g., Catan or Monopoly.",
  "Outdoor Activities": "Outdoor activities you enjoy, e.g., hiking or biking.",
  "Indoor Activities":
      "Indoor activities or hobbies you like, e.g., reading or cooking.",
  "Favorite Magazines/Blogs": "Names of your favorite magazines or blogs.",
  "Social Media Platforms Used":
      "The social media platforms you are active on.",
  "Favorite Websites": "Websites you frequently visit or enjoy.",
  "Online Learning Platforms Used":
      "Platforms you use for online learning or courses.",
  "Certifications Acquired":
      "Any professional certifications you have obtained.",
  "Workshops or Courses Attended":
      "Recent workshops or courses you have attended.",
  "Recent Movies Watched": "The titles of movies you've watched recently.",
  "Favorite Actors/Actresses": "Names of your favorite actors or actresses.",
  "Recent Concerts or Shows": "Concerts or shows you have attended recently.",
  "Favorite Festivals": "Your favorite festivals or cultural events.",
  "Travel Mode Preference":
      "Your preferred mode of travel, e.g., flight or road trips.",
  "Recent Travels": "Details about your recent travel destinations.",
  "Dream Destinations": "Locations you dream of visiting in the future.",
  "Photography Interest":
      "Your interest in photography, e.g., landscape or portrait.",
  "Film or Digital Photography": "Preference for film or digital photography.",
  "Favorite Mobile Apps": "Mobile apps you consider essential.",
  "Technology Gadgets Owned":
      "Types of technology gadgets you own, e.g., smartphone or laptop.",
  "Gaming Consoles Owned":
      "Gaming consoles you have, e.g., PlayStation or Nintendo Switch.",
  "Subscription Services Used":
      "Subscription services you subscribe to, e.g., Netflix or Amazon Prime.",
  "Favorite Genres of Literature":
      "Genres of literature you enjoy, e.g., Science Fiction or Mystery.",
  "Writing Habits": "Your writing habits, e.g., journaling or blogging.",
  "Public Speaking Interest": "Your level of interest in public speaking.",
  "Participated Sports":
      "Sports you actively participate in, e.g., basketball or swimming.",
  "Athletic Achievements": "Notable athletic achievements, if any.",
  "Favorite Brands": "Your favorite brands, e.g., Apple or Nike.",
  "Shopping Preferences": "Your preferences for online or in-store shopping.",
  "Environmental Initiatives":
      "Efforts you make to support environmental causes.",
  "Social Causes Supported": "Causes or charities you actively support.",
  "Pet Ownership": "Information about your pets, e.g., type and name.",
  "Favorite Types of Pets": "Types of pets you have a preference for.",
  "Home Ownership Status": "Whether you own or rent your home and its details.",
  "Investment Interests":
      "Your interests in investments, e.g., real estate or stocks.",
  "Retirement Planning": "Plans or strategies you have for retirement.",
  "Insurance Types":
      "Types of insurance you have, e.g., health or life insurance.",
  "Health and Fitness Goals": "Your goals related to health and fitness.",
  "Stress Relief Methods":
      "Methods you use to relieve stress, e.g., meditation or yoga.",
  "Skincare Routine": "Your skincare routine or products you use.",
  "Favorite Clothing Brands": "Brands you prefer for clothing and fashion.",
  "Fashion Style": "Your fashion style or clothing preferences.",
  "Favorite Artists (Music)": "Your favorite music artists or musicians.",
  "Concerts Attended Recently":
      "Recent concerts or music shows you've attended.",
  "Musical Instruments Interested In":
      "Musical instruments you are interested in learning or playing.",
  "Phone Number": "Your contact phone number.",
  "Address": "Your current residential address.",
};
