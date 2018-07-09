var isUserWindowOn = false;
var isSignupWindow = false;
var isSigninWindow = false;
var isProfileWindow = false;
var isUserWindowFocus = false;
var curToken = null;
var lockCrawlAct = {};

function onGenreCheck(e) {
    var checkGenre = e.getElementsByClassName("check-genre")[0];
    if (checkGenre != null) {
        checkGenre.checked = !checkGenre.checked;
        onChangeFilter(checkGenre);
    }
}

function onActCrawler(e, name) {
    if (e.className == null) {
        var target = e.target;
        e = target.pE;
        name = e.parentElement.id.replace("btn-set-", "");
    }
    var act = e.classList[e.classList.length - 1];
    var errMsgId = "err-msg-" + name;
    var showErr = function (msg) {
        var errMsgE = document.getElementById(errMsgId);

        errMsgE.className = "err-msg animated";
        setTimeout(function () {
            errMsgE.classList.add("shake");
        }, 200);
        if (errMsgE.childNodes.length > 0) {
            errMsgE.childNodes[0].remove();
        }
        errMsgE.appendChild(document.createTextNode(msg));
    };

    if (lockCrawlAct[name]) {
        showErr("Đang chờ phản hồi");
        return;
    }
    lockCrawlAct[name] = true;


    var xhttp = new XMLHttpRequest();
    if (act == "run") {
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                lockCrawlAct[name] = false;
                var msg = this.responseText;
                if (msg !== "") {
                    showErr(msg);
                } else {
                    changeButtonSet(e);
                }
            }
        };

        xhttp.open("GET", "/crawl/run/" + name, true);
    } else if (act == "stop") {
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                lockCrawlAct[name] = false;
                var msg = this.responseText;
                if (msg !== "") {
                    showErr(msg);
                } else {
                    changeButtonSet(e, name);
                }
            }
        };

        xhttp.open("GET", "/crawl/stop/" + name, true);
    }
    xhttp.send();
}

function changeButtonSet(e, name) {
    if (e.classList.contains("run")) {
        var parent = e.parentElement;
        newBtn = document.createElement("div");

        newBtn.className = "action-btn stop";
        newBtn.appendChild(document.createTextNode("Stop"));
        newBtn.addEventListener("click", onActCrawler);
        newBtn.pE = newBtn;

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

function openLoginProject(e) {
    isUserWindowOn = true;
    isSigninWindow = true;

    showUserWindow("login");
}


function openSignupProject(e) {
    isUserWindowOn = true;
    isSigninWindow = true;

    showUserWindow('signup');
}

function openProfileProject(e) {
    isUserWindowOn = true;
    isProfileWindow = true;
    showUserWindow("profile");
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
            clearBookmarkSaved();
        }
    };
    var logoutUrl = "/api/logout";
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

if (document.getElementById('user-window') != null) {
    window.addEventListener('click', function (e) {
            var signUpBtn = document.getElementById('signupBtn');
            var loginBtn = document.getElementById('loginBtn');
            var profileBtn = document.getElementById('profileBtn');
            var burgerBtn = document.getElementById('burgerBtn');

            var signupPanel = document.getElementById("signup-panel");
            var loginPanel = document.getElementById("login-panel");
            var profilePanel = document.getElementById("profile-panel");

            if (burgerBtn != null) {
                if (document.getElementById('user-window').contains(e.target) ||
                    (burgerBtn != null && burgerBtn.contains(e.target))) {

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
                                if (signupPanel != null) {
                                    signupPanel.style.display = "none";
                                }
                                if (loginPanel != null) {
                                    loginPanel.style.display = "none";
                                }
                                if (profilePanel != null) {
                                    profilePanel.style.display = "none";
                                }
                            }
                        }, 600);
                    }
                }
            } else {
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
                                if (signupPanel != null) {
                                    signupPanel.style.display = "none";
                                }
                                if (loginPanel != null) {
                                    loginPanel.style.display = "none";
                                }
                                if (profilePanel != null) {
                                    profilePanel.style.display = "none";
                                }
                            }
                        }, 600);
                    }
                } // end if burgerBtn
            }

        }
    );
}


var reloadIndex = function () {
    if (this.readyState == 4 && this.status == 200) {
        document.body.innerHTML = this.responseText;
        setBookmarkStatus();
    }
};

function onSignupRequestSubmit(e) {

    var username = document.getElementById("signup-username").value;
    var rg = /^[a-zA-Z0-9]{1,30}$/i;
    if (!rg.test(username)) {
        showSignupResponseMessage("Tên tài khoản không hợp lệ!");
        return;
    }
    var password = document.getElementById("signup-password").value;
    var confirm = document.getElementById("signup-confirm").value;
    if (password !== confirm) {
        showSignupResponseMessage("Mật khẩu xác nhận không khớp!");
        return;
    }

    var signupReq = {
        "username": username,
        "password": password
    };
    var xmlText = obj2XML(signupReq, "account", "http://t3.com/2018/project-page");

    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function (ev) {
        if (this.readyState == 4 && this.status == 200) {
            if (this.responseText == "true") {
                showSignupResponseMessage("Đăng ký thành công");
            } else {
                showSignupResponseMessage("Tài khoản đã tồn tại");
            }
        }
    };
    xhr.open("POST", "/api/signup");
    xhr.setRequestHeader("Content-Type", "application/xml");
    xhr.send(xmlText);
}

function onLoginRequestSubmit(e) {
    var username = document.getElementById("login-username");
    var password = document.getElementById("login-password");

    var loginReq = {
        "username": username.value,
        "password": password.value
    };

    var xmlText = obj2XML(loginReq, "login-request");


    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var oParser = new DOMParser();
            var oDOM = oParser.parseFromString(this.responseText, "application/xml");

            var token = oDOM.evaluate("//token/text()", oDOM, null, XPathResult.STRING_TYPE, null).stringValue;

            if (token === "") {
                showLoginResponseMessage("Tên tài khoản hoặc mật khẩu sai!");
            } else {
                var reXHR = new XMLHttpRequest();
                reXHR.onreadystatechange = reloadIndex;
                reXHR.open("GET", window.location.href.replace("http://localhost:8080",""), true);
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

function showSignupResponseMessage(msg) {
    var msgBox = document.getElementById("signup-msg");
    msgBox.className = "message-box animated";
    if (msgBox.childNodes.length > 0) {
        msgBox.childNodes[0].remove();
    }
    msgBox.appendChild(document.createTextNode(msg));
}

function showLoginResponseMessage(msg) {
    var msgBox = document.getElementById("login-msg");
    msgBox.className = "message-box animated";
    if (msgBox.childNodes.length > 0) {
        msgBox.childNodes[0].remove();
    }
    msgBox.appendChild(document.createTextNode(msg));


    this.setTimeout(function () {
        msgBox.classList.add("shake");
    }, 300);
}