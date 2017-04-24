//Names: Spencer Pullins & Ann Costantino
//Date: Februrary 25, 2017
//JS for PROJ 3
//IMPORTANT: onload to call function from HTML...OK
var CA;
        //change this to courses.json builder?
$.getJSON('localhost:3000/plans/2.json', function(data) {
		CA = new courseArray();
		//for loop to cycle through courses and add them
		for (var schoolClass in data) {
			CA.addCourse(data[schoolClass].number, data[schoolClass].name, data[schoolClass].description, data[schoolClass].credits);
		}

	});

function createTable(){
			CA.printTable();
}

function courseArray(){
	this.courses = {};
};
function tableCourse(courseNumber, courseName, courseDes, cred){
	this.courseNumber = courseNumber;
	this.courseName = courseName;
	this.courseDes = courseDes;
	this.cred = cred;
};
courseArray.prototype.addCourse = function(courseNumber, courseName, courseDes, cred){
	this.courses[courseNumber] = new tableCourse(courseNumber, courseName, courseDes, cred);
};

courseArray.prototype.printTable = function(){
	var html = "<input type=\"text\" id=\"tableInput\" onkeyup=\"filterTable()\" placeholder=\"Find the right Banana (Course)\">";
	html += "<table id=\"searchTable\">";
		html += "<tr class=\"header\">";
			html+= "<th>Course ID</th>" + "<th>Name</th>" +"<th>Credits</th>" ;
		html+= "</tr>";
	for(var key2 in CA.courses){
		html+="<tr>";
			html+= "<td>"+CA.courses[key2].courseNumber+"</td>" + "<td>"+CA.courses[key2].courseName+"</td>" + "<td>"+CA.courses[key2].cred+"</td>";
		html+="</tr>";
	}
	html += "</table>";
	
	document.getElementById('LR').innerHTML = html;
};

function filterTable(){
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("tableInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("searchTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    td2 = tr[i].getElementsByTagName("td")[1];
    if (td || td2) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1 || td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
};