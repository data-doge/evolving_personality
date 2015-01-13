questions = [
	{ uid: 0, prompt: "When you go somewhere for the day, you would rather...", choice_a: "Plan what you will do and when", choice_b: "Just go", result_a: "J2", result_b: "P2"},
	{ uid: 1, prompt: "If you were a teacher, what would you rather teach?", choice_a: "Fact courses", choice_b: "Courses involving theory", result_a: "S2", result_b: "N2"},
	{ uid: 2, prompt: "You are usually a...", choice_a: "Good mixer", choice_b: "Rather quiet and reserved", result_a: "E2", result_b: "I2"},
	{ uid: 3, prompt: "You more often let...", choice_a: "Your heart rule your head", choice_b: "Your head rule your heart", result_a: "T2", result_b: "F1"},
	{ uid: 4, prompt: "When doing something that many other people do, it appeals to you more to...", choice_a: "Invent a way of your own", choice_b: "Do it in the accepted way", result_a: "N1", result_b: "S1"},
	{ uid: 5, prompt: "Among your friends, you are...", choice_a: "Full of news about everybody", choice_b: "One of the last to hear what is going on", result_a: "E2", result_b: "I1"},
	{ uid: 6, prompt: "You usually...", choice_a: "Show your feelings freely", choice_b: "Keep your feelings to yourself", result_a: "E1", result_b: "I0"},
	{ uid: 7, prompt: "When you have a special job to do, you like to...", choice_a: "Organize it carefully before you start", choice_b: "Find out what is necessary as you go along", result_a: "J1", result_b: "P2"},
	{ uid: 8, prompt: "You tend to have...", choice_a: "Broad friendships with many different people", choice_b: "Deep friendships with a few people", result_a: "E2", result_b: "I1"},
	{ uid: 9, prompt: "You admire people who are", choice_a: "Conventional enough never to make themselves conspicuous", choice_b: "Too original and individual to care whether they are conspicuous or not", result_a: "S1", result_b: "N2"},
	{ uid: 10, prompt: "You prefer to...", choice_a: "Arrange picnics, parties, etc. well in advance", choice_b: "Be free to do whatever looks like fun when the time comes", result_a: "J2", result_b: "P1"},
	{ uid: 11, prompt: "You usually get along better with...", choice_a: "Realistic people", choice_b: "Imaginative people", result_a: "S1", result_b: "N2"},
	{ uid: 12, prompt: "When you are with a group of people, you would rather...", choice_a: "Join in the talk of the group", choice_b: "Sit back and mostly listen", result_a: "E1", result_b: "I2"},
	{ uid: 13, prompt: "It is a higher compliment to be called...", choice_a: "A person of real feeling", choice_b: "A consistently reasonable person", result_a: "F1", result_b: "T2"},
	{ uid: 14, prompt: "In reading for pleasure, you...", choice_a: "Enjoy odd or original ways of saying things", choice_b: "Like writers to say exactly what they mean", result_a: "N0", result_b: "S1"},
	{ uid: 15, prompt: "You...", choice_a: "Talk easily to almost anyone for as long as you have to", choice_b: "Find a lot to say only to certain people or under certain conditions", result_a: "E2", result_b: "I2"},
	{ uid: 16, prompt: "Following a schedule...", choice_a: "Appeals to you", choice_b: "Cramps you", result_a: "J2", result_b: "P2"},
	{ uid: 17, prompt: "When it is settled well in advance that you will do a certain thing at a certain time, you find it...", choice_a: "Nice to be able to plan accordingly", choice_b: "A little unpleasant to be tied down", result_a: "J1", result_b: "P1"},
	{ uid: 18, prompt: "You are more successful...", choice_a: "At following a carefully worked out plan", choice_b: "Dealing with the unexpected and seeing quickly what should be done", result_a: "J1", result_b: "P1"},
	{ uid: 19, prompt: "You would rather be considered...", choice_a: "A practical person", choice_b: "An ingenious person", result_a: "S2", result_b: "N2"},
	{ uid: 20, prompt: "In a large group, you more often...", choice_a: "Introduce others", choice_b: "Get introduced", result_a: "E2", result_b: "I2"},
	{ uid: 21, prompt: "You usually...", choice_a: "Value sentiment more than logic", choice_b: "Value logic more than sentiments", result_a: "F2", result_b: "T2"},
	{ uid: 22, prompt: "You would rather have as a friend...", choice_a: "Someone who is always coming up with new ideas", choice_b: "Someone who has both feet on the ground", result_a: "N1", result_b: "S2"},
	{ uid: 23, prompt: "The new people you meet tell what you are interested in...", choice_a: "Right away", choice_b: "Only after they really get to know you", result_a: "E1", result_b: "I1"},
	{ uid: 24, prompt: "Which word in each pair appeals to you more?", choice_a: "Scheduled", choice_b: "Unplanned", result_a: "J2", result_b: "P2"},
	{ uid: 25, prompt: "Which word in each pair appeals to you more?", choice_a: "Facts", choice_b: "Ideas", result_a: "S2", result_b: "N1"},
	{ uid: 26, prompt: "Which word in each pair appeals to you more?", choice_a: "Quiet", choice_b: "Hearty", result_a: "I2", result_b: "E2"},
	{ uid: 27, prompt: "Which word in each pair appeals to you more?", choice_a: "Convincing", choice_b: "Touching", result_a: "T2", result_b: "F1"},
	{ uid: 28, prompt: "Which word in each pair appeals to you more?", choice_a: "Imaginative", choice_b: "Matter-of-fact", result_a: "N0", result_b: "S2"},
	{ uid: 29, prompt: "Which word in each pair appeals to you more?", choice_a: "Benefits", choice_b: "Blessings", result_a: "T1", result_b: "F1"},
	{ uid: 30, prompt: "Which word in each pair appeals to you more?", choice_a: "Peacemaker", choice_b: "Judge", result_a: "F0", result_b: "T2"},
	{ uid: 31, prompt: "Which word in each pair appeals to you more?", choice_a: "Systematic", choice_b: "Spontaneous", result_a: "J2", result_b: "P2"},
	{ uid: 32, prompt: "Which word in each pair appeals to you more?", choice_a: "Statement", choice_b: "Concept", result_a: "S2", result_b: "N1"},
	{ uid: 33, prompt: "Which word in each pair appeals to you more?", choice_a: "Reserved", choice_b: "Talkative", result_a: "I1", result_b: "E2"},
	{ uid: 34, prompt: "Which word in each pair appeals to you more?", choice_a: "Analyze", choice_b: "Sympathize", result_a: "T1", result_b: "F2"},
	{ uid: 35, prompt: "Which word in each pair appeals to you more?", choice_a: "Create", choice_b: "Make", result_a: "N0", result_b: "S2"},
	{ uid: 36, prompt: "Which word in each pair appeals to you more?", choice_a: "Determined", choice_b: "Devoted", result_a: "T1", result_b: "F1"},
	{ uid: 37, prompt: "Which word in each pair appeals to you more?", choice_a: "Gentle", choice_b: "Firm", result_a: "F1", result_b: "T2"},
	{ uid: 38, prompt: "Which word in each pair appeals to you more?", choice_a: "Systematic", choice_b: "Casual", result_a: "J2", result_b: "P2"},
	{ uid: 39, prompt: "Which word in each pair appeals to you more?", choice_a: "Certainty", choice_b: "Theory", result_a: "S1", result_b: "N2"},	
	{ uid: 40, prompt: "Which word in each pair appeals to you more?", choice_a: "Calm", choice_b: "Lively", result_a: "I1", result_b: "E1"},
	{ uid: 41, prompt: "Which word in each pair appeals to you more?", choice_a: "Justice", choice_b: "Mercy", result_a: "T1", result_b: "F2"},
	{ uid: 42, prompt: "Which word in each pair appeals to you more?", choice_a: "Fascinating", choice_b: "Sensible", result_a: "N0", result_b: "S2"},
	{ uid: 43, prompt: "Which word in each pair appeals to you more?", choice_a: "Firm-Minded", choice_b: "Warm-Hearted", result_a: "T2", result_b: "F0"},
	{ uid: 44, prompt: "Which word in each pair appeals to you more?", choice_a: "Feeling", choice_b: "Thinking", result_a: "F1", result_b: "T2"},
	{ uid: 45, prompt: "Which word in each pair appeals to you more?", choice_a: "Literal", choice_b: "Figurative", result_a: "S1", result_b: "N1"},
	{ uid: 46, prompt: "Which word in each pair appeals to you more?", choice_a: "Foresight", choice_b: "Compassion", result_a: "T2", result_b: "F1"},
	{ uid: 47, prompt: "Which word in each pair appeals to you more?", choice_a: "Hard", choice_b: "Soft", result_a: "T2", result_b: "F0"}
]

