var isUserWindowOn = false;
var isSignupWindow = false;
var isSigninWindow = false;
var isProfileWindow = false;
var isUserWindowFocus = false;
var curToken = null;


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

function openProfile(e) {
    isUserWindowOn = true;
    isProfileWindow = true;

    e.className = "profile focus";

    showUserWindow("profile");
}

function onLogout(e) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            window.location = "/";
        }
    };
    var logoutUrl = "/api/logout";
    if (curToken != null) {
        logoutUrl += "/" + curToken;
    }
    xhr.open("GET", logoutUrl, true);
    xhr.send();
}

function showUserWindow(action) {
    var windowE = document.getElementById('user-window');
    var signupPanel = document.getElementById("signup-panel");
    var loginPanel = document.getElementById("login-panel");
    var profilePanel = document.getElementById("profile-panel");

    if (windowE != null) {
        windowE.classList.add("fadeInRight");
        windowE.classList.remove("fadeOutRight");
        windowE.style.display = "block";
    }

    if (action == 'signup') {
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
    } else if (action == 'profile') {

        isUserWindowOn = true;
        isProfileWindow = true;

        profilePanel.style.display = "flex";
    }
}

window.addEventListener('click', function (e) {
    var signUpBtn = document.getElementById('signupBtn');
    var loginBtn = document.getElementById('loginBtn');
    var profileBtn = document.getElementById('profileBtn');

    var signupPanel = document.getElementById("signup-panel");
    var loginPanel = document.getElementById("login-panel");
    var profilePanel = document.getElementById("profile-panel");


    if (document.getElementById('user-window').contains(e.target) ||
        (signUpBtn != null && signUpBtn.contains(e.target)) ||
        (loginBtn != null && loginBtn.contains(e.target)) ||
        (profileBtn != null && profileBtn.contains(e.target))) {

        isUserWindowFocus = true;
    } else {
        if (isUserWindowOn && isUserWindowFocus) {
            isUserWindowOn = false;
            isUserWindowFocus = false;
            isSigninWindow = false;
            isSignupWindow = false;
            isProfileWindow = false;

            var userWindowE = document.getElementById('user-window');
            userWindowE.classList.remove("fadeInRight");
            userWindowE.classList.add("fadeOutRight");
            this.setTimeout(function () {
                if (!isUserWindowOn) {
                    userWindowE.style.display = "none";
                    signupPanel.style.display = "none";
                    loginPanel.style.display = "none";
                    profilePanel.style.display = "none";
                }
            }, 600);
        }
    }
});

var reloadIndex = function () {
    if (this.readyState == 4 && this.status == 200) {
        document.body.innerHTML = this.responseText;
    }
};

function onLoginRequestSubmit(e) {
    var username = document.getElementById("login-username");
    var password = document.getElementById("login-password");

    var loginReq = {
        "username": username.value,
        "password": password.value
    };

    var xmlText = obj2XML(loginReq, "login-request");

    console.log(xmlText);

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            console.log(this.responseText);
            var oParser = new DOMParser();
            var oDOM = oParser.parseFromString(this.responseText, "application/xml");

            var token = oDOM.evaluate("//token/text()", oDOM, null, XPathResult.STRING_TYPE, null).stringValue;

            if (token === "") {
                showLoginResponseMessage("Tên tài khoản hoặc mật khẩu sai!");
            } else {
                var reXHR = new XMLHttpRequest();
                reXHR.onreadystatechange = reloadIndex;
                reXHR.open("POST", "/", true);
                reXHR.setRequestHeader("Content-Type", "application/xml");
                reXHR.send(oDOM);
                curToken = token;
            }
        }
    };


    xhr.open("POST", "/api/login", true);
    xhr.setRequestHeader("Content-Type", "application/xml");
    xhr.send(xmlText);
}

function showLoginResponseMessage(msg) {
    var msgBox = document.getElementById("login-msg");
    msgBox.className = "message-box animated";
    if (msgBox.childNodes.length > 0) {
        console.log(msgBox.childNodes[0]);
        msgBox.childNodes[0].remove();
    }
    msgBox.appendChild(document.createTextNode(msg));


    this.setTimeout(function () {
        msgBox.classList.add("shake");
    }, 300);
}

