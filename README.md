evolving_personality
====================
Evolving Personality uses the myers-briggs test to examine the way that our personalities change over time.
Upon signup, the whole test is administered, and counts are taken for E, I, S, N, T, F, J, and P.
These are then represented graphically, in multiple ways. 
Every day thereafter, 10 random questions are asked, and answered. And those answers are updated, and shown on the graph.

Models:
	User
		-has_many records
		-has 

Scenario One:
- New user goes to home page //
- Not logged in so redirected to login page //
- Clicks sign up button, redirected to sign up page 
- User signs up with email address and password
- Submits info and is redirected to questionaire page
- Questionairre page shows each question, prompt on top, choice a on left, choice b on right, slider in between
- After filling out each thing, form submitted with data for each slider and question uid
- On submission, the user's binary string is updated
- The user's binary string is used to calculate the E/I, S/N, T/F, J/P values for the current_user, and these are saved to the current user's records
- that record is then associated with a personality type
- The user is then redirected to the home page, which contains a graph of their records, their current personality type, and representation of their current personality type. There is a button that allows the user to get a 5 question mini questionnaire, there is a button for logging out. There is a link that takes them to 16 personalities' description page.

Necessary Routes:
root | get '/' | pages#home
new_user_session | get '/users/sign_in' | devise/sessions#new
new_user_registration | get '/users/sign_up' | devise/registrations#new
... | get '/questionnaire' | pages#questionnaire
... | patch 'users/binary_string' | users#binary_string
... | post 'records/create' | records#create

Necessary Controller Actions:
- Pages
	- get home
		- redirects to signin page if no session 
		- otherwise checks if questionnaire complete
		- if yes, 
			- redirects to questionnaire
		- if no, 
			- gets current user's formatted records
			- renders home page 
	- get questionnaire
		- finds all indices of x's in user's binary string
		- gets all questions with those indices 
		- renders questionnaire

- Users
	- patch binary_string
		- replaces five random questions in user's binary string with x
		-	updates binary string for current user, using params from patch request
		- redirects to questionnaire

- Records
	- post create 
		- takes data hash, containing question ids and numbers
		- updates user's binary string with that data hash

Necessary Models:
- Users
	- formatted_records
		- returns the users formatted records, newest to oldest, in the following format [ {EI: 4, SN: -2, TF: 3, JP: -5, type_name: "ENTP", type_url: "BLAHBLAHBLAH", created_at: blahblhablah }, ... ]
	- questionnaire_complete?
		- returns true if no x's in binary string 
		- returns false if x's in binary string.
	- remove_bytes(number)
		-replaces specififed number of random bytes with an x
	- incompleted_bytes
		-returns indices of incompleted bytes in user's binary string
	- update_binary_string({id: 24, answer: 4},...,...)
		- for each hash in the array, takes the question's id and answer, and updates the user's binary string with it.
	- log_new_record
		- takes current binary string, and creates a new record with specified EI, SN, TF, JP, and type_name, type_url

- Record
	- def initialize, gets EI, SN, TF, and JP, and with that makes type name and type url from association with record.
	- to_hash
		- returns a hash for the record in the following format {EI: 4, SN: -2, TF: 3, JP: -5, type_name: "ENTP", type_url: "BLAHBLAHBLAH", created_at: blahblhablah }

- Questionnaire
	- get_scores_from(binary_string)
		- takes a binary string, and converts it to a json hash, containing EI, SN, TF, JP, type_name, type_url"

- Question
	- return_score
		- takes 