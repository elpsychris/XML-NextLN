var isUserWindowOn = false;
var isSignupWindow = false;
var isSigninWindow = false;
var isProfileWindow = false;
var isUserWindowFocus = false;



function onRunCrawler(e) {
    if (e.className == null) {
        e = e.target;
    }

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = onRunCrawlerRequestStateChange;

    if (e.className.indexOf("run") != -1) {
        xhttp.open("GET", "run", true);
        xhttp.send();
    }

    changeButtonSet(e);
}

function onRunCrawlerRequestStateChange() {
    if (this.readyState == 4 && this.status == 200) {
        console.log(this.responseText);
    }
}

function changeButtonSet(e) {
    if (e.className.indexOf("run") != -1) {
        var parent = e.parentElement;
        var newBtn = document.createElement("div");

        newBtn.className = "action-btn stop";
        newBtn.appendChild(document.createTextNode("Stop"));
        newBtn.addEventListener("click", onRunCrawler);

        e.className = "action-btn pause";
        e.childNodes[0].remove();
        e.appendChild(document.createTextNode("Pause"));

        parent.appendChild(newBtn);

    } else {
        var parent = e.parentElement;
        for (var i = 0; i < parent.children.length; i++) {
            if (parent.children[i] != e) {
                parent.children[i].remove();
            }
        }

        var btnRun = parent.children[0];
        btnRun.className = "action-btn run";
        btnRun.childNodes[0].remove();
        btnRun.appendChild(document.createTextNode("Run"));
    }
}


function openSignup(e) {
    e.className = "signup focus";

    var parent = e.parentElement;
    parent.children[1].className = "login";

    showUserWindow('signup');
}

function openLogin(e) {
    isUserWindowOn = true;
    isSigninWindow = true;

    e.className = "login focus";

    var parent = e.parentElement;
    parent.children[0].className = "signup";

    showUserWindow("login");
}

function showUserWindow(action) {
    var windowE = document.getElementById('user-window');
    var signupPanel = document.getElementById("signup-panel");
    var loginPanel = document.getElementById("login-panel");

    if (windowE != null) {
        windowE.classList.add("fadeInRight");
        windowE.classList.remove("fadeOutRight");
        windowE.style.display = "block";
    }

    if (action == 'signup') {
        console.log(windowE);
        signupPanel.className = "signup-content animated";

        if (isSigninWindow) {
            isSigninWindow = false;
            loginPanel.classList.add("fadeOutRight");

            signupPanel.classList.add("fadeInLeft");
            signupPanel.style.display = "flex";

            this.setTimeout(function () {
                if (!isSigninWindow) {
                    loginPanel.style.display = "none";
                }
            }, 600);
        } else {
            signupPanel.style.display = "flex";
        }

        signupPanel.style.display = "flex";

        isUserWindowOn = true;
        isSignupWindow = true;
    } else if (action == "login") {
        loginPanel.className = "login-content animated";

        if (isSignupWindow) {
            isSignupWindow = false;
            signupPanel.classList.add("fadeOutLeft");

            loginPanel.classList.add("fadeInRight");
            loginPanel.style.display = "flex";

            this.setTimeout(function () {
                if (!isSignupWindow) {
                    signupPanel.style.display = "none";
                }
            }, 600);
        } else {
            loginPanel.style.display = "flex";
        }

        isUserWindowOn = true;
        isSigninWindow = true;
    }
}

window.addEventListener('click', function (e) {
    var signUpBtn = document.getElementById('signupBtn');
    var loginBtn = document.getElementById('loginBtn');

    var signupPanel = document.getElementById("signup-panel");
    var loginPanel = document.getElementById("login-panel");

    if (document.getElementById('user-window').contains(e.target) ||
        signUpBtn.contains(e.target) ||
        loginBtn.contains(e.target)) {
        console.log("focus");
        isUserWindowFocus = true;
    } else {
        console.log("blur");
        if (isUserWindowOn && isUserWindowFocus) {
            isUserWindowOn = false;
            isUserWindowFocus = false;
            isSigninWindow = false;
            isSignupWindow = false;

            var userWindowE = document.getElementById('user-window');
            userWindowE.classList.remove("fadeInRight");
            userWindowE.classList.add("fadeOutRight");
            this.setTimeout(function() {
                if (!isUserWindowOn) {
                    userWindowE.style.display = "none";
                    signupPanel.style.display = "none";
                    loginPanel.style.display = "none";
                }
            }, 600);
        }
    }
})