//Names: Spencer Pullins & Ann Costantino
//Date: Februrary 9, 2017
//JS for PROJ 2
//IMPORTANT: onload to call function from HTML
//DONT USE DOT

//Global var for Plan
var CurrentPlan;  /*= new plan("Best Plan", "2017-2018", "Computer Science", "Spanncer", "Spring");*/

$.getJSON('localhost:3000/plans/1.json', function(data) {
		CurrentPlan = new plan(data.name, data.currYear, data.major, data.student, data.currTerm);
		
		//for loop to cycle through courses and add them
		for (var schoolClass in data.courses) {
			CurrentPlan.addClass(data.courses[schoolClass].term, data.courses[schoolClass].year, data.courses[schoolClass].id, data.courses[schoolClass].name, data.courses[schoolClass].credits);
		}
		
	});

var today = new Date();
var fallClass;
var springClass;
var summerClass;


//main function
function populatePage(){
	
	//Step 1. Add classes to courses hash
	//20:fall
	/*
	CurrentPlan.addClass("Fall", "2014", "BIO-1001", "Introduction to Apes");
	CurrentPlan.addClass("Fall", "2014", "COMM-1002", "How to Talk Like a Monkey");
	CurrentPlan.addClass("Fall", "2014", "HIS-1003", "Banana Origins");
	CurrentPlan.addClass("Fall", "2014", "SCI-1004", "Nit Picking 101");
	CurrentPlan.addClass("Fall", "2014", "BUS-1005", "Dressing Like a Monkey");
	CurrentPlan.addClass("Fall", "2015", "CS-2001", "Foundations of Banana Security");
	CurrentPlan.addClass("Fall", "2015", "PACL-2002", "The Art of Tree Swinging");
	CurrentPlan.addClass("Fall", "2015", "PSYCH-2003", "Napping for Monkeys");
	CurrentPlan.addClass("Fall", "2015", "COMM-2004", "Advanced Monkey Talk");
	CurrentPlan.addClass("Fall", "2015", "HIS-2005", "The Birth of Harambe");
	CurrentPlan.addClass("Fall", "2016", "COMM-3001", "How to Befriend a Gorilla");
	CurrentPlan.addClass("Fall", "2016", "HIS-3002", "The Death of Harambe");
	CurrentPlan.addClass("Fall", "2016", "MATH-3003", "Apes in Mathematics");
	CurrentPlan.addClass("Fall", "2016", "COM-3004", "The New Ape Dialect");
	CurrentPlan.addClass("Fall", "2016", "ENG-3005", "How to Peel a Banana");
	CurrentPlan.addClass("Fall", "2017", "BIB-4001", "Harambe Resurrected");
	CurrentPlan.addClass("Fall", "2017", "BIB-4002", "What the Bible Says About Apes");
	CurrentPlan.addClass("Fall", "2017", "BDM-4003", "Monkey Movies");
	CurrentPlan.addClass("Fall", "2017", "BUS-4004", "The Art of Deception: Monkey Style");
	CurrentPlan.addClass("Fall", "2017", "HIS-4005", "The Future for Apes in America");
	
	//20:spring
	CurrentPlan.addClass("Spring", "2014", "CS-1006", "How to Monkey Around");
	CurrentPlan.addClass("Spring", "2014", "ART-1007", "The Arts & Monkeys");
	CurrentPlan.addClass("Spring", "2014", "COMM-1008", "Intermediate Monkey Talk");
	CurrentPlan.addClass("Spring", "2014", "SCI-1009", "Types of Bananas");
	CurrentPlan.addClass("Spring", "2014", "HIS-1010", "Monkeys Around the World");
	CurrentPlan.addClass("Spring", "2015", "HIS-2006", "Politics and Ape Culture");
	CurrentPlan.addClass("Spring", "2015", "HIS-2007", "The Life of Harambe");
	CurrentPlan.addClass("Spring", "2015", "ENG-2008", "How to Escape a Zoo");
	CurrentPlan.addClass("Spring", "2015", "HIS-2009", "History of Apes");
	CurrentPlan.addClass("Spring", "2015", "CHEM-2010", "Apes and Chemistry");
	CurrentPlan.addClass("Spring", "2016", "BIO-3006", "Through the Eyes of an Ape");
	CurrentPlan.addClass("Spring", "2016", "ENG-3007", "Intermediate Banana Peeling");
	CurrentPlan.addClass("Spring", "2016", "ART-3008", "Drawing Apes");
	CurrentPlan.addClass("Spring", "2016", "BIB-3009", "What God Says About Apes");
	CurrentPlan.addClass("Spring", "2016", "CS-3010", "Monkeying Around with the Web");
	CurrentPlan.addClass("Spring", "2017", "ENG-4006", "Professional Banana Peeling");
	CurrentPlan.addClass("Spring", "2017", "HIS-4007", "Gorilla Warfare");
	CurrentPlan.addClass("Spring", "2017", "CHEM-4008", "Advanced Apes and Chemistry");
	CurrentPlan.addClass("Spring", "2017", "ENG-4009", "Monkeys in the Workforce");
	CurrentPlan.addClass("Spring", "2017", "ENG-4010", "Monkey Seminar");
	
	//2:summer
	CurrentPlan.addClass("Summer", "2015", "COMM-5001", "Write Like a Monkey 101");
	CurrentPlan.addClass("Summer", "2016", "BUS-5002", "Monkey Business");
	*/
	
	/*= new plan("Best Plan", "2017-2018", "Computer Science", "Spanncer", "Spring");*/
	
	
	//Step 2. Re-organize by Year
	CurrentPlan.convertToYear();
	
	//Step 3. Populate page with divs holding the data
	CurrentPlan.printData();
}


