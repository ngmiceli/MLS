function resetHelpBox()
{
	$("#help-box").removeClass("box_glow").addClass("box_shadow2");
	document.getElementById("help-box").textContent = "Scroll your mouse over anything to get a description about it here";
}

function updateHelpBox(itemName)
{
	var helpBox = document.getElementById("help-box");
	var c = $(".current");
	c.removeClass("current");
	c.addClass("currentInvis");
	var current = $(".currentInvis");
	var hBox = $("#help-box");
	hBox.removeClass("box_shadow2");
	hBox.addClass("box_glow");
	
	switch(itemName)
	{
		case "Welcome":
			helpBox.textContent = "A checklist of things you can do to explore MyLifeSpheres";
			break;
		case "Messages":
			helpBox.textContent = "Messages sent to you privately by professionals or as replies to your public questions";
			break;
		case "Info":
			helpBox.textContent = "Add or edit your personal details, resume, and other information you want professionals to see";
			break;
		case "Professions":
			helpBox.textContent = "Look at the professions you have saved and quickly jump to their pages";
			break;
		case "Bookmarks":
			helpBox.textContent = "Access the bookmarks you have logged throughout MyLifeSpheres";
			break;
		case "Tools":
			helpBox.textContent = "Access useful tools and quick links for MyLifeSpheres";
			break;
		case "logout":
			helpBox.textContent = "Log out of MyLifeSpheres and return to the main page, or edit the website settings";
			break;
		case "spheres-link":
			helpBox.textContent = "Jump right to your Sphere - thats this page!";
			break;
		case "private-messages":
			helpBox.textContent = "This shows how many unread PRIVATE messages you have. Click here to jump to your Public Messages page";
			break;
		case "public-messages":
			helpBox.textContent = "This shows how many unread PUBLIC messages you have. Click here to jump to your Private Messages page";
			break;
		case "messages-public":
			helpBox.textContent = "This tab shows the public messages you are watching and allows you read, reply to, or delete them."
			break;
		case "messages-private":
			helpBox.textContent = "This tab shows your private messages with professionals and allows you to read, reply to, or delete them."
			break;
		case "delete-public-message":
			helpBox.textContent = "Stop watching this thread. The thread and all its posts will still remain, but will no longer appear here."
			break;
		case "delete-private-message":
			helpBox.textContent = "Delete this private message thread. This action cannot be undone.";
			break;
		case "visible-invisible":
			helpBox.textContent = "Click to toggle whether this information is visible (open eye) on your public profile or not (closed eye)."; 
			break;
		case "short college":
			helpBox.textContent = "The name of the college must be at least 3 characters. Please spell out the name";		
			break;
		case "delete college":
			helpBox.textContent = "Delete this college and its information from the profile";
			break;
		case "delete job":
			helpBox.textContent = "Delete this job and its information from the profile";
			break;
		case "delete":
			helpBox.textContent = "Delete this line from the profile";
			break;
		case "invalid email":
			helpBox.textContent = "This email address is not valid. Please check the address and try again";
			break;
		case "invalid phone":
			helpBox.textContent = "This is not a valid phone number. Please use the form (123)456-7890 or 123-456-7890."
			break;
		case "short job":
			helpBox.textContent = "The name of the company where you worked must be at least 3 characters. Please elaborate";
			break;
		case "validation errors":
			helpBox.textContent = "There are some errors on this page that need to be fixed first; then save again."
			break;
		case "sphereslink":
			helpBox.textContent = "Brings you to the LifeSpheres page";
			break;
		default: 
			helpBox.textContent = "Scroll your mouse over anything to get a description about it here";
			hBox.addClass("box_shadow2");
			hBox.removeClass("box_glow");
			break;
	}
	
	switch(itemName)
	{
		case "Welcome":
		case "Messages":
		case "Profile":
		case "Info":
		case "Spheres":
		case "College":
		case "Professions":
		case "Bookmarks":
		case "Tools":
			break;
		default:
			current.addClass("current");
			break;
	}
	
} //end updateHelpBox
