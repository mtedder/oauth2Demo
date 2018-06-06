<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result</title>
</head>
<body>

<img id="avatarImg" src=""></img>

<script type="text/javascript">
/*
 * GitHub AP docs
 * Ref: https://developer.github.com/apps/building-oauth-apps/authorizing-oauth-apps/
 */

var url = window.location.href;

var params = url.split("?");

var paramsArray = params[1].split("&");
var code = paramsArray[0].split("=")[1];

//console.log(code);

//Use code to get access token
getAccessToken(code);

/*
 * Get access token using code passed in as a parameter
 */
function getAccessToken(code){
	  var xhttp = new XMLHttpRequest();
	  
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {	      
	    	var jsonObject = JSON.parse(this.responseText);	      
			getUserData(jsonObject.access_token);
	    }else{
	    	console.log('There was a problem with the request.' + this.status);
	    }
	  };
	  
	  xhttp.open("POST", "https://github.com/login/oauth/access_token", true);
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");//indicates we are sending form data
	  xhttp.setRequestHeader("Accept", "application/json");//return access token in json format
	  xhttp.send("client_id=XXXXXX&client_secret=XXXXXXXXXX&redirect_uri=http://localhost:8080/result&code=" + code);
}

/*
 * Get user information using access token passed in as a paramter
 */
 function getUserData(token){
	  var xhttp = new XMLHttpRequest();
	  
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {	     
	    	var jsonObject = JSON.parse(this.responseText);
	    	var avatarUrl = jsonObject.avatar_url;
	    	//dynamically add an image tag to the DOM with avatar url as the source
	      	var imageTag = document.getElementById("avatarImg");
	      	imageTag.src = avatarUrl;//set image src attribute to users github avatar image	    	
	    }else{
	    	console.log('There was a problem with the token request.' + this.status);
	    }
	  };
	  
	  xhttp.open("GET", "https://api.github.com/user?access_token=" + token, true);
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  xhttp.setRequestHeader("Accept", "application/json");//return user data in json format
	  xhttp.send();
}
</script>
</body>
</html>