extends Node

var subtractive_messages = ["%time% works for me", "I believe %time% should work", "Looks like %time% also works for me", "My hairstylist cancelled, so %time% is now open for me", "Class got cancelled for %time%, that's open", "Just cancelled a date, %time% is open all day for me"]

var additive_messages = ["%time% doesn't work for me", "I have pilates on %time%", "Turns out I'm busy on %time%", "I'm going kayaking on %time%", "%time% is 'me time'", "I want to keep %time% open", "Found out I'm volunteering during %time%", "Going fishing with my dad %time%"]

var nonsequitor_messages = ["What's everyone doing for dinner?", "Did anyone here watch The Oscars?", "Just bought a new game", 
"Who wants to throw stuff off roofs later", "Just went to Wendy's, why are they so square??", "To the Joker the Insane Clown Posse looks like the Normal Clown Posse, think about it", 
"You wouldn't believe the guy I saw at work today", "Why am I hearing so much about 'sneaky links,' doesn't that kind of defeat the purpose?", 
"The news bums me out so bad, even playing League is preferable", "My cat is resting in a sunbeam right now, be jealous", "Bit into a coin thinking it was chocolate, bad news...", 
"Who up Sausagin' they McMuffin?", "Punched a hole in my TV playing VR, will set up a gofundme later", 
"Feeling like arguing in Youtube comments later, anyone else in?", "Just experienced ego death. I don't really see what the hype is about", 
"Landlord just came by, kicked him in the head", "What's a skibidi", "Found a chicken nugget shaped like Abe Lincoln", "Indiana Jones would serve in some booty shorts", 
"My cat just woke up from a nap solely to vomit and leave", "Does anyone know how hard iguanas are to train?", "Just had an amazing business idea, call me if you want in", 
"Now I don't want to get political...", "Did you hear what Steve said to Billy and Penny?", "Why's it still called Broadway? It's 2024, have some respect"]

var weekday_subtractive_messages = ["My weekdays are open", "Weekdays should work for me", "I'm free Monday through Friday"]
var weekend_subtractive_messages = ["Weekends work for me", "I'm free on Saturday and Sunday", "I don't have anything on the weekend"]

var weekday_additive_messages = ["Weekdays do not work for me", "I'm unavailable most weekdays", "I have work on Monday through Friday"]
var weekend_additive_messages = ["Weekends do not work for me", "I've got another thing on Saturdays and Sundays", "I'm out of town on the weekends"]

var user_names = ["Levi", "Noah", "Adam", "Alec", "Duke", "Andrew", "Rohan", "Aidan", "Soupdrink", "John", "Mark", "Luke", "Chris", "Emily", "Anne", "Kelly", "Mary", "Grace", "Kyra", "Hayden", "Kyle", "Kim"]
var user_icon_paths = ["res://assets/user_icons/RescheduledIcon1.png","res://assets/user_icons/RescheduledIcon2.png","res://assets/user_icons/RescheduledIcon3.png","res://assets/user_icons/RescheduledIcon4.png","res://assets/user_icons/RescheduledIcon5.png"]


func refill_fields():
	user_names = ["Levi", "Noah", "Adam", "Alec", "Duke", "Andrew", "Rohan", "Aidan", "Soupdrink", "Delphi", "John", "Mark", "Luke", "Chris", "Emily", "Anne", "Kelly", "Mary", "Grace", "Kyra", "Hayden", "Kyle", "Kim"]
	user_icon_paths = ["res://assets/user_icons/RescheduledIcon1.png","res://assets/user_icons/RescheduledIcon2.png","res://assets/user_icons/RescheduledIcon3.png","res://assets/user_icons/RescheduledIcon4.png","res://assets/user_icons/RescheduledIcon5.png"]
