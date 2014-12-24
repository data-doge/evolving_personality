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
- New user goes to home page
- Not logged in so redirected to login page
- Clicks sign up button, redirected to sign up page
- User signs up with email address and password
- Submits info and is redirected to questionaire page
- Questionairre page shows each question, prompt on top, choice a on left, choice b on right, slider in between
- After filling out each thing, form submitted with data for each slider and question uid
- On submission, the user's binary string is updated
- The user's binary string is used to calculate the E/I, S/N, T/F, J/P values for the current_user, and these are saved to the current user's records
- The user is then redirected to the home page, which contains a graph of their records, their current personality type, and representation of their current personality type. There is a button that allows the user to get a 5 question mini questionnaire, there is a button for logging out. There is a link that takes them to 16 personalities' description page.

Necessary Routes:
root | get '/' | pages#home
new_user_session | get '/users/sign_in' | devise/sessions#new
new_user_registration | get '/users/sign_up' | devise/registrations#new
... | get '/questionnaire' | pages#questionnaire
... | post '/users/records/create' | users/records#create
... | patch '/users/records/update' | users/records#update

Necessary Controller Actions:
- Pages
	- home
		- if no current_user
			- redirect to new_user_session
		- else 
			- get users formatted records
			- 

Necessary Models:
- User

- Record
	- has_one :type

- Types

- Question