//Constructor for plan
//var plan = function(){};
function plan(planName, catalogYear, major, studentName, currentSem){
	this.planName = planName;
	this.catalogYear = catalogYear;
	this.major = major;
	this.studentName = studentName;
	this.currentSem = currentSem;
	this.courses = {};
	this.years = {};
}

//Function to add a class to courses
plan.prototype.addClass = function(term, years, courseNumber, courseName, credits){
	//Supposed to be }, but it doesn't work!
	this.courses[courseNumber] = new course(term, years, courseNumber, courseName, credits);
};

//Constructor for course
function course(term, year, courseNumber, courseName, credits){
	this.term = term;
	this.year = year;
	this.courseNumber = courseNumber;
	this.courseName = courseName;
	this.credits = credits;
}

//Constructor for year
function year(currentYear){
	this.currentYear = currentYear;
	this.fall = {};
	this.spring = {};
	this.summer = {};
}

//SOS
//Function to convert data into year hash
plan.prototype.convertToYear = function(){
	for(var key in CurrentPlan.courses){
		
		//Grab year for course
		var currYear = this.courses[key].year;
		
		//SOS If year doesn't exist in year hash, create year object and add to hash
		if(!this.years[currYear]){
			this.years[currYear] = new year(currYear);
		}
		
		//Place course in the corresponding term hash in year
		//Fall
		if(this.courses[key].term === "Fall"){
			this.years[currYear].fall[this.courses[key].courseNumber] = this.courses[key];
		}
		
		//Spring
		else if (this.courses[key].term === "Spring"){
			this.years[currYear].spring[this.courses[key].courseNumber] = this.courses[key];
		}
		
		//Else
		else{
			this.years[currYear].summer[this.courses[key].courseNumber] = this.courses[key];
		}
	}
	//TODO: Create years any years inbetween that have not been created
	
};

plan.prototype.printData = function(){
	//TODO: Print the data structure in the UR div
	var html = "<table>";
	for(key in CurrentPlan.years){
		var curYear = this.years[key].currentYear;
		//Check to see if year is history or current
		checkDate(curYear);
		
			html += "<tr>";
			//Dont know if I can call variables like this or if it will just be text
				html+= "<th class=  \"" + fallClass + "\">Fall " + curYear + "</th>";
				html+= "<th class=  \"" + springClass + "\">Spring " +(parseInt(curYear) + 1) + "</th>";
				html+= "<th class=  \"" + summerClass + "\">Summer " + (parseInt(curYear) + 1)  + "</th>";
				html+= "</tr>";
				//Start row for Fall Spring and Summer
				html+="<tr class=\"" + curYear + "\">";
				//Create Fall table
				html+= "<td class=  \"" + fallClass + "\">";
				html+="<ul>";
				for(FA in CurrentPlan.years[key].fall){
					var idFall = this.years[key].fall[FA].courseNumber;
					var nameFall = this.years[key].fall[FA].courseName;
					html+="<li>" + idFall  + ": " + nameFall + "</li>";
				}
				html+="</ul>";
				html+="</td>";
				
				//Create Spring table
				html+= "<td class=  \"" + springClass + "\">";
				html+="<ul>";
				for(SP in CurrentPlan.years[key].spring){
					var idSpring = this.years[key].spring[SP].courseNumber;
					var nameSpring = this.years[key].spring[SP].courseName;
					html+="<li>" + idSpring  + ": " + nameSpring + "</li>";
				}
				html+="</ul>";
				html+="</td>";
				
				//Create Summer table
				html+= "<td class=  \"" + summerClass + "\">";
				html+="<ul>";
				for(SU in CurrentPlan.years[key].summer){
					var idSummer = this.years[key].summer[SU].courseNumber;
					var nameSummer = this.years[key].summer[SU].courseName;
					html+="<li>" + idSummer  + ": " + nameSummer + "</li>";
				}
				html+="</ul>";
				html+="</td>";
				//End the tr for Fall Spring and Summer
				html+="</tr>";
	}
	html += "</table>";
	
	document.getElementById('UR').innerHTML = html;
};

checkDate = function(year) {
	fall = new Date("8/23/" + year);
	spring = new Date("1/10/" + (parseInt(year) + 1));
	summer = new Date("5/29/" + (parseInt(year) + 1));
	
	if(fall < today){
			fallClass = "history";
	}
	else{
			fallClass = "current";
	}
	
	if(spring < today){
		springClass = "history";
	}
	else{
		springClass = "current";
	}
	
	if(summer < today){
		summerClass = "history";
	}
	else{
		summerClass = "current";
	}
};