types = [
	{ name: "INTJ", url: "http://www.16personalities.com/intj-personality"},
	{ name: "INTP", url: "http://www.16personalities.com/intp-personality"},
	{ name: "ENTJ", url: "http://www.16personalities.com/entj-personality"},
	{ name: "ENTP", url: "http://www.16personalities.com/entp-personality"},
	{ name: "INFJ", url: "http://www.16personalities.com/infj-personality"},
	{ name: "INFP", url: "http://www.16personalities.com/infp-personality"},
	{ name: "ENFJ", url: "http://www.16personalities.com/enfj-personality"},
	{ name: "ENFP", url: "http://www.16personalities.com/enfp-personality"},
	{ name: "ISTJ", url: "http://www.16personalities.com/istj-personality"},
	{ name: "ISFJ", url: "http://www.16personalities.com/isfj-personality"},
	{ name: "ESTJ", url: "http://www.16personalities.com/estj-personality"},
	{ name: "ESFJ", url: "http://www.16personalities.com/esfj-personality"},
	{ name: "ISTP", url: "http://www.16personalities.com/istp-personality"},
	{ name: "ISFP", url: "http://www.16personalities.com/isfp-personality"},
	{ name: "ESTP", url: "http://www.16personalities.com/estp-personality"},
	{ name: "ESFP", url: "http://www.16personalities.com/esfp-personality"}
]

User.destroy_all
Type.destroy_all
Question.destroy_all

types.each { |type| Type.create(type) }
questions.each { |question| Question.create(question) }

# user = User.create(email: "eugenestapler@gmail.com", password: "password", binary_string: "123456745362711234567453627112345674536271111111")
