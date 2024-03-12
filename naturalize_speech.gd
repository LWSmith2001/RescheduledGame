extends Node


func capital(number):
	match number:
		0:
			return "The 1st"
		1:
			return "The 2nd"
		2:
			return "The 3rd"
		20:
			return "The 21st"
		21:
			return "The 22nd"
		22:
			return "The 23rd"
	
	return "The " + str(number + 1) + "th"
	
func uncapital(number):
	match number:
		0:
			return "the 1st"
		1:
			return "the 2nd"
		2:
			return "the 3rd"
		20:
			return "the 21st"
		21:
			return "the 22nd"
		22:
			return "the 23rd"

	return "the " + str(number + 1) + "th"
